import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:newhotelyemeni/controller/auth/login_controller.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/consttint/images.dart';
import 'package:newhotelyemeni/core/function/validator.dart';
import 'package:newhotelyemeni/view/widget/custombuttom.dart';
import 'package:newhotelyemeni/view/widget/customtextform.dart';

import '../../../controller/auth/signup_controller.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return GetBuilder<SignUpControllerImp>(builder: (controller) => Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInUp(
                duration: Duration(milliseconds: 1000),
                child: Text(
                  'Create A Count',
                  style: const TextStyle(
                    color: Color(0xFF333333), // لون غامق للنص
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ) ),
            // العنوان الرئيسي
            const SizedBox(height: 5),

            // نموذج الإدخال
            Form(
                key: controller.formstate,
                child: FadeInUp(
                  duration: Duration(milliseconds: 1300),
                  child: Column(
                    children: [
                      // حقل البريد الإلكتروني
                    CustomTextForm(
                      icon: Icons.person,
                      mycontroller: controller.username,
                      keyboardType: TextInputType.emailAddress,
                      label: '10'.tr,
                      validator: (val) {
                        return  validInput(val!, 4, 50, "username");
                      },
                    ),

                  CustomTextForm(
                      icon: Icons.email,
                      mycontroller: controller.email,
                      keyboardType: TextInputType.emailAddress,
                      label: '9'.tr,
                      validator: (val) {
                        return validInput(val!, 4, 50, "email");
                      },
                    ),

                  CustomTextForm(
                      icon: Icons.phone,
                      mycontroller: controller.phone,
                      keyboardType: TextInputType.phone,
                      label: '11'.tr,
                      validator: (val) {
                        return validInput(val!, 4, 50, "phone");
                      },
                    ),

                   CustomTextForm(
                      icon: Icons.lock,
                      mycontroller: controller.password,
                      keyboardType: TextInputType.text,
                      label: '12'.tr,
                      validator: (val) {
                        return validInput(val!, 8, 50, "password");
                      },
                      isPassword: controller.ispassword,
                      chingpassword: () {
                        controller.showPassword();
                      },
                      iconpassword: Icons.visibility,
                      iconshowpassword: Icons.visibility_off,
                    ),

                   CustomTextForm(
                      icon: Icons.lock,
                      mycontroller: controller.conformpassword,
                      keyboardType: TextInputType.text,
                      label: '13'.tr,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى تأكيد كلمة المرور';
                        } else if (value != controller.password.text) {
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
                  ),)
            ),
            SizedBox(height: 10,),
            // زر تسجيل الدخول
            FadeInUp(
              duration: Duration(milliseconds: 1800),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "I have an account? ",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                  ),
                  InkWell(
                    onTap: () {
                      // Get.toNamed("/signup");
                    },
                    child: Text(
                      "Login",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A99FF),
                      ),
                    ),
                  ),
                ],
              )
            )

            // const SizedBox(height: 16),
            //
            // // النص والرابط الخاص بالتسجيل
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       "Don't have an account? ",
            //       style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
            //     ),
            //     InkWell(
            //       onTap: () {
            //         Get.toNamed("/signup");
            //       },
            //       child: Text(
            //         "Sign Up",
            //         style: const TextStyle(
            //           fontSize: 16,
            //           fontWeight: FontWeight.bold,
            //           color: Color(0xFF0A99FF),
            //         ),
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    ),);
  }
}
// Scaffold(
//     body: GetBuilder<SignUpControllerImp>(
//       builder: (controller) => Form(
//         key: controller.formstate,
//         child: Container(
//           height: 20000,
//           color: AppColors.primaryColor,
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   SizedBox(height: 16),
//                   Lottie.asset(
//                     AppImages.Ansignup,
//                     repeat: true,
//                     reverse: true,
//                     width: 300,
//                     height: 300,
//                   ),
//                   Text(
//                     '8'.tr,
//                     style: TextStyle(
//                       color: AppColors.text1,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 25,
//                     ),
//                     textAlign: TextAlign.center,
//                     semanticsLabel: 'SignUp to Yemen Hotel Screen',
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(left: 50, right: 50.0),
//                     width: 10,
//                     child: Divider(color:AppColors.text1),
//                   ),
//
//                   const SizedBox(height: 16.0),
//                   Semantics(
//                     label: "10".tr,
//                     child: CustomTextForm(
//                       icon: Icons.person,
//                       mycontroller: controller.username,
//                       keyboardType: TextInputType.emailAddress,
//                       label: ' 10'.tr,
//                       validator: (val) {
//                         return  validInput(val!, 4, 50, "username");
//                       },
//                     ),
//                   ),
//                   Semantics(
//                     label: "9".tr,
//                     child: CustomTextForm(
//                       icon: Icons.email,
//                       mycontroller: controller.email,
//                       keyboardType: TextInputType.emailAddress,
//                       label: ' 9'.tr,
//                       validator: (val) {
//                         return validInput(val!, 4, 50, "email");
//                       },
//                     ),
//                   ),
//                   Semantics(
//                     label: "11".tr,
//                     child: CustomTextForm(
//                       icon: Icons.phone,
//                       mycontroller: controller.phone,
//                       keyboardType: TextInputType.phone,
//                       label: ' 11'.tr,
//                       validator: (val) {
//                         return validInput(val!, 4, 50, "phone");
//                       },
//                     ),
//                   ),
//                   Semantics(
//                     label: "12".tr,
//                     child: CustomTextForm(
//                       icon: Icons.lock,
//                       mycontroller: controller.password,
//                       keyboardType: TextInputType.text,
//                       label: ' 12'.tr,
//                       validator: (val) {
//                         return validInput(val!, 8, 50, "password");
//                       },
//                       isPassword: controller.ispassword,
//                       chingpassword: () {
//                         controller.showPassword();
//                       },
//                       iconpassword: Icons.visibility,
//                       iconshowpassword: Icons.visibility_off,
//                     ),
//                   ),
//
//                   Semantics(
//                     label: "13".tr,
//
//                     child: CustomTextForm(
//                       icon: Icons.lock,
//                       mycontroller: controller.conformpassword,
//                       keyboardType: TextInputType.text,
//                       label: ' 13'.tr,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'يرجى تأكيد كلمة المرور';
//                         } else if (value != controller.password.text) {
//                           return 'كلمتا المرور غير متطابقتين';
//                         }
//                         return null;
//
//                       },
//
//                       isPassword: controller.ispassword2,
//                       chingpassword: () {
//                         controller.showPassword2();
//                       },
//                       iconpassword: Icons.visibility,
//                       iconshowpassword: Icons.visibility_off,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   CustomButtom(
//                     onPressed: () {
//                       controller.signup();
//                     },
//                     titel: '3'.tr,
//                   ),
//
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "14 ".tr,
//                         style: TextStyle(color: AppColors.text2, fontSize: 14),
//                       ),
//                       InkWell(
//                         onTap: (){
//                           Get.offAllNamed("/login");
//                         },
//                         child: Text(
//                           "2".tr,
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: AppColors.text1),
//                         ),
//                       )
//                     ],
//                   )
//
//                   // ElevatedButton(
//                   //   onPressed: _isLoading || !_isFormValid ? null : _signInWithEmailAndPassword,
//                   //   style: ElevatedButton.styleFrom(
//                   //     backgroundColor: _isLoading ? Colors.grey : Colors.black45,
//                   //   ),
//                   //   child: _isLoading
//                   //       ? SizedBox(
//                   //     width: 20,
//                   //     height: 20,
//                   //     child: LoadingAnimationWidget.staggeredDotsWave(
//                   //       color: Colors.cyanAccent,
//                   //       size: 30,
//                   //     ),
//                   //   )
//                   //       : Text(
//                   //     'تسجيل الدخول',
//                   //     style: TextStyle(color: Colors.cyanAccent),
//                   //     semanticsLabel: 'Login',
//                   //   ),
//                   // ),
//
//                   // TextButton(
//                   //   onPressed: () {
//                   //     Navigator.push(
//                   //       context,
//                   //       MaterialPageRoute(builder: (context) => SignUpScreen()),
//                   //     );
//                   //   },
//                   //   child: Text(
//                   //     'ليس لديك حساب ؟ قم بإنشاء حساب ',
//                   //     style: TextStyle(color: Colors.cyanAccent),
//                   //     semanticsLabel: 'go to Sign up screen to create a new account',
//                   //   ),
//                   // ),
//                   // _showForgotPassword
//                   //     ? TextButton(
//                   //   onPressed: _resetPassword,
//                   //   child: Text(
//                   //     ' نسيت كلمة المرور ؟!!',
//                   //     style: TextStyle(color: Colors.cyanAccent),
//                   //     semanticsLabel: 'Forget password',
//                   //   ),
//                   // )
//                   //     : SizedBox(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     ))