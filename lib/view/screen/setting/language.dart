import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/locallzition/tranzlation_controller.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LocalController());
    return Scaffold(

      body:GetBuilder<LocalController>(builder: (controller) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text("1".tr),
          Container(
            child: MaterialButton(
              onPressed: (){
                controller.changelanguage("ar");
              },
              child: Text("Ar"),

            ),
          ),

          Container(
            child: MaterialButton(
              onPressed: (){
                controller.changelanguage("en");


              },
              child: Text("En"),
            ),
          ),
        ],
      ),) ,

    );
  }
}
