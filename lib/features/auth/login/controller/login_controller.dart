import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newhotelyemeni/features/auth/test-controller/onboadercontroller/onboarderScreen_controller.dart';
import 'package:newhotelyemeni/core/class/statusRquest.dart';
import 'package:newhotelyemeni/core/consttint/rout_name.dart';
import 'package:newhotelyemeni/core/consttint/sharedrefernces_keys.dart';
import 'package:newhotelyemeni/core/function/handling.dart';
import 'package:newhotelyemeni/core/function/show_loading_dialog.dart';
import 'package:newhotelyemeni/core/servesies/google_sign_in.dart';

import 'package:newhotelyemeni/core/servesies/myserves.dart';
import 'package:newhotelyemeni/core/sharedWidget/api_errors_dialog.dart';
import 'package:newhotelyemeni/core/sharedWidget/loaging_dialog.dart';
import 'package:newhotelyemeni/features/auth/login/controller/testGoogle.dart';

import 'package:newhotelyemeni/features/auth/login/data/model/users_model.dart';
import 'package:newhotelyemeni/features/auth/login/data/sours/login_data.dart';

abstract class LoginController extends GetxController {
  showPassword();
  login(String email, String password);
  loginWithGoole();
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
    Get.to(() => SignInDemo());
    // Get.toNamed(RoutName.checkPassword);
  }

  @override
  login(String email, String password) async {
    if (formstate.currentState!.validate()) {
      statusRquest = StatusRquest.loading;
      showLoadingDialog(statusRquest);

      update();
      try {
        print('##################################################');

        final resposn = await loginData.postData(email, password);
        print(resposn);

        resposn.fold(
          (faileur) {
            print(faileur);
            // statusRquest = faileur.status;
            Get.back();
            apiErorrsDialog(faileur);
          },
          (data) {
            statusRquest = StatusRquest.success;

            Get.back();
            userPreferences.saveUserData(data);
            print(data['user']['email_verified_at']);
            if (data['user']['email_verified_at'].toString() != 'null') {
              Get.offAllNamed(RoutName.homePage);
            } else {
              Get.toNamed(RoutName.verifyEmail,
                  arguments: {'email': data['user']['email'], 'who': 'login'});
            }
          },
        );
      } catch (e) {
        Get.back();
        print('error: $e');
        Get.defaultDialog(
            title: "failed".tr, middleText: 'enternal  failer'.tr);
        statusRquest = StatusRquest.serverfailure;
      }
      update();
    }
  }

  @override
  loginWithGoole() async {
    String token = await GoogleSignInServec.getUserIdToken();
    debugPrint(token);
    if (token != '') {
      statusRquest = StatusRquest.loading;
      showLoadingDialog(statusRquest);
      final resposn = await loginData.googleToken(token);

      resposn.fold(
        (faileur) {
          print(faileur);
          statusRquest = faileur.status;
          Get.back();
          apiErorrsDialog(faileur);
        },
        (data) {
          print(data);
          // statusRquest = StatusRquest.success;

          Get.back();
          userPreferences.saveUserData(data['data']);
          Get.offAllNamed(
            RoutName.homePage,
          );
        },
      );
    }

    update();
  }

  @override
  void onInit() async {
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

  void saveUserData(Map userData) {
    // myServices.sharedPreferences
    //     .setString(SharedreferncesKeys.id, '${userData['user']['id']}');
    myServices.sharedPreferences
        .setString(SharedreferncesKeys.token, userData['token']);

    // myServices.sharedPreferences
    //     .setString("access_token", userData['access_token']);
    myServices.sharedPreferences
        .setString(SharedreferncesKeys.name, userData['user']['name']);
    myServices.sharedPreferences.setString(SharedreferncesKeys.virefy,
        userData['user']['email_verified_at'].toString());
    myServices.sharedPreferences
        .setString(SharedreferncesKeys.email, userData['user']['email']);
    myServices.sharedPreferences.setString(
        SharedreferncesKeys.phoneNumber, userData['user']['phone_number']);
    myServices.sharedPreferences
        .setString(SharedreferncesKeys.role, userData['user']['role']);
    if (userData['user']['email_verified_at'] != null) {
      myServices.sharedPreferences.setString(SharedreferncesKeys.step, '2');
    } else {
      myServices.sharedPreferences.setString(SharedreferncesKeys.step, '1');
    }
  }
}
