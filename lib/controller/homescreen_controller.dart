import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/class/statusRquest.dart';
import 'package:newhotelyemeni/core/function/handling.dart';
import 'package:newhotelyemeni/data/model/catogry_model.dart';
import 'package:newhotelyemeni/data/model/hotel_model.dart';
import 'package:newhotelyemeni/data/model/hotelitems_model.dart';
import 'package:newhotelyemeni/data/sours/remout/home/home_data.dart';
import 'package:newhotelyemeni/data/sours/remout/home/hotelitems_data.dart';
import 'package:newhotelyemeni/view/screen/hotel_details_screen.dart';

class HomeScreenController extends GetxController {
  HomeData homeData = HomeData(Get.find());
  HotelItemsData hotelItemsData = HotelItemsData(Get.find());
  List<ModelCateogrey> servicesData = [];
  List<ModelHotel> hoteldata = [];
  List<ModelHotelitems> hotelitems = [];
  StatusRquest statusRquest = StatusRquest.nune;
  int? selectcate;
  chaingCateo(int index, String cato) {
    selectcate = index;
    getHotelItems(cato);
    update();
  }

  getData() async {
    print("objectfefafaefwa");
    statusRquest = StatusRquest.loading;
    update();
    var response = await homeData.postData();
    statusRquest = handling(response);
    update();
    if (statusRquest == StatusRquest.success) {
      if (response['stutes'] == "success") {
        List responsecateo = response['cateogreys'];
        List responsehotel = response['hotel'];
        servicesData
            .addAll(responsecateo.map((e) => ModelCateogrey.fromJson(e)));
        hoteldata.addAll(responsehotel.map((e) => ModelHotel.fromJson(e)));
      } else {
        statusRquest = StatusRquest.failure;
      }
    } else {}
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
    getData();
    super.onInit();
  }
}
