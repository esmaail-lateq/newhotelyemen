import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:newhotelyemeni/core/class/statusRquest.dart';
import 'package:newhotelyemeni/view/screen/hotelsLocations/controller/hotel_controller.dart';

import 'package:newhotelyemeni/view/screen/hotelsLocations/controller/location_map_controller.dart';
import 'package:newhotelyemeni/view/screen/hotelsLocations/controller/mapBox_actions_controller.dart';

class MapViewScreen extends StatelessWidget {
  const MapViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HotelController hotelController = Get.put(HotelController());
    MapboxActionsController mapboxActionsController =
        Get.put(MapboxActionsController());
    LocationMapController controller = Get.put(LocationMapController());
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Obx(
          () {
            return (controller.statusRquest.value ==
                    PreimssionStatusRquest.loading)
                ? SizedBox()
                : controller.isLocationEnabled.value
                    ? FloatingActionButton(
                        shape: CircleBorder(),
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.location_searching_sharp,
                          size: 30,
                        ),
                        onPressed: () {
                          // _addNearestMarker();
                          // controller.mapboxMapController.setCamera(cameraOptions)
                          controller.mapboxMapController.flyTo(
                              CameraOptions(
                                center: Point(
                                    coordinates: Position(
                                        controller
                                            .currentPosition.value!.longitude,
                                        controller
                                            .currentPosition.value!.latitude)),
                                zoom: 14.0,
                              ),
                              MapAnimationOptions(
                                  duration: 1400, startDelay: 0));
                        },
                      )
                    : FloatingActionButton(
                        shape: CircleBorder(),
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.location_disabled_rounded,
                          color: Colors.red,
                          size: 30,
                        ),
                        onPressed: () {
                          controller.showDialogForOpenLocationService();
                        },
                      );
          },
        ),
        body: Obx(() {
          final position = controller.currentPosition.value;
          if (controller.statusRquest.value == PreimssionStatusRquest.loading) {
            return Center(child: CircularProgressIndicator());
          }
          return (controller.hasPermission.value)
              ? Stack(
                  children: [
                    MapWidget(
                      cameraOptions: position != null
                          ? CameraOptions(
                              center: Point(
                                  coordinates: Position(
                                      position.longitude, position.latitude)),
                              zoom: 14.0,
                            )
                          : CameraOptions(
                              center: Point(
                                  coordinates: Position(48.1164, 15.5527)),
                              zoom: 4.5,
                            ),
                      onMapCreated: (controllerM) {
                        controller.mapboxMapController = controllerM;
                        mapboxActionsController.mapboxMapController =
                            controllerM;
                        // mapboxActionsController.addHotelMarkers(
                        //     controllerM, hotelController.hotels);
                        mapboxActionsController.addLayerAndSource(
                            controllerM, hotelController.hotels);
                        mapboxActionsController.addRouteLineLayerAndSource();

                        controller.mapboxMapController.location.updateSettings(
                            LocationComponentSettings(
                                enabled: true, pulsingEnabled: true));
                      },
                    ),
                    Positioned(
                      bottom: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          mapboxActionsController.findNearstHotel(
                              position!, hotelController.hotels);
                        },
                        child: Text('اقرب فندق'),
                      ),
                    ),
                    // if (!controller.isLocationEnabled.value) _buildGpsWarning(),
                  ],
                )
              : controller.permissionDeniedForever.value
                  ? SizedBox(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('لم يتم منح صلاحية الوصول'),
                            ElevatedButton(
                                onPressed: () {
                                  // controller.geolocatorAndroid
                                  //     .openAppSettings();
                                  controller.locationService.openAppSettings();
                                },
                                child: Text('فتح الاعدادات'))
                          ],
                        ),
                      ),
                    )
                  : SizedBox(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('  منح صلاحية الوصول'),
                            ElevatedButton(
                                onPressed: () async {
                                  // controller.geolocatorAndroid
                                  //     .openAppSettings();
                                  await controller.locationService
                                      .requestPermission();
                                },
                                child: Text('منح الاذن '))
                          ],
                        ),
                      ),
                    );
        }),
      ),
    );
  }

  Widget _buildGpsWarning() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        color: Colors.redAccent,
        padding: EdgeInsets.all(8),
        child: Text(
          "يرجى تفعيل خدمة الموقع (GPS)",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
