import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:newhotelyemeni/core/consttint/images.dart';

import '../../../../controller/auth/forgetpassword/verifyRsatepassword_controller.dart';
import '../../../../core/consttint/colors.dart';

class VerifyResatePassword extends StatelessWidget {
  const VerifyResatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyRsatePasswordController());
    return Scaffold(
      body:  GetBuilder<VerifyRsatePasswordController>(builder: (controller) => Container(
        height: 20000,
        color: AppColors.primaryColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 16),
                  Lottie.asset(
                    AppImages.Ansignup,
                    repeat: true,
                    reverse: true,
                    width: 300,
                    height: 300,
                  ),
                  Text(
                    'VerifyCode to Email',
                    style: TextStyle(
                      color: Colors.cyanAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                    semanticsLabel: 'Login to Yemen Hotel Screen',
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 50, right: 50.0),
                    width: 10,
                    child: Divider(color: AppColors.text1),
                  ),
                  const SizedBox(height: 4.0),
                  Text("${controller.email}", style: TextStyle(color: AppColors.text2 , fontSize: 18),),
                  SizedBox(height:19.0 ,),
                  OtpTextField(
                    cursorColor: AppColors.primaryColor,
                    focusedBorderColor: Colors.cyanAccent,
                    textStyle:
                    TextStyle(fontWeight: FontWeight.bold,color: AppColors.text3),
                    fieldWidth: 50,
                    borderRadius: BorderRadius.circular(30),
                    keyboardType: TextInputType.number,

                    numberOfFields: 5,
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {

                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      controller.gotoresetpassword(verificationCode);
                    }, // end onSubmit
                  ),

                ]
            ),
          ),
        ),
      ),),
    )
    ;
  }
}
