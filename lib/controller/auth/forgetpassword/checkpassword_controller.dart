import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CheckPasswordController extends GetxController{
  
  GlobalKey<FormState>formstate=GlobalKey();
  late TextEditingController email ;
  bool chack = true;

  ChecktextPhone(val){
    if(val == ""){
      chack = true;
    }
    else{
      chack = false;
    }
    update();

  }
  gotoVerifyemail(){
    if(formstate.currentState!.validate()){
      Get.toNamed("verifyRepassword" , arguments: {
        "email":email.text,
      });
    }
  }
  
  @override
  void onInit() {
    email=TextEditingController();
    super.onInit();
  }
}