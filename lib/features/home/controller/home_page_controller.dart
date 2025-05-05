import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/class/statusRquest.dart';
import 'package:newhotelyemeni/core/function/handling.dart';
import 'package:newhotelyemeni/features/home/data/model/catogry_model.dart';
import 'package:newhotelyemeni/features/home/data/model/hotel_model.dart';
import 'package:newhotelyemeni/features/home/data/model/model/hotelitems_model.dart';
import 'package:newhotelyemeni/features/home/data/home_data.dart';
import 'package:newhotelyemeni/features/home/data/hotelitems_data.dart';
import 'package:newhotelyemeni/features/hotelDetiles/hotel_details_screen.dart';

class HomePageController extends GetxController {
  HomeData homeData = HomeData(Get.find());
  HotelItemsData hotelItemsData = HotelItemsData(Get.find());
  List<ModelCateogrey> servicesData = [];
  final List<ModelHotel> hoteldata = [
    ModelHotel(
        addressCity: 'صنعاء',
        addressCuntry: 'adsa',
        addressHotelid: 'asdsa',
        addressId: '1',
        addressStreet: 'شارع الستين',
        hotelDescription: 'askjxk',
        hotelId: '65',
        hotelImage: 'assets/images/test2.png',
        hotelName: 'ajhxs',
        hotelNamear: 'فايف استار',
        hotelRating: '4.5',
        hotelDescriptionar: 'khk',
        addressLat: '565',
        addressLong: '565'),
    ModelHotel(
        addressCity: 'صنعاء',
        addressCuntry: 'adsa',
        addressHotelid: 'asdsa',
        addressId: '1',
        addressStreet: 'جولة عمران',
        hotelDescription: 'askjxk',
        hotelId: '65',
        hotelImage: 'assets/images/test7.png',
        hotelName: 'ajhxs',
        hotelNamear: 'فندق عمران',
        hotelRating: '4.5',
        hotelDescriptionar: 'khk',
        addressLat: '565',
        addressLong: '565'),
    ModelHotel(
        addressCity: 'صنعاء',
        addressCuntry: 'adsa',
        addressHotelid: 'asdsa',
        addressId: '1',
        addressStreet: 'حدة',
        hotelDescription: 'askjxk',
        hotelId: '65',
        hotelImage: 'assets/images/test6.webp',
        hotelName: 'ajhxs',
        hotelNamear: 'فندق حدة',
        hotelRating: '4.5',
        hotelDescriptionar: 'khk',
        addressLat: '565',
        addressLong: '565'),
  ];
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
    // getData();
    super.onInit();
  }
}
