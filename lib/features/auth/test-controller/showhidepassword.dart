import 'package:get/get.dart';

class Showhidepassword extends GetxController {
  late bool show = true;

  showpass() {
    show = false;
    update();
  }

  hidepass() {
     show = true;
    update();
  }
}
