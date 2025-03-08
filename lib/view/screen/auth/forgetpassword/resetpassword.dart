import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/controller/auth/forgetpassword/resetpassword_controller.dart';
import 'package:newhotelyemeni/view/widget/custombuttom.dart';
import 'package:newhotelyemeni/view/widget/customtextform.dart';

import '../../../../core/function/validator.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordController());
    return Scaffold(
      body: GetBuilder<ResetPasswordController>(
        builder: (controller) => Container(
            padding: const EdgeInsets.all(1.0),
            child: SingleChildScrollView(
                child: Form(
              key: controller.formstate,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        colors: [
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
                                "Reset Password",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          FadeInUp(
                              duration: Duration(milliseconds: 1300),
                              child: Text(
                                "New Password".tr,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60))),
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: <Widget>[
                            // FadeInUp(duration: Duration(milliseconds: 1300),
                            //     child:Text("Enter your Email to check this Email for you  ",
                            //       style: TextStyle(color: Colors.grey,),) ),

                            SizedBox(
                              height: 30,
                            ),
                            FadeInUp(
                                duration: Duration(milliseconds: 1400),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      CustomTextForm(
                                        icon: Icons.lock,
                                        mycontroller: controller.password,
                                        keyboardType: TextInputType.text,
                                        label: 'New Password',
                                        validator: (val) {
                                          return validInput(
                                              val!, 8, 50, "password");
                                        },
                                        isPassword: controller.ispassword,
                                        chingpassword: () {
                                          controller.showPassword();
                                        },
                                        iconpassword: Icons.visibility,
                                        iconshowpassword: Icons.visibility_off,
                                      ),
                                      CustomTextForm(
                                        mycontroller: controller.conpassword,
                                        icon: Icons.lock,
                                        keyboardType: TextInputType.text,
                                        label: 'confirm New Password',
                                        validator: (val) {
                                          if (val == null || val.isEmpty) {
                                            return " يرجى تأكيد كلمة المرور'";
                                          } else if (val !=
                                              controller.password.text) {
                                            return 'كلمتا المرور غير متطابقتين';
                                          }
                                          return null;
                                        },
                                        isPassword: controller.ispassword2,
                                        chingpassword: () {
                                          controller.showPassword2();
                                        },
                                        iconpassword: Icons.visibility,
                                        iconshowpassword: Icons.visibility_off,
                                      ),
                                    ],
                                  ),
                                )),

                            SizedBox(
                              height: 20,
                            ),
                            FadeInUp(
                                duration: Duration(milliseconds: 1600),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: CustomButtom(
                                    titel: "Save New Password",
                                    onPressed: () {
                                      controller.gotosuccess();
                                    },
                                  ),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))),
      ),
    );
  }
}
