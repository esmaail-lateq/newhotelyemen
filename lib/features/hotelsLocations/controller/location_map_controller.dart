import 'package:flutter/material.dart';
import 'package:geolocator_android/geolocator_android.dart';
import 'package:get/get.dart';

import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as map;

import 'package:geolocator_platform_interface/src/models/position.dart' as pos;
import 'package:newhotelyemeni/core/class/statusRquest.dart';
import 'package:newhotelyemeni/features/hotelsLocations/controller/location_servies.dart';


class LocationMapController extends GetxController with WidgetsBindingObserver {
  // and.GeolocatorAndroid geolocatorAndroid = and.GeolocatorAndroid();
  final LocationService locationService = LocationService();
  LocationPermission? result;
  RxBool isLocationEnabled = false.obs;
  RxBool hasPermission = false.obs;
  RxBool permissionDeniedForever = false.obs;
  Rx<pos.Position?> currentPosition = Rx<pos.Position?>(null);

  Rx<PreimssionStatusRquest> statusRquest = PreimssionStatusRquest.nune.obs;

  List<Map<String, dynamic>> hotelsData = [];

  // MapboxMap
  late map.MapboxMap mapboxMapController;

  @override
  void onInit() async {
    await requestUserLocationPermission();
    WidgetsBinding.instance.addObserver(this);

    // await getUserLocation();

    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    WidgetsBinding.instance.removeObserver(this);

    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print(state);
    if (state == AppLifecycleState.resumed) {
      // result = await geolocatorAndroid.requestPermission();
      // await requestUserLocationPermission();

      if (await checkPermissionAndExecute()) {
        // hasPermission.value = true;
        await getUserLocation();

        // update();
      }
    }
  }

  Future<void> getUserLocation() async {
    print('1111111111111111111111111111111111111');
    // statusRquest = StatusRquest.loading;
    // update();

    if (await checkLoctionServiceOn()) {
      isLocationEnabled.value = true;

      currentPosition.value = await locationService.getCurrentLocation();
      print('33333333333333333333333333333333333333');
      print(currentPosition.value);
      // fetchData();
    } else {
      // showDialogForOpenLocationService();
      // statusRquest.value = PreimssionStatusRquest.locationOff;

      // update();
    }
    // update();
  }

  Future<void> requestUserLocationPermission() async {
    statusRquest.value = PreimssionStatusRquest.loading;
    // update();
    // // print(mapboxMapController);

    result = await locationService.requestPermission();
    print(result);
    if (result == LocationPermission.always ||
        result == LocationPermission.whileInUse) {
      // await getUserLocation();
      //  statusRquest.value = PreimssionStatusRquest.perimssionAllow;
      hasPermission.value = true;
      permissionDeniedForever.value = false;

      // isPerimssionAllow = true;

      // update();
    } else if (result == LocationPermission.denied) {
      await locationService.requestPermission();
      permissionDeniedForever.value = true;

      // checkPermissionAndExecute();
      print('this don');
      // statusRquest.value = PreimssionStatusRquest.perimssionNotAllow;
      // update();
    } else {
      // showDialogForAckPerimssion();
      // statusRquest.value = PreimssionStatusRquest.perimssionNotAllow;
      permissionDeniedForever.value = true;
      // update();
    }
    statusRquest.value = PreimssionStatusRquest.nune;
  }

  Future<bool> checkPermissionAndExecute() async {
    var statusResult = await locationService.checkPermission();
    // result = statusResult;
    print('#########################$result');
    print('#########################$statusResult');

    if (statusResult == LocationPermission.always ||
        statusResult == LocationPermission.whileInUse) {
      permissionDeniedForever.value = false;
      hasPermission.value = true;

      // isPerimssionAllow = true;
      // update();
      return true;
    }
    if (statusResult == LocationPermission.denied) {
      // locationService.requestPermission();
      permissionDeniedForever.value = true;
      print('object');
    }
    // if (result == LocationPermission.deniedForever) {
    //   // locationService.requestPermission();
    //   permissionDeniedForever.value = true;
    //   print('object');
    // }
    return false;
  }

  Future<bool> checkLoctionServiceOn() async {
 
    if (hasPermission.value &&
        await locationService.isLocationServiceEnabled()) {
      // isLocationServiceOn = true;
      // update();


      return true;
    } else {
      

      return false;
    }
  }

  // Future<void> showDialogForAckPerimssion() async {
  //   Get.defaultDialog(
  //     title: 'صلاحية الوصول للموقع',
  //     middleText:
  //         'لاتستطيع اكمال البحث عن اقرب فندق بدون منح صلاحية الوصول للموقع من الاعدادت',
  //     textConfirm: 'فتح الاعدادات',
  //     onConfirm: () async {
  //       Get.back();

  //       await geolocatorAndroid.openAppSettings();
  //     },
  //     onCancel: () => Get.back(),
  //   );
  // }

  Future<void> showDialogForOpenLocationService() async {
    Get.defaultDialog(
      title: ' قم بتفعيل الموقع الجغرافي ',
      middleText:
          'لاتستطيع اكمال البحث عن اقرب فندق بدون تشغيل الموقع الجغرافي   ',
      textConfirm: 'فتح الاعدادات',
      onConfirm: () async {
        Get.back();

        await locationService.openLocationAppSettings();
      },
      onCancel: () => Get.back(),
    );
  }

  Future<void> fetchData() async {
    // statusRquest.value = PreimssionStatusRquest.loading;
    // update();

    // try {
    //   if (true) {
    //     List<Map<String, dynamic>> fackeResponsData = [
    //       {'lat': 15.3694, 'lng': 44.180},
    //       {'lat': 15.3537, 'lng': 44.2074},
    //       {'lat': 15.3742, 'lng': 44.2150},
    //       {'lat': 15.3688, 'lng': 44.2002},
    //       {'lat': 15.3650, 'lng': 44.2105},
    //     ];

    //     hotelsData.addAll(fackeResponsData);
    //     //  statusRquest.value = StatusRquest.success;
    //     // update();
    //   }
    // } catch (_) {}
  }

  // void addNearestMarker(
  //     map.MapboxMap mapboxController, List<Map<String, dynamic>> data) async {
  //   for (var hotel in data) {
  //     var annotationApi = mapboxController.annotations;
  //     map.CircleAnnotationManager? circleAnnotationManager =
  //         await annotationApi?.createCircleAnnotationManager();

  //     map.CircleAnnotationOptions cc = map.CircleAnnotationOptions(
  //       geometry:
  //           map.Point(coordinates: map.Position(hotel['lng'], hotel['lat'])),
  //       circleRadius: 8,
  //     );

  //     circleAnnotationManager!.create(cc);
  //   }
  //   update();
  // }
}
