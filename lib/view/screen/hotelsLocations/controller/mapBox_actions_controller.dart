import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as map;
import 'package:geolocator_platform_interface/src/models/position.dart' as pos;

import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:newhotelyemeni/view/screen/hotelsLocations/controller/helper_class.dart';
import 'package:newhotelyemeni/view/screen/hotelsLocations/controller/hotel_controller.dart';
import 'package:newhotelyemeni/view/screen/hotelsLocations/data/get_rout_line_coordinates.dart';

class MapboxActionsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  PointAnnotationManager? pointAnnotationManager;
  AnimationController? controller;
  late map.MapboxMap mapboxMapController;
  Animation<double>? animation;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void addLayerAndSource(
      map.MapboxMap mapboxMap, List<HotelModel> hotels) async {
    mapboxMap.style.styleSourceExists("point_source").then((value) async {
      if (!value) {
        final ByteData bytes =
            await rootBundle.load('assets/images/hotelLocation.png');
        final Uint8List list = bytes.buffer.asUint8List();
        mapboxMap.style.addStyleImage(
            "icon",
            1.0,
            MbxImage(width: 1024, height: 1024, data: list),
            true,
            [],
            [],
            null);

        var data = {
          'type': 'geojson',
          'data': {
            'type': 'FeatureCollection',
            'features': hotels
                .map(
                  (e) => e.toGeoJson(),
                )
                .toList()
          }
        };

        mapboxMap?.style.addStyleSource("point_source", json.encode(data));
      }
    });

    mapboxMap.style.styleLayerExists("point_layer").then((value) async {
      if (!value) {
        var layer = {
          "id": "point_layer",
          "type": "symbol",
          "source": "point_source"
        };
        mapboxMap.style.addStyleLayer(json.encode(layer), null);
        var properties = {
          "icon-image": "icon",
          "icon-opacity": 1.0,
          "icon-size": [
            "interpolate",
            ["linear"],
            ["zoom"],
            8,
            0.0,
            10,
            0.02,
            12,
            0.03,
            13,
            0.048,
          ],
          "icon-allow-overlap": true,
          "icon-color": "RED"
        };
        mapboxMap?.style
            .setStyleLayerProperties("point_layer", json.encode(properties));
      }
    });
    mapboxMap.style.styleLayerExists("hotels-text-layer").then((value) async {
      if (!value) {
        var layer = {
          "id": "hotels-text-layer",
          "type": "symbol",
          "source": "point_source"
        };
        mapboxMap?.style.addStyleLayer(json.encode(layer), null);
        var properties = {
          // "minZoom": 10,
          "layout": {
            "text-field": ["get", "name"],
            "text-size": [
              "interpolate",
              ["linear"],
              ["zoom"],
              8,
              0.0,
              10,
              8,
              12,
              10,
            ],
            "text-offset": [0, 1.9],
            // "text-visibility": [
            //   "step",
            //   ["zoom"],
            //   8,
            //   "none",
            //   13,
            //   "visible"
            // ]
          },
          "paint": {
            "text-color": "#e74c3c",
            // "text-halo-color": "#ffffff",
            "text-halo-width": 1.5
          }
        };
        mapboxMap?.style.setStyleLayerProperties(
            "hotels-text-layer", json.encode(properties));
      }
    });
    var tapInteractionBuggy = TapInteraction(
        FeaturesetDescriptor(layerId: "point_layer"), (features, point) {
      Get.bottomSheet(_buildHotelDetailsCard(
        features.properties['name'].toString(),
        features.properties['description'].toString(),
        () async {
          final start = await mapboxMapController.style.getPuckPosition();
          print(features.properties['longitude']);

          final coordinates = await fetchRouteCoordinates(
              start!,
              Position(
                  double.parse(features.properties['longitude'].toString()),
                  double.parse(features.properties['latitude'].toString())));
          // await fetchRouteCoordinates(start!, point.point.coordinates);

          drawRouteLowLevel(coordinates);
          Get.back();
        },
      ));
      print('${features.properties['name'].toString()}');
    }, radius: 100);

    mapboxMap.addInteraction(tapInteractionBuggy,
        interactionID: "tap_interaction_buggy");
  }

  void addRouteLineLayerAndSource() async {
    await mapboxMapController.style.addLayer(LineLayer(
      id: 'layer',
      sourceId: 'source',
      lineCap: LineCap.ROUND,
      lineJoin: LineJoin.ROUND,
      lineBlur: 1.0,
      lineColor: const Color.fromARGB(255, 64, 169, 255).value,
      // lineDasharray: [1.0, 2.0],
      lineWidth: 5.0,
      // draw layer with gradient
      // lineGradientExpression: [
      //   "interpolate",
      //   ["linear"],
      //   ["line-progress"],
      //   0.0,
      //   ["rgb", 255, 255, 255],
      //   0.4,
      //   ["rgb", 255, 255, 255],
      //   1.0,
      //   ["rgb", 0, 0, 255]
      // ],
    ));
    mapboxMapController.style
        .addSource(GeoJsonSource(id: "source", lineMetrics: true));
  }

  void findNearstHotel(
      pos.Position userPosition, List<HotelModel> hotels) async {
    HotelModel? result = NearestPointFinder.findNearestHotel(
        userLat: userPosition.latitude,
        userLon: userPosition.longitude,
        hotels: hotels);

    if (result != null) {
      final coordinates = await fetchRouteCoordinates(
          Position(userPosition.longitude, userPosition.latitude),
          Position(result.longitude, result.latitude));

      drawRouteLowLevel(coordinates);
    }
  }

  drawRouteLowLevel(List<Position> polyline) async {
    final line = LineString(coordinates: polyline);
    final source = await mapboxMapController.style.getSource("source");
    (source as GeoJsonSource).updateGeoJSON(json.encode(line));
    mapboxMapController.style
        .setStyleLayerProperty("layer", "line-trim-offset", [1.0, 1.0]);

    // // animate layer to reveal it from start to end
    // controller?.stop();
    // controller =
    //     AnimationController(duration: const Duration(seconds: 2), vsync: this);
    // animation = Tween<double>(begin: 0, end: 1.0).animate(controller!)
    //   ..addListener(() async {
    //     // set the animated value of lineTrim and update the layer

    //   });
    // controller?.forward();
  }

  Widget _buildHotelDetailsCard(
      String name, String decs, void Function()? onPressed) {
    return Container(
      width: 250,
      height: 300,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(decs),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  // التنقل إلى صفحة تفاصيل الفندق
                },
                child: Text('عرض التفاصيل'),
              ),
              ElevatedButton(
                onPressed: onPressed,
                child: Text('الاتجاهات'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// // 2. دالة التحديث
//   void _updateAnnotationSizes(double currentZoom) async {
//     final newSize = calculateSizeBasedOnZoom(currentZoom);

//     // final annotations = await pointAnnotationManager?.();

//     // annotations?.forEach((annotation) {
//     //   annotation.iconSize = newSize;
//     //   pointAnnotationManager?.update(annotation);
//     // });
//   }

double calculateSizeBasedOnZoom(double zoom) {
  return zoom.clamp(10, 16).map(10.0, 16.0, 0.5, 1.5);
}

class AnnotationClickListener extends OnPointAnnotationClickListener {
  final Function(HotelModel) onHotelSelected;
  final RxList<HotelModel>? hotels;

  AnnotationClickListener(this.onHotelSelected, this.hotels);

  @override
  void onPointAnnotationClick(PointAnnotation annotation) {
    print("onAnnotationClick, id: ${annotation.id} ${annotation.textField}");
    // final hotelId = annotation.data?['hotelId'];
    // if (hotelId != null) {
    //   final hotel = hotels.firstWhere((h) => h.id == hotelId);
    //   onHotelSelected(hotel);
    // }

    for (var hotel in hotels!) {
      if (hotel.name == annotation.textField) {
        onHotelSelected(hotel);
      }
    }
  }
}

extension on num {
  double map(double fromMin, double fromMax, double toMin, double toMax) {
    return toMin + ((this - fromMin) * (toMax - toMin)) / (fromMax - fromMin);
  }
}

// 3. حساب الحجم بناءً على التكبير


// إضافة امتداد للتحويل الخطي
// extension Range on double {
//   double map(double fromMin, double fromMax, double toMin, double toMax) {
//     return toMin + ((this - fromMin) * (toMax - toMin)) / (fromMax - fromMin);
//   }
// }


