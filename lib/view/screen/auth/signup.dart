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
    return Scaffold(
        body: GetBuilder<SignUpControllerImp>(
          builder: (controller) => Form(
            key: controller.formstate,
            child: Container(
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
                        AppImages.Anlogin,
                        repeat: true,
                        reverse: true,
                        width: 300,
                        height: 300,
                      ),
                      Text(
                        'SignUp to Yemeni Hotel',
                        style: TextStyle(
                          color: AppColors.text1,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                        semanticsLabel: 'SignUp to Yemen Hotel Screen',
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 50, right: 50.0),
                        width: 10,
                        child: Divider(color:AppColors.text1),
                      ),

                      const SizedBox(height: 16.0),
                      Semantics(
                        label: "UserName",
                        child: CustomTextForm(
                          icon: Icons.person,
                          mycontroller: controller.username,
                          keyboardType: TextInputType.emailAddress,
                          label: ' UserName',
                          validator: (val) {
                            return  validInput(val!, 4, 50, "username");
                          },
                        ),
                      ),
                      Semantics(
                        label: "email",
                        child: CustomTextForm(
                          icon: Icons.email,
                          mycontroller: controller.email,
                          keyboardType: TextInputType.emailAddress,
                          label: ' Email',
                          validator: (val) {
                            return validInput(val!, 4, 50, "email");
                          },
                        ),
                      ),
                      Semantics(
                        label: "phone",
                        child: CustomTextForm(
                          icon: Icons.phone,
                          mycontroller: controller.phone,
                          keyboardType: TextInputType.phone,
                          label: ' phone',
                          validator: (val) {
                            return validInput(val!, 4, 50, "phone");
                          },
                        ),
                      ),
                      Semantics(
                        label: "password",
                        child: CustomTextForm(
                          icon: Icons.lock,
                          mycontroller: controller.password,
                          keyboardType: TextInputType.text,
                          label: ' Password',
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
                      ),

                      Semantics(
                        label: "Password",
                        child: CustomTextForm(
                          icon: Icons.lock,
                          mycontroller: controller.conformpassword,
                          keyboardType: TextInputType.text,
                          label: ' Password',
                          validator: (val) {
                            if(val != controller.password){
                                return ' كلمة السر غير متطابقة ';
                            };
                          },
                          isPassword: controller.ispassword2,
                          chingpassword: () {
                            controller.showPassword2();
                          },
                          iconpassword: Icons.visibility,
                          iconshowpassword: Icons.visibility_off,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomButtom(
                        onPressed: () {
                          controller.signup();
                        },
                        titel: 'Signup',
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "I Have a Count ",
                            style: TextStyle(color: AppColors.text2, fontSize: 14),
                          ),
                          InkWell(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.text1),
                            ),
                          )
                        ],
                      )

                      // ElevatedButton(
                      //   onPressed: _isLoading || !_isFormValid ? null : _signInWithEmailAndPassword,
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: _isLoading ? Colors.grey : Colors.black45,
                      //   ),
                      //   child: _isLoading
                      //       ? SizedBox(
                      //     width: 20,
                      //     height: 20,
                      //     child: LoadingAnimationWidget.staggeredDotsWave(
                      //       color: Colors.cyanAccent,
                      //       size: 30,
                      //     ),
                      //   )
                      //       : Text(
                      //     'تسجيل الدخول',
                      //     style: TextStyle(color: Colors.cyanAccent),
                      //     semanticsLabel: 'Login',
                      //   ),
                      // ),

                      // TextButton(
                      //   onPressed: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(builder: (context) => SignUpScreen()),
                      //     );
                      //   },
                      //   child: Text(
                      //     'ليس لديك حساب ؟ قم بإنشاء حساب ',
                      //     style: TextStyle(color: Colors.cyanAccent),
                      //     semanticsLabel: 'go to Sign up screen to create a new account',
                      //   ),
                      // ),
                      // _showForgotPassword
                      //     ? TextButton(
                      //   onPressed: _resetPassword,
                      //   child: Text(
                      //     ' نسيت كلمة المرور ؟!!',
                      //     style: TextStyle(color: Colors.cyanAccent),
                      //     semanticsLabel: 'Forget password',
                      //   ),
                      // )
                      //     : SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
