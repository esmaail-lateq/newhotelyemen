import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:newhotelyemeni/controller/auth/login_controller.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/consttint/images.dart';
import 'package:newhotelyemeni/core/function/validator.dart';
import 'package:newhotelyemeni/view/widget/custombuttom.dart';
import 'package:newhotelyemeni/view/widget/customtextform.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return GetBuilder<LoginControllerImp>(
      builder: (controller) =>Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInUp(
                duration: Duration(milliseconds: 1000),
                  child: Text(
                'Login to Yemeni Hotel',
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
                      icon: Icons.email,
                      mycontroller: controller.email,
                      keyboardType: TextInputType.emailAddress,
                      label: 'Email Address',
                      validator: (val) {
                        return validInput(val!, 4, 50, "username");
                      },
                      // لون الإطار
                    ),
                    // حقل كلمة المرور
                    CustomTextForm(
                      icon: Icons.lock,
                      mycontroller: controller.password,
                      keyboardType: TextInputType.text,
                      label: 'Password',
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "This field is required";
                        }
                      },

                      isPassword: controller.ispassword,
                      chingpassword: () {
                        controller.showPassword();
                      },
                      iconpassword: Icons.visibility,
                      iconshowpassword: Icons.visibility_off,
                    ),
                  ],
                ),)
              ),

              const SizedBox(height: 5),
              FadeInUp(
                  duration:
                  Duration(milliseconds: 1500),
                  child: InkWell(
                    onTap: () {
                    },
                    child: Text(
                     "ForgetPassword!",
                      style: TextStyle(
                          color: Colors.grey.shade600),
                    ),
                  )),
              SizedBox(height: 10,),
              // زر تسجيل الدخول
              FadeInUp(
                duration: Duration(milliseconds: 1800),
                child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: const Color(0xFF0A99FF), // الأزرق المميز
                  ),
                  onPressed: () {
                    // منطق تسجيل الدخول
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),)

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
      ) ,
    );
  }
}

// Scaffold(
// body: GetBuilder<LoginControllerImp>(
// builder: (controller) => Form(
// key: controller.formstate,
// child: Container(
// height: 20000,
// color: AppColors.primaryColor,
// child: SingleChildScrollView(
// child: Padding(
// padding: const EdgeInsets.all(16.0),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.stretch,
// children: [
// SizedBox(height: 16),
// Lottie.asset(
// AppImages.Anlogin,
// repeat: true,
// reverse: true,
// width: 300,
// height: 300,
// ),
// Text(
// '4'.tr,
// style: TextStyle(
// color: Colors.cyanAccent,
// fontWeight: FontWeight.bold,
// fontSize: 25,
// ),
// textAlign: TextAlign.center,
// semanticsLabel: 'Login to Yemen Hotel Screen',
// ),
// Container(
// padding: EdgeInsets.only(left: 50, right: 50.0),
// width: 10,
// child: Divider(color: AppColors.text1),
// ),
// const SizedBox(height: 16.0),
// Semantics(
// label: "Email",
// child: CustomTextForm(
// icon: Icons.email,
// mycontroller: controller.email,
// keyboardType: TextInputType.emailAddress,
// label: ' Email Addrees',
// validator: (val) {
// return validInput(val!, 4, 50, "username");
// },
// ),
// ),
// Semantics(
// label: "Password",
// child: CustomTextForm(
// icon: Icons.lock,
// mycontroller: controller.password,
// keyboardType: TextInputType.text,
// label: ' Password',
// validator: (val) {
// if (val!.isEmpty) {
// return "يجب ان تملى الحقل";
// }
// },
// isPassword: controller.ispassword,
// chingpassword: () {
// controller.showPassword();
// },
// iconpassword: Icons.visibility,
// iconshowpassword: Icons.visibility_off,
// ),
// ),
// SizedBox(
// height: 10,
// ),
// InkWell(
// onTap: (){
// controller.forgetpassword();
// },
// child: Text("5".tr, style: TextStyle(color: Colors.white)),
// ),
// SizedBox(
// height: 10,
// ),
//
// CustomButtom(
// onPressed: () {
// controller.login();
// },
// titel: '2'.tr,
// ),
// SizedBox(
// height: 10,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text(
// "7".tr,
// style: TextStyle(color: AppColors.text2, fontSize: 14),
// ),
// InkWell(
// onTap: () {
// Get.toNamed("/signup");
// },
// child: Text(
// "3".tr,
// style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.bold,
// color: AppColors.text1),
// ),
// )
// ],
// )
// ],
// ),
// ),
// ),
// ),
// ),
// ))
