import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:newhotelyemeni/core/consttint/images.dart';

class LoagingDialog extends StatelessWidget {
  const LoagingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: InkWell(
        onTap: () {
          Get.back();
        },
        child: Center(
          child: Container(
              margin: EdgeInsets.only(bottom: 60),
              // color: Colors.white,
              child: Lottie.asset(AppImages.Loading, height: 300, width: 300)),
        ),
      ),
    );
  }
}
