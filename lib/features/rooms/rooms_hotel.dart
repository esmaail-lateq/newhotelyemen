import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/consttint/text_tthems.dart';
import 'package:newhotelyemeni/features/celender/celender_controller.dart';
import 'package:newhotelyemeni/features/celender/celender_screen.dart';
import 'package:newhotelyemeni/features/numberOfGuests/number_of_guest_controller.dart';
import 'package:newhotelyemeni/features/numberOfGuests/number_of_guests.dart';
import 'package:newhotelyemeni/features/payment/chose_payment_screen.dart';
import 'package:newhotelyemeni/features/rooms/room_hotel_details.dart';
import 'package:newhotelyemeni/features/rooms/widget/room_card.dart';
import 'package:newhotelyemeni/features/rooms/widget/room_filter_header.dart';

class RoomsHotel extends StatelessWidget {
  const RoomsHotel({super.key});

  @override
  Widget build(BuildContext context) {
    CelenderController celenderController =
        Get.put<CelenderController>(CelenderController());
    NumberOfGuestController numberOfGuestController =
        Get.put(NumberOfGuestController());

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
            RoomFilterHeader(
              celenderController: celenderController,
              numberOfGuestController: numberOfGuestController,
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
                  reservation: () {
                    Get.to(() => ChosePaymentScreen());
                  },
                ),
              ),
            ),
          ],
        ));
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