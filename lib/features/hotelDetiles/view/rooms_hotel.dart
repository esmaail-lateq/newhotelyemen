import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/consttint/text_tthems.dart';
import 'package:newhotelyemeni/features/celender/celender_controller.dart';
import 'package:newhotelyemeni/features/celender/celender_screen.dart';

class RoomsHotel extends StatelessWidget {
  const RoomsHotel({super.key});

  @override
  Widget build(BuildContext context) {
    CelenderController celenderController =
        Get.put<CelenderController>(CelenderController());
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              // alignment: Alignment.topLeft,
              child: Text(
                'قم بتحديد تاريخ الحجز والمغادرة وعدد الاشخاص',
                style: TextThemsCustom.font16GrayColorbold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(CelenderScreen());
                    // Get.to(MyHomePage(
                    //   title: 'test',
                    // ));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.5,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'تاريخ الوصول',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text('تاريخ المغادرة',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w800))
                          ],
                        ),
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                celenderController.arriveDateDayMonth.value,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.text4),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(celenderController.leaveDateDayMonth.value,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.text4))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.5,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1 غرفة 2  بالغون 0 اطفال ',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppColors.text4),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                itemCount: 10,
                itemBuilder: (context, index) => RoomCard(
                  title: 'غرفة دبلوكس - إطلالة على البسفور',
                  description: 'تسع 1 - 2 إطلالة على البسفور',
                  price: 511,
                  onViewDetails: () {},
                  onShowOptions: () {},
                ),
              ),
            ),
          ],
        ));
  }
}

class RoomCard extends StatelessWidget {
  final String title;
  final String description;
  final int price;
  final VoidCallback onViewDetails;
  final VoidCallback onShowOptions;

  const RoomCard({
    required this.title,
    required this.description,
    required this.price,
    required this.onViewDetails,
    required this.onShowOptions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.caardColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 90,
                  width: 110,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/test6.webp',
                          )),
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(11)),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 1),
                      // Text(description),
                      Row(
                        children: [
                          Text('تتسع ل 2'),
                          SizedBox(
                            width: 2,
                          ),
                          Icon(Icons.family_restroom_outlined,
                              size: 20, color: Colors.grey),
                          SizedBox(
                            width: 5,
                          ),
                          Text('فيها 1 سرير '),
                          Icon(
                            Icons.bed_outlined,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      InkWell(
                        onTap: onViewDetails,
                        child: Text(
                          'عرض معلومات الغرفة',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ابتداء من',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'USD $price',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      // tabController.animateTo(1);
                    },
                    child: Container(
                      child: Container(
                        height: 40,
                        width: 120,
                        // padding: EdgeInsets.only(right: 20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.gradint,
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          'احجز الان',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Widget celendarWidget(){
//   return CalendarDatePicker2WithActionButtons(
//   config: CalendarDatePicker2WithActionButtonsConfig(
//     firstDayOfWeek: 1,
//     calendarType: CalendarDatePicker2Type.range,
//     selectedDayTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
//     selectedDayHighlightColor: Colors.purple[800],
//     centerAlignModePicker: true,
//     customModePickerIcon: SizedBox(),
//     dayBuilder: _yourDayBuilder,
//     yearBuilder: _yourYearBuilder,
//   ),
//   value: _dates,
//   onValueChanged: (dates) => _dates = dates,
// );
// }