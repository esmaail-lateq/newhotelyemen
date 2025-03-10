import 'package:animate_do/animate_do.dart';
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
      body: GetBuilder<VerifyRsatePasswordController>(
        builder: (controller) => Container(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(1.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Colors.blue.shade600,
                Colors.blue.shade400,
                Colors.blue.shade200
              ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeInUp(
                            duration: Duration(milliseconds: 1000),
                            child: Text(
                              "${controller.email}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        FadeInUp(
                            duration: Duration(milliseconds: 1300),
                            child: Text(
                              "verification code".tr,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 2000,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60))),
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          FadeInUp(
                              duration: Duration(milliseconds: 1300),
                              child: Text(
                                "Enter the verification code that was sent to your phone  ",
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                ),
                              )),
                          SizedBox(
                            height: 40,
                          ),
                          FadeInUp(
                            duration: Duration(milliseconds: 1400),
                            child: OtpTextField(
                              cursorColor: Colors.blue,
                              focusedBorderColor: Colors.indigo,
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF333333)),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
