// services/location_service.dart

import 'package:geolocator/geolocator.dart';

class LocationService {
  /// تحقق من تفعيل الـ GPS
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  /// تحقق من حالة الصلاحيات
  Future<LocationPermission> checkPermission() async {
    return await Geolocator.checkPermission();
  }

  /// طلب الصلاحية
  Future<LocationPermission> requestPermission() async {
    return await Geolocator.requestPermission();
  }

  /// فتح إعدادات التطبيق
  Future<void> openAppSettings() async {
    await Geolocator.openAppSettings();
  }
  Future<void> openLocationAppSettings() async {
    await Geolocator.openLocationSettings();
  }

  /// إرجاع الموقع الحالي
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  /// تتبع مستمر للموقع
  Stream<Position> getLocationStream() {
    return Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    );
  }
}