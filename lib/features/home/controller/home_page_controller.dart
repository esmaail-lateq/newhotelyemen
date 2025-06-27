import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/class/statusRquest.dart';
import 'package:newhotelyemeni/core/function/handling.dart';
import 'package:newhotelyemeni/features/home/data/hotel_modle.dart';
import 'package:newhotelyemeni/features/home/data/model/catogry_model.dart';

import 'package:newhotelyemeni/features/home/data/model/model/hotelitems_model.dart';
import 'package:newhotelyemeni/features/home/data/home_data.dart';
import 'package:newhotelyemeni/features/home/data/hotelitems_data.dart';

class HomePageController extends GetxController {
  HomeData homeData = HomeData(Get.find());
  HotelItemsData hotelItemsData = HotelItemsData(Get.find());
  List<ModelCateogrey> servicesData = [];
  final List<HotelsModle> hoteldata = [];
  List<ModelHotelitems> hotelitems = [];
  StatusRquest statusRquest = StatusRquest.nune;
  int? selectcate;

  chaingCateo(int index, String cato) {
    selectcate = index;
    getHotelItems(cato);
    update();
  }

  getDataBy(
      {Map<String, dynamic> filterData = const {
        'city': 'صنعاء',
        'rate': '3.5'
      }}) async {
    hoteldata.clear();
    statusRquest = StatusRquest.loading;
    update();
    try {
      final resposn = await homeData.getData(filterData);
      print(resposn);

      resposn.fold(
        (faileur) {
          print(faileur);
          statusRquest = faileur.status;
          update();
        },
        (data) {
          List dataResponse = data['data']['data'];
          hoteldata.addAll(dataResponse.map(
            (e) => HotelsModle.fromJson(e),
          ));

          statusRquest = StatusRquest.success;
        },
      );
    } catch (e) {
      Get.back();
      print('error: $e');
      Get.defaultDialog(title: "failed".tr, middleText: 'enternal  failer'.tr);
      statusRquest = StatusRquest.serverfailure;
    }
    // print(hoteldata[1].images!.length);

    update();
  }

  getHotelItems(String cateo) async {
    hotelitems.clear();
    update();
    statusRquest = StatusRquest.loading;
    update();
    var response = await hotelItemsData.postData(cateo);
    statusRquest = handling(response);
    update();
    if (statusRquest == StatusRquest.success) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        hotelitems.addAll(responsedata.map((e) => ModelHotelitems.fromJson(e)));
      } else {
        statusRquest = StatusRquest.failure;
        update();
      }
    } else {}
  }

  @override
  void onInit() {
    getDataBy();
    super.onInit();
  }
}
