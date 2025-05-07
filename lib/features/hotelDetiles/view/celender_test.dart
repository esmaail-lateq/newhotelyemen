import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/widget/auth/customebuttone.dart';

final today = DateUtils.dateOnly(DateTime.now());
final firstFate = DateTime(today.year, today.month);
final lastFate = DateTime(today.year, today.month + 10);

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scrollController = ScrollController();
  List<DateTime?> _dialogCalendarPickerValue = [
    DateTime(2021, 8, 10),
    DateTime(2021, 8, 13),
  ];
  List<DateTime?> _singleDatePickerValueWithDefaultValue = [
    DateTime.now().add(const Duration(days: 1)),
  ];
  List<DateTime?> _multiDatePickerValueWithDefaultValue = [
    DateTime(today.year, today.month, 1),
    DateTime(today.year, today.month, 5),
    DateTime(today.year, today.month, 14),
    DateTime(today.year, today.month, 17),
    DateTime(today.year, today.month, 25),
  ];
  List<DateTime?> _rangeDatePickerValueWithDefaultValue = [
    DateTime(1999, 5, 6),
    DateTime(1999, 5, 21),
  ];

  List<DateTime?> _rangeDatePickerWithActionButtonsWithValue = [
    DateTime.now(),
    DateTime.now().add(const Duration(days: 1)),
  ];
  String? thedate = '';
  @override
  void initState() {
    // _scrollController.addListener(() {
    //   if (_scrollController.offset > 1000) {
    //     // ignore: avoid_print
    //     print('scrolling distance: ${_scrollController.offset}');
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      // لضبط اتجاه الواجهة من اليمين لليسار
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomSheet: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(width: 0.5, color: Colors.grey))),
          height: 100,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('الثلثاء 13 -الجمعة 30 مايو (ليلتين)'),
              // CustomButtom(onPressed: () {}, titel: 'titel')
              Container(
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
                  ))
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Get.to(TravelDatePickerPage());
        //   },
        // ),
        appBar: AppBar(
          title: Text('اختار تواريخ الحجز'.tr),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                // width: 350,
                child: _buildScrollCalendarWithActionButtons(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
              .map((v) => v.toString().replaceAll('00:00:00.000', ''))
              .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '$startDate to $endDate';
      } else {
        return 'null';
      }
    }

    return valueText;
  }

  Widget _buildScrollCalendarWithActionButtons() {
    final config = CalendarDatePicker2WithActionButtonsConfig(
      daySplashColor: Colors.transparent,
      firstDate: firstFate,
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
    // return CalendarDatePicker2WithActionButtons(
    //   config: config,
    //   value: _rangeDatePickerWithActionButtonsWithValue,
    //   onValueChanged: (dates) =>
    //       setState(() => _rangeDatePickerWithActionButtonsWithValue = dates),
    // );
    return SizedBox(
      width: 375,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          const Text('قم بتحديد تاريخ بداية الحجز وتاريخ المغادرة'),
          const SizedBox(height: 10),
          Text(
            'تاريخ الوصول:الجمعة  تاريخ المغادرة: الاحد',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            '${thedate}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          CalendarDatePicker2WithActionButtons(
            config: config,
            value: _rangeDatePickerWithActionButtonsWithValue,
            onValueChanged: (dates) {
              setState(() {
                thedate = _getValueText(
                  config.calendarType,
                  _rangeDatePickerWithActionButtonsWithValue,
                );
              });

              setState(
                  () => _rangeDatePickerWithActionButtonsWithValue = dates);
            },
          ),
          const SizedBox(height: 10),
          // Row(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     const Text('Selection(s):  '),
          //     const SizedBox(width: 10),
          //     Flexible(
          //       child: Text(
          // _getValueText(
          //   config.calendarType,
          //   _rangeDatePickerWithActionButtonsWithValue,
          // ),
          //       ),
          //     ),
          //   ],
          // ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}

// void main() {
//   runApp(TravelDatePickerApp());
// }

// class TravelDatePickerApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       translations: MyTranslations(),
//       locale: const Locale('ar'),
//       fallbackLocale: const Locale('ar'),
//       theme: ThemeData(
//         fontFamily: 'Tajawal', // غيّره حسب الخط الذي تستخدمه
//       ),
//       home: TravelDatePickerPage(),
//     );
//   }
// }

class TravelDatePickerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      // لضبط اتجاه الواجهة من اليمين لليسار
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text('choose_travel_dates'.tr)),
        body: Center(
          child: SizedBox(
            // width: 350,
            child: TravelDateRangePicker(),
          ),
        ),
      ),
    );
  }
}

class TravelDateRangePicker extends StatefulWidget {
  @override
  State<TravelDateRangePicker> createState() => _TravelDateRangePickerState();
}

class _TravelDateRangePickerState extends State<TravelDateRangePicker> {
  List<DateTime?> _selectedRange = [
    DateTime(2025, 5, 13),
    DateTime(2025, 5, 30),
  ];

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker2WithActionButtons(
      config: CalendarDatePicker2WithActionButtonsConfig(
        calendarType: CalendarDatePicker2Type.range,
        firstDayOfWeek: 0,
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
            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        dayTextStyle: const TextStyle(fontSize: 16),
        selectedDayHighlightColor: Colors.teal,
        selectedDayTextStyle: const TextStyle(color: Colors.white),
        weekdayLabelTextStyle: const TextStyle(fontSize: 14),
        centerAlignModePicker: true,
        // okButtonText: 'confirm'.tr,
        // cancelButtonText: 'cancel'.tr,
        selectedRangeHighlightColor: Colors.teal.withOpacity(0.2),
      ),
      value: _selectedRange,
      onValueChanged: (values) {
        setState(() {
          _selectedRange = values;
        });
      },
      onOkTapped: () {
        if (_selectedRange[0] != null && _selectedRange[1] != null) {
          final from = _selectedRange[0]!;
          final to = _selectedRange[1]!;
          Get.snackbar('تم', 'الفترة المختارة: $from - $to',
              snackPosition: SnackPosition.BOTTOM);
        }
      },
    );
  }
}

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {
          'choose_travel_dates': 'اختيار تواريخ السفر',
          'confirm': 'تأكيد',
          'cancel': 'إلغاء',
        },
        // يمكنك إضافة لغات أخرى هنا
      };
}
