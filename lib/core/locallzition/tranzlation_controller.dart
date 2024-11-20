import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/servesies/myserves.dart';

class LocalController extends GetxController{
  Locale? langage;
  Myserves myserves = Get.find();
  changelanguage(String lancode){
    Locale locale = Locale(lancode);
    myserves.sharedPreferences.setString("local", lancode);
    Get.updateLocale(locale);
    update();
  }

  @override
  void onInit() {
    String? sharedlanguage=myserves.sharedPreferences.getString("local");
    if(sharedlanguage == "ar"){
      langage = Locale("ar");
    }
    else if(sharedlanguage == "en"){
      langage = Locale("en");
    }
    else{
      langage = Locale(Get.deviceLocale!.languageCode);

    }


    super.onInit();
  }

}