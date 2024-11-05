import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController{
 showPassword();
 login();
}

class LoginControllerImp extends LoginController{
 late TextEditingController email;
 late TextEditingController password;
GlobalKey<FormState>formstate=GlobalKey();

bool ispassword = true;
  @override
  showPassword() {
    ispassword= ispassword==true?false:true;
    update();
  }

@override
  void onInit() {
email=TextEditingController();
password=TextEditingController();
    super.onInit();
  }

@override
  void dispose() {
email.dispose();
password.dispose();
    super.dispose();
  }

  @override
  login() {
   if(formstate.currentState!.validate()){

   }
  }

}