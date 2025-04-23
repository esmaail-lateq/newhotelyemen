import 'dart:io';
import 'dart:math';

import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:newhotelyemeni/view/screen/hotelsLocations/controller/hotel_controller.dart';

class NearestPointFinder {
  static double _degToRad(double deg) => deg * pi / 180;

  static double _calculateDistance(
      double lat1, double lon1, double lat2, double lon2) {
    const R = 6371; // نصف قطر الأرض بالكيلومتر
    final dLat = _degToRad(lat2 - lat1);
    final dLon = _degToRad(lon2 - lon1);
    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degToRad(lat1)) *
            cos(_degToRad(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return R * c;
  }

  static HotelModel? findNearestHotel({
    required double userLat,
    required double userLon,
    required List<HotelModel> hotels,
  }) {
    HotelModel? nearest;
    double minDistance = double.infinity;

    for (var hotel in hotels) {
      final distance =
          _calculateDistance(userLat, userLon, hotel.latitude, hotel.longitude);
      if (distance < minDistance) {
        minDistance = distance;
        nearest = hotel;
      }
    }

    return nearest;
  }
}

extension PuckPosition on StyleManager {
  Future<Position?> getPuckPosition() async {
    Layer? layer;
    if (Platform.isAndroid) {
      layer = await getLayer("mapbox-location-indicator-layer");
    } else {
      layer = await getLayer("puck");
    }
    final location = (layer as LocationIndicatorLayer).location;
    if (location == null) {
      return null;
    }
    return Future.value(Position(location[1]!, location[0]!));
  }
}

String formatDistance(
  double distanceKm,
) {
  String distanceText;


  // المسافة
  if (distanceKm < 1) {
    distanceText = "${(distanceKm * 1000).round()} متر";
  } else {
    distanceText = "${distanceKm.toStringAsFixed(1)} كم";
  }

  return distanceText;

}

String formatTime(
  double durationMinutes,
) {
  String timeText;
  // الوقت
  if (durationMinutes < 60) {
    timeText = "${durationMinutes.round()} دقيقة";
  } else {
    int hours = durationMinutes ~/ 60;
    int minutes = (durationMinutes % 60).round();
    if (minutes == 0) {
      timeText = "$hours ساعة";
    } else {
      timeText = "$hours ساعة و $minutes دقيقة";
    }
  }
  return timeText;
}
