import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/class/statusRquest.dart';
import 'package:newhotelyemeni/core/consttint/rout_name.dart';
import 'package:newhotelyemeni/core/consttint/sharedrefernces_keys.dart';
import 'package:newhotelyemeni/core/function/show_loading_dialog.dart';
import 'package:newhotelyemeni/core/servesies/myserves.dart';
import 'package:newhotelyemeni/core/sharedWidget/api_errors_dialog.dart';
import 'package:newhotelyemeni/core/sharedWidget/snakbar.dart';
import 'package:newhotelyemeni/features/auth/verify_email/data/verfiy_email_data.dart';

abstract class verifyemailControllerAuth extends GetxController {
  checkEmailVerfiyEd();
  resendVerfiyedCode();
}

class VerifysignupController extends verifyemailControllerAuth {
  String? verifycode;
  VerfiyEmailData verfiyEmailData = VerfiyEmailData(Get.find());
  StatusRquest statusRquest = StatusRquest.nune;
  MyServices myServices = Get.find();

  String? email;
  String? who;

  @override
  checkEmailVerfiyEd() async {
    statusRquest = StatusRquest.loading;
    showLoadingDialog(statusRquest);

    // update();
    try {
      final resposn = await verfiyEmailData.getUserData();

      resposn.fold(
        (faileur) {
          print(faileur);
          // statusRquest = faileur.status;
          Get.back();
          apiErorrsDialog(faileur);
        },
        (data) {
          if (data['user']['email_verified_at'] != null) {
            print(myServices.sharedPreferences
                .getString(SharedreferncesKeys.step));
            myServices.sharedPreferences
                .setString(SharedreferncesKeys.step, '2');
            statusRquest = StatusRquest.success;
            Get.back();

            Get.offAllNamed(RoutName.successEmail);
          } else {
            Get.back();
            errorDialog('فشل',
                'لم يتم التحقق من الحساب الرجاء التحقق ثم المحاولة مره اخرى');
          }

          // userPreferences.saveUserData(data);
        },
      );
    } catch (e) {
      Get.back();
      print('error: $e');
      Get.defaultDialog(title: "failed".tr, middleText: 'enternal  failer'.tr);
      statusRquest = StatusRquest.serverfailure;
    } finally {
      // showLoadingDialog();
      update();
    }
  }

  @override
  resendVerfiyedCode() {
    // if ('' == "77777") {
    //   Get.offAllNamed(RoutName.successEmail);
    // } else {
    //   Get.dialog(AlertDialog(
    //     icon: Icon(
    //       Icons.error_outline,
    //       color: Colors.red,
    //       size: 75,
    //     ),
    //     content: Text("This verifycode is false again tray write verifycode"),
    //     actions: [
    //       MaterialButton(
    //         onPressed: () {
    //           Get.back();
    //         },
    //         child: Icon(Icons.close),
    //         color: Colors.redAccent,
    //       )
    //     ],
    //   ));
    // Get.defaultDialog(title: "Error" , middleText: "This verifycode is false again tray write verifycode",);
    // }
  }

  // @override
  // gotosuccesssingup(verifycodeSignup) async{
  //   stutesRequest = StutesRequest.loading;
  //   update();
  //   var response = await verify.postData(email!,verifycodeSignup);
  //   stutesRequest=handling(response);
  //   if(stutesRequest==StutesRequest.success){
  //     if(response['stutes']=="success"){
  //       Get.offNamed("/success_singup");
  //     }
  //     else{
  //       Get.defaultDialog(title: "Error" , middleText: "This verifycode is false again tray write verifycode") ;
  //       stutesRequest=StutesRequest.failure;
  //     }
  //     update();
  //   }
  //   else{}
  //
  //
  // }

  @override
  void onInit() {
    email = Get.arguments['email'];
    who = Get.arguments['who'];
    if (who == 'login') {
      resendVerfiyedCode();
    }

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
