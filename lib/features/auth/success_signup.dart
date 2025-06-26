import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/consttint/app_icons_lottet.dart';
import 'package:newhotelyemeni/core/consttint/rout_name.dart';
import 'package:newhotelyemeni/core/consttint/text_tthems.dart';
import 'package:newhotelyemeni/core/widget/auth/customebuttone.dart';


class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.background,
            elevation: 0.0,
            title: Text(
              "Success",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
            )),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),

          child: Column(children: [
            Lottie.asset(
              AppIconsLotit.Success,
              width: 500,
              height: 400,
              repeat: false,
              reverse: true,
            ),
            Text(
              'تم تاكيد حسابك بنجاح اضغط على المتابعة',
              style: TextThemsCustom.font16GrayColorbold,
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 200,
              child: Customebuttone(
                color: Colors.green,
                text: 'متابعة'.tr,
                onPressed: () {
                  Get.toNamed(RoutName.homePage);
                },
              ),
            ),
          ]),
          // MaterialButton(onPressed: (){
          //   Get.offNamed("login");
          // },
          //   color: AppColors.primaryColor,
          //   child: Text("Go to login",style: TextStyle(
          //     fontWeight: FontWeight.bold,
          //   ),),
          // )
        ));
  }
}
