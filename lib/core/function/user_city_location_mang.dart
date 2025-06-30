import 'package:get/get.dart';
import 'package:newhotelyemeni/core/consttint/sharedrefernces_keys.dart';
import 'package:newhotelyemeni/core/servesies/myserves.dart';

String? getUserCity() {
  MyServices myServices = Get.find();

  String? city =
      myServices.sharedPreferences.getString(SharedreferncesKeys.city);
  return city;
}

setUserCity(String city) async {
  MyServices myServices = Get.find();

  bool cityResult = await myServices.sharedPreferences
      .setString(SharedreferncesKeys.city, city);
  if (cityResult) return city;
  return '';
}
