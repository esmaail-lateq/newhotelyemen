import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/features/celender/celender_controller.dart';

class CelenderBottomSheet extends StatelessWidget {
  final CelenderController controller;
  const CelenderBottomSheet({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(width: 0.5, color: Colors.grey))),
        height: controller.rangeDatePickerWithActionButtonsWithValue.length != 2
            ? 60
            : 100,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(controller.dateRangeSelctedString.value),
            // CustomButtom(onPressed: () {}, titel: 'titel')
            controller.rangeDatePickerWithActionButtonsWithValue.length != 2
                ? SizedBox()
                : InkWell(
                    onTap: () {
                      controller.confirmDateChnges();
                      Get.back();
                    },
                    child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.text4,
                        ),
                        height: 45,
                        child: Text(
                          'تاكيد',
                          style: TextStyle(color: Colors.white),
                        )),
                  )
          ],
        ),
      );
    });
  }
}
