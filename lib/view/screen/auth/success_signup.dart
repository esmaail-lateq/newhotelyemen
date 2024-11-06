import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/consttint/images.dart';

class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.background,
          elevation: 0.0,
          title: Text("Success",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color:Colors.white),
          )

      ),
      body: Container(
        padding: EdgeInsets.all(30),

          child:   Center(
            heightFactor: 300,
              widthFactor: 400,
              child:InkWell(
                onTap: () {
                  Get.offAllNamed("/login");
                },
                child:Lottie.asset(AppImages.Success,
                  width: 500,
                  height: 800,
                  repeat: false,
                  reverse: true,

                ),
              )
            ),
            // MaterialButton(onPressed: (){
            //   Get.offNamed("login");
            // },
            //   color: AppColors.primaryColor,
            //   child: Text("Go to login",style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //   ),),
            // )
      )



    );
  }
}

