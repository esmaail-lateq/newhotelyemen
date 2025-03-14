import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/controller/auth/forgetpassword/resetpassword_controller.dart';
import 'package:newhotelyemeni/view/widget/auth/clipe.dart';
import 'package:newhotelyemeni/view/widget/custombuttom.dart';
import 'package:newhotelyemeni/view/widget/customtextform.dart';

import '../../../../core/consttint/colors.dart';
import '../../../../core/function/validator.dart';
import '../../../widget/auth/customtext.dart';

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
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        child: Stack(
                          children: [
                            ClipPath(
                              clipper: Clipe(),
                              child: Container(
                                height: 280,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      spreadRadius: 7,
                                      offset: Offset(1, 5),
                                      blurRadius: 9
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
                                bottom: 20,
                                left: 50,
                                child: Customtext(
                                  text: '17'.tr,
                                )),
                            Positioned(
                              bottom: 0,
                              left:50 ,
                              child: Container(
                                height: 2,
                                width: 150,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 25),
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
                      )
                    ],
                  ),

            ))),
      ),
    );
  }
}
