import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator_android/geolocator_android.dart' as and;
// import 'package:geolocator/geolocator.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:geolocator_platform_interface/src/models/position.dart' as pos;
import 'package:newhotelyemeni/core/consttint/images.dart';

class NearestLocationMap extends StatefulWidget {
  @override
  State<NearestLocationMap> createState() => _NearestLocationMapState();
}

class _NearestLocationMapState extends State<NearestLocationMap> {
  late MapboxMap mapboxMap;
  PointAnnotationManager? _pointAnnotationManager;
  late pos.Position? userPosition = null;
  and.GeolocatorAndroid geolocatorAndroid = and.GeolocatorAndroid();

  // النقاط الخمسة (مثال)
  List<Map<String, dynamic>> points = [
    {'lat': 15.3694, 'lng': 44.180},
    {'lat': 15.3537, 'lng': 44.2074},
    {'lat': 15.3742, 'lng': 44.2150},
    {'lat': 15.3688, 'lng': 44.2002},
    {'lat': 15.3650, 'lng': 44.2105},
  ];

  @override
  void initState() {
    super.initState();

    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    print('1111111111111111111111111111111111111');

    if (await geolocatorAndroid.isLocationServiceEnabled()) {
      userPosition = await geolocatorAndroid.getCurrentPosition();
      print('33333333333333333333333333333333333333');
      print(userPosition);
    } else {
      print('9999999999999999999999999999');

      await geolocatorAndroid.requestPermission();
    }

    setState(() {});
  }

  Map<String, dynamic> _findNearestPoint() {
    double minDistance = double.infinity;
    Map<String, dynamic> nearest = points.first;

    for (var point in points) {
      double distance = _calculateDistance(
        userPosition!.latitude,
        userPosition!.longitude,
        point['lat'],
        point['lng'],
      );
      if (distance < minDistance) {
        minDistance = distance;
        nearest = point;
      }
    }

    return nearest;
  }

  double _calculateDistance(lat1, lon1, lat2, lon2) {
    // Haversine formula
    const p = 0.017453292519943295;
    final a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a)); // Distance in km
  }

  void _addNearestMarker() async {
    final nearest = _findNearestPoint();
    print('nerst$nearest');
    final annotationOptions = PointAnnotationOptions(
      geometry: Point(coordinates: Position(nearest['lng'], nearest['lat'])),
      iconImage: AppImages.Imlogo,
      iconSize: 1.5,
    );
    print('nerst$annotationOptions');
    var annotationApi = mapboxMap.annotations;
    CircleAnnotationManager? circleAnnotationManager =
        await annotationApi?.createCircleAnnotationManager();
// Set options for the resulting circle layer.
    CircleAnnotationOptions cc = CircleAnnotationOptions(
      geometry: Point(coordinates: Position(nearest['lng'], nearest['lat'])),
      circleRadius: 8,
    );

    // .withPoint(Point.fromLngLat(18.06, 59.31))
    // // Style the circle that will be added to the map.
    // .withCircleRadius(8.0)
    // .withCircleColor("#ee4e8b")
    // .withCircleStrokeWidth(2.0)
    // .withCircleStrokeColor("#ffffff")
// Add the resulting circle to the map.
// circleAnnotationManager?.create(circleAnnotationOptions).

    // _pointAnnotationManager ??=
    //     await mapboxMap.annotations.createCircleAnnotationManager();

    circleAnnotationManager!.create(cc);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _addNearestMarker();
          },
        ),
        body: MapWidget(
          cameraOptions: CameraOptions(
            center: Point(coordinates: Position(44.191, 15.3694)),
            zoom: 14.0,
          ),
          onMapCreated: (controller) {
            // mapboxMap = controller;
            setState(() {
              mapboxMap = controller;
            });
            mapboxMap.location.updateSettings(
                LocationComponentSettings(enabled: true, pulsingEnabled: true));
          },
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// // import 'package:mapbox_gl/mapbox_gl.dart';
// import 'package:geolocator_android/geolocator_android.dart';
// import 'package:geolocator_platform_interface/src/models/position.dart'as pos;
// import 'dart:math' show pow, sqrt;

// import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

// class NearestPointMap extends StatefulWidget {
//   @override
//   _NearestPointMapState createState() => _NearestPointMapState();
// }

// class _NearestPointMapState extends State<NearestPointMap> {
//   late MapboxMap? mapboxController;
//   GeolocatorAndroid geolocatorAndroid = GeolocatorAndroid();
//   LatLng? userLocation;

//   final List<LatLng> points = [
//     LatLng(15.3694, 44.1910), // صنعاء
//     LatLng(15.3537, 44.2074),
//     LatLng(15.3742, 44.2150),
//     LatLng(15.3688, 44.2002),
//     LatLng(15.3650, 44.2105),
//   ];

//   Future<void> getUserLocation() async {
//     pos.Position position = await geolocatorAndroid.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     setState(() {
//       userLocation = LatLng(position.latitude, position.longitude);
//     });

//     LatLng nearest = getNearestPoint(userLocation!);
//     print("أقرب نقطة: $nearest");

//     mapController.addSymbol(SymbolOptions(
//       geometry: nearest,
//       iconImage: "marker-15",
//     ));
//   }

//   LatLng getNearestPoint(LatLng userLoc) {
//     points.sort((a, b) =>
//         _distanceBetween(userLoc, a).compareTo(_distanceBetween(userLoc, b)));
//     return points.first;
//   }

//   double _distanceBetween(LatLng p1, LatLng p2) {
//     // باستخدام المسافة الإقليدية (ليست دقيقة لمسافات كبيرة، لكنها جيدة للمسافات القصيرة)
//     return sqrt(pow(p1.latitude - p2.latitude, 2) +
//         pow(p1.longitude - p2.longitude, 2));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('أقرب نقطة')),
//       body: MapWidget(
//         // accessToken: String.fromEnvironment('ACCESS_TOKEN'),
//         onMapCreated: (controller) {
//           mapboxController = controller;
//           getUserLocation();
//         },
//         initialCameraPosition: CameraPosition(
//           target: LatLng(15.3694, 44.1910),
//           zoom: 13,
//         ),
//       ),
//     );
//   }
// }




// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/material.dart';
// // import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

// // class HotelLoactionOnMap extends StatefulWidget {
// //   const HotelLoactionOnMap({super.key});

// //   @override
// //   State<HotelLoactionOnMap> createState() => _HotelLoactionOnMapState();
// // }

// // class _HotelLoactionOnMapState extends State<HotelLoactionOnMap> {
// //   MapboxMap? mapboxController;
// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         body: MapWidget(
// //           onMapCreated: (controller) {
// //             setState(() {
// //               mapboxController = controller;
// //             });
// //             mapboxController!.location
// //                 .updateSettings(LocationComponentSettings(enabled: true,pulsingEnabled: true));
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }
