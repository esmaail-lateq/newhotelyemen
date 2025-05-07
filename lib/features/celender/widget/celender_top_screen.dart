import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/features/celender/celender_controller.dart';

class CelenderTopScreen extends StatelessWidget {
  final CelenderController controller;
  const CelenderTopScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        // margin: EdgeInsets.symmetric(horizontal: 20),
        width: 250,
        decoration: BoxDecoration(
            color: AppColors.text4.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 0.3, color: Colors.grey)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(children: [
              TextSpan(
                text: 'تاريخ الوصول: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: controller.arriveDate.value,
              )
            ])),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: 'تاريخ ألمعادرة: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: controller.leaveDate.value,
              )
            ])),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: 'عدد الليالي: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: controller.nights.value,
              )
            ])),
            // Text('data'),
          ],
        ),
      );
    });
  }
}
