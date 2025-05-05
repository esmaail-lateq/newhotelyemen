import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as map;
import 'package:geolocator_platform_interface/src/models/position.dart' as pos;
import 'package:turf/src/polyline.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:newhotelyemeni/core/class/statusRquest.dart';
import 'package:newhotelyemeni/core/consttint/map_layer_constins.dart';
import 'package:newhotelyemeni/core/function/handling.dart';
import 'package:newhotelyemeni/core/function/string_to_list.dart';
import 'package:newhotelyemeni/features/hotelsLocations/controller/helper_class.dart';
import 'package:newhotelyemeni/features/hotelsLocations/controller/hotel_controller.dart';
import 'package:newhotelyemeni/features/hotelsLocations/data/get_rout_line_coordinates.dart';
import 'package:newhotelyemeni/features/hotelsLocations/view/widget/map_bottom_sheet.dart';

class MapboxActionsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  PointAnnotationManager? pointAnnotationManager;
  AnimationController? controller;
  RoutData routData = RoutData(Get.find());
  late map.MapboxMap mapboxMapController;
  Map? routDataReault;
  Animation<double>? animation;
  Rx<StatusRquest> statusRquest = StatusRquest.nune.obs;
  final defaultEdgeInsets =
      MbxEdgeInsets(top: 100, left: 100, bottom: 100, right: 100);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    controller?.dispose();
    super.onClose();
  }

  void addLayerAndSource(
      map.MapboxMap mapboxMap, List<HotelModel> hotels) async {
    mapboxMap.style.styleSourceExists("point_source").then((value) async {
      if (!value) {
        final ByteData bytes =
            // await rootBundle.load('assets/symbols/custom-icon.png');
            await rootBundle.load('assets/images/symbols/location.png');
        final Uint8List list = bytes.buffer.asUint8List();
        mapboxMap.style.addStyleImage("icon", 1.0,
            MbxImage(width: 40, height: 40, data: list), false, [], [], null);

        mapboxMap.style.addStyleSource(
            "point_source", json.encode(iconHotelsData(hotels)));
      }
    });

    mapboxMap.style.styleLayerExists("point_layer").then((value) async {
      if (!value) {
        mapboxMap.style.addStyleLayer(json.encode(pointLayer), null);

        mapboxMap.style
            .setStyleLayerProperties("point_layer", json.encode(mapIconStyle));
      }
    });
    mapboxMap.style.styleLayerExists("hotels-text-layer").then((value) async {
      if (!value) {
        mapboxMap.style.addStyleLayer(json.encode(textHotelLayer), null);

        mapboxMap.style.setStyleLayerProperties(
            "hotels-text-layer", json.encode(textHotelStyle));
      }
    });

    addClickAction();
  }

  addClickAction() {
    var tapInteractionBuggy = TapInteraction(
        FeaturesetDescriptor(layerId: "point_layer"), (features, point) async {
      statusRquest.value = StatusRquest.loading;
      showHotelBottomSheet(
          features.properties['name'].toString(),
          features.properties['description'].toString(),
          stringToList(features.properties['images'].toString()));

      final start = await mapboxMapController.style.getPuckPosition();

      await fetchRoutDataCoordinates(
          start!,
          Position(double.parse(features.properties['longitude'].toString()),
              double.parse(features.properties['latitude'].toString())));

      // Get.bottomSheet(_buildHotelDetailsCard(
      //   features.properties['name'].toString(),
      //   features.properties['description'].toString(),
      //   () async {
      // final start = await mapboxMapController.style.getPuckPosition();
      // print(features.properties['images']);

      // var coordinates = await routData.fetchRouteCoordinates(
      //     start!,
      //     Position(
      //         double.parse(features.properties['longitude'].toString()),
      //         double.parse(features.properties['latitude'].toString())));
      //     // await fetchRouteCoordinates(start!, point.point.coordinates);

      //     // drawRouteLowLevel(coordinates);
      //     Get.back();
      //   },
      // ));
      if (kDebugMode) {
        print('${features.properties['name'].toString()}');
      }
    }, radius: 100);

    mapboxMapController.addInteraction(tapInteractionBuggy,
        interactionID: "tap_interaction_buggy");
  }

  void addRouteLineLayerAndSource() async {
    await mapboxMapController.style.addLayer(lineLayerStyle);
    mapboxMapController.style
        .addSource(GeoJsonSource(id: "source", lineMetrics: true));
  }

  fetchRoutDataCoordinates(Position start, Position end) async {
    statusRquest.value = StatusRquest.loading;

    try {
      var resposn = await routData.fetchRouteCoordinates(start, end);

      var statusRquest1 = handling(resposn);

      if (statusRquest1 == StatusRquest.success) {
        routDataReault = resposn;
        statusRquest.value = StatusRquest.success;
      } else {
        statusRquest.value = StatusRquest.failure;
      }
    } catch (e) {
      statusRquest.value = StatusRquest.serverfailure;
    }
  }

  void findNearstHotel(
      pos.Position userPosition, List<HotelModel> hotels) async {
    HotelModel? result = NearestPointFinder.findNearestHotel(
        userLat: userPosition.latitude,
        userLon: userPosition.longitude,
        hotels: hotels);

    if (result != null) {
      // var coordinates = await routData.fetchRouteCoordinates(
      //     Position(userPosition.longitude, userPosition.latitude),
      //     Position(result.longitude, result.latitude));
      statusRquest.value = StatusRquest.loading;

      changeCameraPosition(Position(result.longitude, result.latitude));
      showHotelBottomSheet(result.name, result.description, result.images);

      await fetchRoutDataCoordinates(
          Position(userPosition.longitude, userPosition.latitude),
          Position(result.longitude, result.latitude));
      // print(coordinates);

      // drawRouteLowLevel(coordinates);
    }
  }

  drawRoutLineAndChangeCameraPostition(String coordint) async {
    final position = await mapboxMapController.style.getPuckPosition();

    Get.back();
    changeCameraPosition(position!);
    drawRouteLowLevel(Polyline.decode(coordint));
  }

  drawRouteLowLevel(List<Position> polyline) async {
    final line = LineString(coordinates: polyline);
    final source = await mapboxMapController.style.getSource("source");
    (source as GeoJsonSource).updateGeoJSON(json.encode(line));

    // animate layer to reveal it from start to end
    controller?.stop();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 1.0).animate(controller!)
      ..addListener(() async {
        // set the animated value of lineTrim and update the layer
        mapboxMapController.style.setStyleLayerProperty(
            "layer", "line-trim-offset", [animation?.value, 1.0]);
      });
    controller?.forward();
  }

  void changeCameraPosition(Position position) async {
    mapboxMapController.flyTo(
        CameraOptions(
          center: Point(coordinates: position),
          padding: defaultEdgeInsets,
          zoom: 14,
        ),
        MapAnimationOptions(duration: 1200, startDelay: 0));
  }
}
