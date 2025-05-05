import 'package:get/get.dart';
import 'package:newhotelyemeni/core/consttint/rout_name.dart';
import 'package:newhotelyemeni/core/servesies/myserves.dart';

logout(MyServices myserviece) {
  myserviece.sharedPreferences.clear();
  myserviece.sharedPreferences.setString('step', '1');

  Get.offAllNamed(RoutName.login);
}
