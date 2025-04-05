import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/class/statusRquest.dart';
import 'package:newhotelyemeni/core/consttint/rout_name.dart';
import 'package:newhotelyemeni/core/function/handling.dart';
import 'package:newhotelyemeni/core/function/show_loading_dialog.dart';
import 'package:newhotelyemeni/core/sharedWidget/api_errors_dialog.dart';
import 'package:newhotelyemeni/data/sours/remout/auth/signup_data.dart';

import 'onboadercontroller/onboarderScreen_controller.dart';

abstract class SignUpController extends GetxController {
  showPassword();
  signup();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController conformpassword;

  SignupData signupData = SignupData(Get.find());
  StatusRquest statusRquest = StatusRquest.nune;

  bool ispassword = true;
  bool ispassword2 = true;

  @override
  showPassword() {
    ispassword = ispassword == true ? false : true;
    update();
  }

  showPassword2() {
    ispassword2 = ispassword2 == true ? false : true;
    update();
  }

  @override
  signup() async {
    if (formstate.currentState!.validate()) {
      statusRquest = StatusRquest.loading;
      showLoadingDialog(statusRquest);

      update();
      try {
        var resposn = await signupData.postData(username.text, password.text,
            email.text, phone.text, conformpassword.text);

        statusRquest = handling(resposn);

        if (statusRquest == StatusRquest.success) {
          Get.back();
          Get.toNamed(RoutName.verifyEmail, arguments: {
            "phone": email.text,
          });
          // userPreferences.saveUserData(resposn);
          // Get.offAllNamed(RoutName.homePage);
        } else {
          Get.back();
          apiErorrsDialog(statusRquest);
        }
      } catch (e) {
        Get.back();
        print('error: $e');
        Get.defaultDialog(
            title: "failed".tr, middleText: 'enternal  failer'.tr);
        statusRquest = StatusRquest.serverfailure;
      } finally {
        // showLoadingDialog();
      }

      // var response= await signupData.postData(username.text, password.text, email.text, phone.text);
      // statusRquest =  handling(response);
      // if(statusRquest == StatusRquest.success){
      //   if(response['"status'] == "success"){
      //     Get.offAllNamed("/verifyEmail" , arguments:{
      //       "phone":phone.text,
      //
      //     });
      //   }
      //   else if(response['"status'] == "finde"){
      //     Get.defaultDialog(title: "Error" , middleText: "Phone Number Or Email Already Exists");
      //   }
      // }
    } else {
      print("not vaild");
    }
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    conformpassword = TextEditingController();

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
