import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/consttint/images.dart';

errorSnakbar(String title, String message) {
  Get.rawSnackbar(title: title, message: message, backgroundColor: Colors.red);
}

successSnakbar(String title, String message) {
  Get.rawSnackbar(
      title: title, message: message, backgroundColor: Colors.green);
}

errorDialog(String title, String message) {
  Get.defaultDialog(
      buttonColor: AppColors.gradint,
      title: title,
      middleText: message,
      backgroundColor: Colors.white,
      textConfirm: 'حسنا',
      onConfirm: () => Get.back());
}

successDialog(String title, String message, void Function()? onConfirm) {
  Get.defaultDialog(
      buttonColor: AppColors.gradint,
      title: title,
      middleText: message,
      backgroundColor: Colors.white,
      textConfirm: 'حسنا',
      onConfirm: onConfirm);
}

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Center(
            child: Container(
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            // alignment: Alignment.centerRight,
                            // width: double.infinity,
                            // color: Colors.black,
                            child: IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                ))),
                        Text('خطء'),
                      ],
                    ),
                  ],
                )),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height / 2,
            right: MediaQuery.of(context).size.width / 2 - 50,
            child: Lottie.asset(
              repeat: false,
              AppImages.alert,
              height: 100,
              width: 100,
              delegates: LottieDelegates(
                values: [
                  ValueDelegate.color(
                    const ['**', 'Shape Layer 1', 'Fill 1'], // المسار للطبقة
                    value: Colors.red, // اللون الجديد
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
