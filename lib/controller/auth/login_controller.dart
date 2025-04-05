import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/controller/auth/onboadercontroller/onboarderScreen_controller.dart';
import 'package:newhotelyemeni/core/class/statusRquest.dart';
import 'package:newhotelyemeni/core/consttint/rout_name.dart';
import 'package:newhotelyemeni/core/consttint/sharedrefernces_keys.dart';
import 'package:newhotelyemeni/core/function/handling.dart';
import 'package:newhotelyemeni/core/function/show_loading_dialog.dart';

import 'package:newhotelyemeni/core/servesies/myserves.dart';
import 'package:newhotelyemeni/core/sharedWidget/api_errors_dialog.dart';
import 'package:newhotelyemeni/core/sharedWidget/loaging_dialog.dart';

import 'package:newhotelyemeni/data/model/users_model.dart';
import 'package:newhotelyemeni/data/sours/remout/auth/login_data.dart';

abstract class LoginController extends GetxController {
  showPassword();
  login(String email, String password);
  forgetpassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formstate = GlobalKey();
  LoginData loginData = LoginData(Get.find());
  UserPreferences userPreferences = UserPreferences(Get.find());
  StatusRquest statusRquest = StatusRquest.nune;
  List<UserModels> datausers = [];

  bool ispassword = true;
  @override
  showPassword() {
    ispassword = ispassword == true ? false : true;
    update();
  }

  @override
  forgetpassword() {
    Get.toNamed(RoutName.checkPassword);
  }

  @override
  login(String email, String password) async {
    if (formstate.currentState!.validate()) {
      statusRquest = StatusRquest.loading;
      showLoadingDialog(statusRquest);

      update();
      try {
        var resposn = await loginData.postData(email, password);

        statusRquest = handling(resposn);

        if (statusRquest == StatusRquest.success) {
          Get.back();
          userPreferences.saveUserData(resposn);
          Get.offAllNamed(RoutName.homePage);
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
    }
  }

  

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}

class UserPreferences {
  final MyServices myServices;

  UserPreferences(this.myServices);

  void saveUserData(Map<String, dynamic> userData) {
    myServices.sharedPreferences
        .setString(SharedreferncesKeys.id, '${userData['user']['id']}');
    myServices.sharedPreferences
        .setString(SharedreferncesKeys.token, userData['token']);

    // myServices.sharedPreferences
    //     .setString("access_token", userData['access_token']);
    myServices.sharedPreferences
        .setString(SharedreferncesKeys.name, userData['user']['name']);
    myServices.sharedPreferences
        .setString(SharedreferncesKeys.email, userData['user']['email']);
    myServices.sharedPreferences.setString(
        SharedreferncesKeys.phoneNumber, userData['user']['phone_number']);
    myServices.sharedPreferences
        .setString(SharedreferncesKeys.role, userData['user']['role']);

    myServices.sharedPreferences.setString(SharedreferncesKeys.step, '2');
  }
}
