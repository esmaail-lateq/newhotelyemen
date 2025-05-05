import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newhotelyemeni/core/consttint/sharedrefernces_keys.dart';
import 'package:newhotelyemeni/core/servesies/myserves.dart';

authToken() {
  MyServices myServices = Get.find();

  String? token =
      myServices.sharedPreferences.getString(SharedreferncesKeys.token);
  return 'bearer $token';
}
