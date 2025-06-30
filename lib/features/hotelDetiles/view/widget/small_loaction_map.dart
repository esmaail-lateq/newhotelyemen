import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart'
    show
        CameraOptions,
        MapOptions,
        MapWidget,
        MapboxMap,
        Point,
        PointAnnotationOptions,
        Position;
import 'package:newhotelyemeni/features/home/data/hotel_modle.dart';
// import 'package:mapbox_map_flutter/mapbox_map_flutter.dart';

class SmallLoactionMap extends StatefulWidget {
  final HotelsModle hotelsModle;
  const SmallLoactionMap({super.key, required this.hotelsModle});

  @override
  State<SmallLoactionMap> createState() => _LocationMapState();
}

class _LocationMapState extends State<SmallLoactionMap> {
  MapboxMap? mapController;

  // final List<Point> _locations = [
  //   Point(
  //     title: "IBB Maçka Demokrasi Parkı",
  //     coordinate: const Position(41.0478, 28.9911),
  //   ),
  //   Point(
  //     title: "Dolmabahçe Sarayı",
  //     coordinate: const Position(41.0393, 29.0003),
  //   ),
  //   Point(
  //     title: "Sinanpaşa Mah, Hayrettin İskelesi Sok",
  //     coordinate: const Position(41.0450, 28.9987),
  //   ),
  // ];

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  void _initializeMap() async {
    // await mapController.setStyle(MapboxStyles.MAPBOX_STREETS);
    // _addMarkers();
    _fitCameraToLocations();
  }

  void addMarkers() async {
    final ByteData bytes =
        await rootBundle.load('assets/images/symbols/location.png');
    final Uint8List list = bytes.buffer.asUint8List();
    mapController!.annotations.createPointAnnotationManager().then(
      (value) {
        value?.create(PointAnnotationOptions(
            geometry: Point(coordinates: Position(44.1910, 15.394)),
            textField:widget.hotelsModle.name,
            textOffset: [0.0, 1.0],
            textColor: Colors.black.value,
            iconSize: 2.5,
            iconOffset: [0.0, -5.0],
            symbolSortKey: 10,
            image: list));
      },
    );
    // for (final location in _locations) {
    // mapController.style.addSymbol(
    //   SymbolOptions(
    //     geometry: location.coordinate,
    //     textField: location.title,
    //     textSize: 12,
    //     iconImage: "marker-15",
    //     textOffset: const Offset(0, 2),
    //   ),
    // );
    // }
  }

  void _fitCameraToLocations() {
    // final bounds = LatLngBounds.fromPositionList(
    //   _locations.map((loc) => loc.coordinate).toList(),
    // );

    // _mapController.animateCamera(
    //   CameraUpdate.newLatLngBounds(
    //     bounds: bounds,
    //     padding: const EdgeInsets.all(40),
    //   ),
    // );
  }
  addstyle() {
    mapController?.style.styleSourceExists("source").then((value) async {
      if (!value) {
        var source = await rootBundle.loadString('assets/source.json');
        mapController?.style.addStyleSource("source", source);
      }
    });
    mapController?.style.styleLayerExists("custom").then((value) async {
      if (!value) {
        var layer = await rootBundle.loadString('assets/layer.json');
        mapController?.style.addPersistentStyleLayer(layer, null);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: MapWidget(
        cameraOptions: CameraOptions(
          center: Point(coordinates: Position(double.parse(widget.hotelsModle.longitude!),double.parse(widget.hotelsModle.latitude!))),
          zoom: 14.0,
        ),

        // mapOptions: MapOptions(
        //   styleUri: MapboxStyles.MAPBOX_STREETS,
        //   cameraOptions: const CameraOptions(
        //     center: Position(41.0353, 28.9833), // إحداثيات إسطنبول العامة
        //     zoom: 12,
        //   ),
        // ),
        onMapCreated: (controller) {
          mapController = controller;
          addMarkers();
          addstyle();
        },
      ),
    );
  }
}

// class Point {
//   final String title;
//   final Position coordinate;

//   const Point({
//     required this.title,
//     required this.coordinate,
//   });
// }
