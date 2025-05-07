import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/features/auth/forgetpassword/controller/resetpassword_controller.dart';
import 'package:newhotelyemeni/core/sharedWidget/custom_appbar.dart';
import 'package:newhotelyemeni/features/auth/clipe.dart';
import 'package:newhotelyemeni/core/widget/auth/customebuttone.dart';

import 'package:newhotelyemeni/core/widget/customtextform.dart';

import '../../../core/consttint/colors.dart';
import '../../../core/function/validator.dart';
import '../../../core/widget/auth/customtext.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordController());
    return Scaffold(
      appBar: customAppBar('اعادة تعيين كلمة المرور',
          height: 70, color: AppColors.gradint),
      body: GetBuilder<ResetPasswordController>(
        builder: (controller) => Form(
          key: controller.formstate,
          child: Container(
            padding: EdgeInsets.all(1.0),
            child: SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  "ادخل البريد الالكتروني الخاص بك",
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(children: <Widget>[
                      FadeInUp(
                          duration: Duration(milliseconds: 1300),
                          child: CustomTextForm(
                            label: 'البريد الالكتروني'.tr,
                            mycontroller: controller.email,
                            icon: Icons.email,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              return validInput(value!, 1, 20, 'email');
                            },
                            onChanged: (val) {
                              // controller.ChecktextPhone(val);
                            },
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Expanded(
                            // width: double.infinity,
                            child: Customebuttone(
                              color: AppColors.gradint,
                              text: 'ارسال رابط اعادة التعيين '.tr,
                              onPressed: () {
                                // controller.signup();
                                controller.sendEmailResetPassword();
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          // Expanded(
                          //   // width: double.infinity,
                          //   child: Customebuttone(
                          //     color: Colors.green,
                          //     text: 'تحقق'.tr,
                          //     onPressed: () {
                          //       // controller.checkEmailVerfiyEd();
                          //       // controller.signup();
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                    ]))
              ],
            )),
          ),
        ),
      ),
    );
  }
}
