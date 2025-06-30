import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/class/statusRquest.dart';
import 'package:newhotelyemeni/core/consttint/rout_name.dart';
import 'package:newhotelyemeni/core/function/handling.dart';
import 'package:newhotelyemeni/core/function/show_loading_dialog.dart';
import 'package:newhotelyemeni/core/servesies/google_sign_in.dart';
import 'package:newhotelyemeni/core/sharedWidget/api_errors_dialog.dart';
import 'package:newhotelyemeni/core/sharedWidget/snakbar.dart';
import 'package:newhotelyemeni/features/auth/login/controller/login_controller.dart';
import 'package:newhotelyemeni/features/auth/signup/data/signup_data.dart';

import '../../test-controller/onboadercontroller/onboarderScreen_controller.dart';

abstract class SignUpController extends GetxController {
  showPassword();
  signup();
  signupWithGoogle();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController conformpassword;
  UserPreferences userPreferences = UserPreferences(Get.find());

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

      // update();
      try {
        final resposn = await signupData.postData(username.text, password.text,
            email.text, phone.text, conformpassword.text);

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
            userPreferences.saveUserData(data['data']);
            
            successSnakbar('نجاح', 'تم انشاء الحاساب وارسال رابط التاكيد');
            Get.toNamed(RoutName.verifyEmail,
                arguments: {'email': email.text, 'who': 'sign'});
          },
        );
      } catch (e) {
        Get.back();
        print('error: $e');
        Get.defaultDialog(
            title: "failed".tr, middleText: 'enternal  failer'.tr);
        statusRquest = StatusRquest.serverfailure;
      } finally {
        // showLoadingDialog();
        update();
      }
    }
  }

  @override
  signupWithGoogle() async {
    String token = await GoogleSignInServec.getUserIdToken();
    debugPrint(token);
    if (token != '') {
      statusRquest = StatusRquest.loading;
      showLoadingDialog(statusRquest);
      final resposn = await signupData.googleToken(token);

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
