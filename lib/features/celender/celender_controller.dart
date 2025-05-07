import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CelenderController extends GetxController {
  List<DateTime?> rangeDatePickerWithActionButtonsWithValue = [
    DateTime.now(),
    DateTime.now().add(const Duration(days: 1)),
  ];
  List<DateTime?> selectedRange = [
    DateTime.now(),
    DateTime.now().add(const Duration(days: 1)),
  ].obs;
  List<String> weekdays = [
    'الأحد',
    'الاثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة',
    'السبت'
  ];

  // أسماء الشهور بالعربي
  List<String> months = [
    '',
    'يناير',
    'فبراير',
    'مارس',
    'أبريل',
    'مايو',
    'يونيو',
    'يوليو',
    'أغسطس',
    'سبتمبر',
    'أكتوبر',
    'نوفمبر',
    'ديسمبر',
  ];

  RxString dateRangeSelctedString = ''.obs;
  RxString arriveDate = ''.obs;
  RxString leaveDate = ''.obs;
  RxString arriveDateDayMonth = ''.obs;
  RxString leaveDateDayMonth = ''.obs;
  RxString nights = ''.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    dateRangeSelctedString.value = formatSelectedDateRange(
        rangeDatePickerWithActionButtonsWithValue[0]!,
        rangeDatePickerWithActionButtonsWithValue[1]);
    super.onInit();
  }

  changeValues(List<DateTime?> dates) {
    rangeDatePickerWithActionButtonsWithValue = dates;
    update();
  }

  confirmDateChnges() {
    selectedRange = rangeDatePickerWithActionButtonsWithValue;
    arriveDateDayMonth.value = formatDayAndMonthOnly(selectedRange[0]!);
    leaveDateDayMonth.value = formatDayAndMonthOnly(selectedRange[1]!);
  }

  String getValueText(
    List<DateTime?> values,
  ) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (values.isNotEmpty) {
      final startDate = values[0].toString().replaceAll('00:00:00.000', '');
      final endDate = values.length > 1
          ? values[1].toString().replaceAll('00:00:00.000', '')
          : 'null';
      valueText = '$startDate to $endDate';
    } else {
      return 'null';
    }

    return valueText;
  }

  formatSelectedDateRange(DateTime start, DateTime? end) {
    arriveDate.value = formatDateArrival(start);
    leaveDate.value = formatDateLeave(end);
    nights.value = formatNumberOfNIGHTS(start, end);
    arriveDateDayMonth.value = formatDayAndMonthOnly(selectedRange[0]!);
    leaveDateDayMonth.value = formatDayAndMonthOnly(selectedRange[1]!);

 
    return '${formatDateArrival(start)}  ${formatDateLeave(end)} ${formatNumberOfNIGHTS(start, end)}';
  }

  String formatDateArrival(DateTime start) {
    String day1 = weekdays[start.weekday % 7];
    String date1 = '${day1} ${start.day} ${months[start.month]}';
    return date1;
  }

  String formatDateLeave(DateTime? end) {
    if (end != null) {
      String day2 = weekdays[end.weekday % 7];

      String date2 = '${day2} ${end.day} ${months[end.month]}';

      return '$date2';
    }

    return 'حدد تاريخ المغادرة';
  }

  String formatNumberOfNIGHTS(DateTime start, DateTime? end) {
    if (end != null) {
      int nights = end.difference(start).inDays;
      return '(${nights} ليلة)';
    }
    return '';
  }

  String formatDayAndMonthOnly(DateTime date) {
    return '${date.day}  ${months[date.month]}';
  }
}
