import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/consttint/images.dart';

import '../../../controller/auth/verifySignup_controller.dart';
import '../../widget/auth/clipe.dart';
import '../../widget/auth/customtext.dart';

class VerifySignup extends StatelessWidget {
  const VerifySignup({super.key});

  @override

  Widget build(BuildContext context) {
    Get.put(verifyemailControllerAuthImp());
    return Scaffold(
      body:  GetBuilder<verifyemailControllerAuthImp>(builder: (controller) => Container(
        padding: EdgeInsets.all(1.0),
        child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 300,
                  child: Stack(
                    children: [
                      ClipPath(
                        clipper: Clipe(),
                        child:Container(
                          height: 280,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 9.0,
                                    offset: Offset(1, 5),
                                    blurRadius: 10,
                                    color: Colors.grey.withOpacity(0.40)
                                ),
                              ],
                              gradient: LinearGradient(colors:[
                                AppColors.primaryColor,
                                AppColors.text2
                              ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              color: AppColors.primaryColor
                          ),
                        ),
                      ),
                      Positioned(
                          top: 70,
                          right: 30,
                          child: Text("${controller.email}",style: TextStyle(
                              fontSize: 35,
                              color: Colors.white
                          ), ) ),
                      Positioned(
                          bottom: 20,
                          left: 50,
                          child: Customtext(
                            text: '16'.tr,
                          )),
                      Positioned(
                        bottom: 0,
                        left:50 ,
                        child: Container(
                          height: 2,
                          width: 150,
                          color: AppColors.primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Container(
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
                            controller.gotosuccesssingup(verificationCode);
                          }, // end onSubmit
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
        ),
      ),),
    )
        ;
  }
}
