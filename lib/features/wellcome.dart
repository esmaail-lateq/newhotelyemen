
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:newhotelyemeni/core/consttint/images.dart';

class Wellcome extends StatelessWidget {
  const Wellcome({super.key});

  @override
  Widget build(BuildContext context) {
    // WellcomeControllerImp controller =   Get.put(WellcomeControllerImp());
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 100),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image:AssetImage(AppImages.Imlogo),
              fit: BoxFit.fill,
            ),
          ),


          child: LoadingAnimationWidget.staggeredDotsWave(
            color: Colors.cyanAccent,
            size: 70,
          ),

          // child: Container(
          //   padding: EdgeInsets.only(top: 320),
          //   child: Lottie.asset(
          //     'assets/animation/DottedLoading.json',
          //     repeat: true,
          //     // reverse: true,
          //     width: 190,
          //     height: 200,
          //   ),
          // )
        ),
      ),
    );
  }
}
