import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:newhotelyemeni/core/class/failer.dart';
import 'package:newhotelyemeni/core/class/statusRquest.dart';
import 'package:newhotelyemeni/core/consttint/images.dart';
import 'package:newhotelyemeni/core/sharedWidget/snakbar.dart';

apiErorrsDialog(Failure failur) {
  StatusRquest status = failur.status;
  String massage = failur.message['message'];
  switch (status) {
    case StatusRquest.authFailer:
      Get.dialog(ErorrMasseageAnimation(
        animationAsset: AppImages.Anlogin,
      ));
      break;
    case StatusRquest.serverfailure:
      Get.dialog(ErorrMasseageAnimation(
        animationAsset: AppImages.ServerFaile,
      ));

      break;

    case StatusRquest.nune:
      break;

    case StatusRquest.loading:
      break;
    case StatusRquest.success:
      break;
    case StatusRquest.failure:
      Get.dialog(ErorrMasseageAnimation(
        animationAsset: AppImages.Anlogin,
      ));
      break;

    case StatusRquest.offline:
      Get.dialog(ErorrMasseageAnimation(
        animationAsset: AppImages.Offline,
      ));
      break;

    case StatusRquest.badRequest:
      // TODO: Handle this case.
      Get.dialog(ErorrMasseageAnimation(
        animationAsset: AppImages.ServerFaile,
      ));
      break;

    case StatusRquest.notfound:
      // TODO: Handle this case.
      Get.dialog(ErorrMasseageAnimation(
        animationAsset: AppImages.Nodata,
      ));
      break;
    case StatusRquest.notValidate:
      // TODO: Handle this case.
      if (massage == 'The provided credentials are incorrect.') {
        errorSnakbar('خطء', 'كلمة السر او البريد الاكتروني غير صحيح');
      } else if (massage == 'Validation failed') {
        errorSnakbar('خطء', ' البريد الالكتروني هذا مسجل من قبل  ');
      }
  }
}

class ErorrMasseageAnimation extends StatelessWidget {
  final String animationAsset;
  const ErorrMasseageAnimation({super.key, required this.animationAsset});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
            width: 300,
            height: 300,
            // color: Colors.amber,
            child: Column(
              children: [
                Container(
                    alignment: Alignment.centerRight,
                    width: double.infinity,
                    // color: Colors.black,
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                        ))),
                Lottie.asset(
                  animationAsset,
                  height: 250,
                  width: 250,
                  delegates: LottieDelegates(
                    values: [
                      ValueDelegate.color(
                        const [
                          '**',
                          'Shape Layer 1',
                          'Fill 1'
                        ], // المسار للطبقة
                        value: Colors.red, // اللون الجديد
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
