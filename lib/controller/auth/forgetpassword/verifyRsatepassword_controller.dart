import 'package:get/get.dart';

class VerifyRsatePasswordController extends GetxController{

late String email;

gotoresetpassword(verificationCode){
  if(verificationCode == "66666"){
    Get.offNamed("/Repassword");
  }
  else{
    Get.defaultDialog(title: "Error",middleText: "This verifycode is false again tray write verifycode");

  }

}
  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

}