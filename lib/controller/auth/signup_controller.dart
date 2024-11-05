import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController{
  showPassword();
  signup();
}

class SignUpControllerImp extends SignUpController{
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController conformpassword;

  GlobalKey<FormState>formstate=GlobalKey();

  bool ispassword = true;
  bool ispassword2 = true;

  @override
  showPassword() {
    ispassword= ispassword==true?false:true;
    update();
  }

  showPassword2() {
    ispassword2= ispassword2==true?false:true;
    update();
  }



  @override
  signup() {
    if(formstate.currentState!.validate()){
      print("notvales");
    }
    else{
      print("notvales");
    }
  }

  @override
  void onInit() {
    username=TextEditingController();
    phone=TextEditingController();
    email=TextEditingController();
    password=TextEditingController();
    conformpassword=TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    phone.dispose();
    email.dispose();
    password.dispose();
    conformpassword.dispose();
    super.dispose();
  }



}