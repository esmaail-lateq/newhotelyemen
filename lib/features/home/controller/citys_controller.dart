import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/function/user_city_location_mang.dart';
import 'package:newhotelyemeni/features/home/controller/home_page_controller.dart';

class CityController extends GetxController {
  TextEditingController? textEditingController = TextEditingController();
  List<String> allCities = [
    'صنعاء',
    'عدن',
    'الحديدة',
    'تعز',
    'إب',
    'حضرموت',
    'المكلا',
    'مارب',
    'البيضاء',
    'ذمار'
  ];
  RxList<String> filteredCities = <String>[].obs;
  RxString selectedCity = ''.obs;

  Future<bool> backExit() {
    filteredCities.assignAll(allCities);
    textEditingController!.clear();

    return Future.value(true);
  }

  @override
  void onInit() {
    filteredCities.assignAll(allCities);
    selectedCity.value = getUserCity() ?? '';
    super.onInit();
  }

  void filterCities(String query) {
    if (query.isEmpty) {
      filteredCities.assignAll(allCities);
    } else {
      filteredCities.assignAll(
        allCities.where((city) => city.contains(query)).toList(),
      );
    }
  }

  void selectCity(String city) {
    HomePageController homePageController = Get.find();

    setUserCity(city);
    selectedCity.value = city;
    homePageController.getDataBy(filterData: {'city': city});
    Get.back(); // يغلق البوتم شيت
  }
}
