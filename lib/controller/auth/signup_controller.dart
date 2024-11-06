import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController{
  showPassword();
  signup();

}

class SignUpControllerImp extends SignUpController{
  GlobalKey<FormState>formstate=GlobalKey();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController conformpassword;



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
      Get.toNamed("/verifyEmail" , arguments:{
        "email":email.text,
      });
    }
    else{
      print("not vaild" );
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