import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  GlobalKey<FormState>? formstate;
  late TextEditingController password;
  late TextEditingController conpassword;

  bool ispassword = true;
  bool ispassword2 = true;

  showPassword() {
    ispassword = ispassword == true ? false : true;
    update();
  }

  showPassword2() {
    ispassword2 = ispassword2 == true ? false : true;
    update();
  }

  gotosuccess() {
    if (formstate!.currentState!.validate()) {
      Get.offAllNamed("/successEmail");
    }
  }

  @override
  void onInit() {
    formstate = GlobalKey<FormState>();
    password = TextEditingController();
    conpassword = TextEditingController();

    super.onInit();
  }
}
