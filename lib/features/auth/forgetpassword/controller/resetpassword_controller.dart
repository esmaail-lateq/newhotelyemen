import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/class/statusRquest.dart';
import 'package:newhotelyemeni/core/consttint/rout_name.dart';
import 'package:newhotelyemeni/core/function/show_loading_dialog.dart';
import 'package:newhotelyemeni/core/sharedWidget/api_errors_dialog.dart';
import 'package:newhotelyemeni/core/sharedWidget/snakbar.dart';
import 'package:newhotelyemeni/features/auth/forgetpassword/data/reset_password_data.dart';

class ResetPasswordController extends GetxController {
  GlobalKey<FormState>? formstate;
  late TextEditingController email;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRquest statusRquest = StatusRquest.nune;
  // late TextEditingController conpassword;

  bool ispassword = true;
  bool ispassword2 = true;

  gotosuccess() {
    if (formstate!.currentState!.validate()) {
      Get.offAllNamed("/successEmail");
    }
  }

  sendEmailResetPassword() async {
    if (formstate!.currentState!.validate()) {
      statusRquest = StatusRquest.loading;
      showLoadingDialog(statusRquest);

      update();
      try {
        print('##################################################');

        final resposn = await resetPasswordData.postData(email.text);
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
            successDialog(
                'نجاح', 'تم ارسال رابط تغيير كلمة المرور الى البريد الالكتروني',
                () {
              Get.offAllNamed(RoutName.login);
            });
            // userPreferences.saveUserData(data);
            // print(data['user']['email_verified_at']);
            // if (data['user']['email_verified_at'].toString() != 'null') {
            //   Get.offAllNamed(RoutName.homePage);
            // } else {
            //   Get.toNamed(RoutName.verifyEmail,
            //       arguments: {'email': data['user']['email'], 'who': 'login'});
            // }
          },
        );
      } catch (e) {
        Get.back();
        print('error: $e');
        Get.defaultDialog(
            title: "failed".tr, middleText: 'enternal  failer'.tr);
        statusRquest = StatusRquest.serverfailure;
      }
    }
  }

  @override
  void onInit() {
    formstate = GlobalKey<FormState>();
    email = TextEditingController();
    // conpassword = TextEditingController();

    super.onInit();
  }
}
