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
    return Scaffold(
        body: GetBuilder<LoginControllerImp>(
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
                    '4'.tr,
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
                  const SizedBox(height: 16.0),
                  Semantics(
                    label: "Email",
                    child: CustomTextForm(
                      icon: Icons.email,
                      mycontroller: controller.email,
                      keyboardType: TextInputType.emailAddress,
                      label: ' Email Addrees',
                      validator: (val) {
                        return validInput(val!, 4, 50, "username");
                      },
                    ),
                  ),
                  Semantics(
                    label: "Password",
                    child: CustomTextForm(
                      icon: Icons.lock,
                      mycontroller: controller.password,
                      keyboardType: TextInputType.text,
                      label: ' Password',
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "يجب ان تملى الحقل";
                        }
                      },
                      isPassword: controller.ispassword,
                      chingpassword: () {
                        controller.showPassword();
                      },
                      iconpassword: Icons.visibility,
                      iconshowpassword: Icons.visibility_off,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: (){
                      controller.forgetpassword();
                    },
                    child: Text("5".tr, style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  
                  CustomButtom(
                    onPressed: () {
                      controller.login();
                    },
                    titel: '2'.tr,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "7".tr,
                        style: TextStyle(color: AppColors.text2, fontSize: 14),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed("/signup");
                        },
                        child: Text(
                          "3".tr,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.text1),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
