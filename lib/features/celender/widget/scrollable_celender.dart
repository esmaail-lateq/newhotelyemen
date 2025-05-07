import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/features/celender/celender_screen.dart';
import 'package:newhotelyemeni/features/celender/widget/celender_top_screen.dart';

import '../celender_controller.dart';

Widget buildScrollCalendarWithActionButtons(CelenderController controller) {
  
  return SizedBox(
    width: 375,
    child: Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        const SizedBox(height: 10),
        CelenderTopScreen(
          controller: controller,
        ),
        GetBuilder<CelenderController>(
          builder: (controller) => CalendarDatePicker2(
            config: config,
            value: controller.rangeDatePickerWithActionButtonsWithValue,
            onValueChanged: (values) {
              print(values);
              // print(
              //     '${controller.rangeDatePickerWithActionButtonsWithValue}');
              if (values.length == 1) {
                final from = values[0]!;
                controller.dateRangeSelctedString.value =
                    controller.formatSelectedDateRange(from, null);
                controller.changeValues(values);
              } else if (values.length == 2) {
                if (values[0] == values[1]) {
                  DateTime start = values[0];
                  DateTime end = start.add(Duration(days: 1));
                  controller.dateRangeSelctedString.value =
                      controller.formatSelectedDateRange(start, end);
                  controller.changeValues([start, end]);
                } else {
                  controller.dateRangeSelctedString.value =
                      controller.formatSelectedDateRange(values[0], values[1]);

                  controller.changeValues(values);
                }
              }

              print(controller.rangeDatePickerWithActionButtonsWithValue);

              // controller.rangeDatePickerWithActionButtonsWithValue = dates;
            },
          ),
        ),
        const SizedBox(height: 10),
        const SizedBox(height: 25),
      ],
    ),
  );
}

final config = CalendarDatePicker2Config(
    daySplashColor: Colors.transparent,
    firstDate: DateTime.now(),
    lastDate: lastFate,
    calendarType: CalendarDatePicker2Type.range,
    calendarViewMode: CalendarDatePicker2Mode.scroll,
    // rangeBidirectional: true,

    // animateToDisplayedMonthDate: true,
    firstDayOfWeek: 0,
    hideScrollViewMonthWeekHeader: true,

    weekdayLabels: [
      'الأحد',
      'الاثنين',
      'الثلاثاء',
      'الأربعاء',
      'الخميس',
      'الجمعة',
      'السبت'
    ],
    controlsTextStyle:
        const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    dayTextStyle: const TextStyle(fontSize: 18),
    selectedDayHighlightColor: AppColors.text4,
    selectedDayTextStyle: const TextStyle(color: Colors.white),
    weekdayLabelTextStyle: const TextStyle(fontSize: 14),
    centerAlignModePicker: false,

    // okButtonText: 'confirm'.tr,
    // cancelButtonText: 'cancel'.tr,
    selectedRangeHighlightColor: AppColors.text4.withOpacity(0.2),
    rangeBidirectional: false,
    scrollViewConstraints: const BoxConstraints(maxHeight: 800),
  );
