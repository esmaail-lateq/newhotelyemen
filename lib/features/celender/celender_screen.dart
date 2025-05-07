import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:newhotelyemeni/features/celender/celender_controller.dart';
import 'package:newhotelyemeni/features/celender/widget/celender_bottom_sheet.dart';
import 'package:newhotelyemeni/features/celender/widget/scrollable_celender.dart';

final today = DateUtils.dateOnly(DateTime.now());
final firstFate = DateTime(today.year, today.month);
final lastFate = DateTime(today.year, today.month + 10);

class CelenderScreen extends StatelessWidget {
  const CelenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CelenderController controller = Get.find<CelenderController>();
    return Directionality(
      // لضبط اتجاه الواجهة من اليمين لليسار
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomSheet: CelenderBottomSheet(
          controller: controller,
        ),
        appBar: AppBar(
          titleSpacing: 60,
          title: Text('اختار تواريخ الحجز'.tr),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                // width: 350,
                child: buildScrollCalendarWithActionButtons(controller),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
