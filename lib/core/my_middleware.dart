
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/consttint/rout_name.dart';
import 'package:newhotelyemeni/core/consttint/sharedrefernces_keys.dart';
import 'package:newhotelyemeni/core/servesies/myserves.dart';

class Mymiddleware extends GetMiddleware {
  // ignore: non_constant_identifier_names
  int? get Priority => 1;
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString(SharedreferncesKeys.step) == '2') {
      return  RouteSettings(name: RoutName.homePage);
    }
    
    // if (myServices.sharedPreferences.getString(SharedreferncesKeys.step) == '1') {
    //   return  RouteSettings(name: RoutName.login);
    // }
    return null;
  }
}
