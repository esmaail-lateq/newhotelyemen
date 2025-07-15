import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/class/statusRquest.dart';
import 'package:newhotelyemeni/core/function/handling.dart';


class HotelsDetailsController extends GetxController {

Map<String, Map<String, dynamic>> serviceInfo = {
  "Internet": {
    "label": "إنترنت",
    "icon": Icons.wifi,
  },
  "swimming pool": {
    "label": "مسبح",
    "icon": Icons.pool,
  },
  "parking": {
    "label": "موقف سيارات",
    "icon": Icons.local_parking,
  },
  "restaurant": {
    "label": "مطعم",
    "icon": Icons.restaurant,
  },
  "local markets": {
    "label": "أسواق محلية",
    "icon": Icons.store,
  },
  "lounges": {
    "label": "صالات",
    "icon": Icons.chair,
  },
  "planes": {
    "label": "خدمة نقل للمطار",
    "icon": Icons.airplanemode_active,
  },
};


  late List cateData = [];
  // ServesViewData servesViewData = ServesViewData(Get.find());
  StatusRquest statusRquest = StatusRquest.nune;
  late String hotelid;
  List serves = [];

  getServes() async {
    print("dfgfdsgdfsgsdfgdsfgsdfgsdfg");
    statusRquest = StatusRquest.loading;
    update();
    var response = {};
    print("dfgfdsgdfsgsdfgdsfgsdfgsdfg");
    statusRquest = handling(response);
    update();
    if (statusRquest == StatusRquest.success) {
      serves.addAll(response['data']);
      print(response['data']);
    } else {}
  }

  @override
  void onInit() {
    // cateData = Get.arguments['cateogry'];
    // hotelid = Get.arguments['hotelId'];
    hotelid = '1';
    getServes();
    super.onInit();
  }
}
