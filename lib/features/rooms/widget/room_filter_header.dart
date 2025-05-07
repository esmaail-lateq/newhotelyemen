import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/features/celender/celender_controller.dart';
import 'package:newhotelyemeni/features/celender/celender_screen.dart';
import 'package:newhotelyemeni/features/numberOfGuests/number_of_guest_controller.dart';
import 'package:newhotelyemeni/features/numberOfGuests/number_of_guests.dart';

class RoomFilterHeader extends StatelessWidget {
  final CelenderController celenderController;
  final NumberOfGuestController numberOfGuestController;
  const RoomFilterHeader(
      {super.key,
      required this.celenderController,
      required this.numberOfGuestController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Get.to(() => CelenderScreen());
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
          child: InkWell(
            onTap: () {
              Get.to(() => NumberOfGuests());
            },
            child: Obx(() {
              return Container(
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
                    Text.rich(TextSpan(
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.text4),
                        children: [
                          TextSpan(
                            text:
                                '${numberOfGuestController.confermdRooms.length}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' غرفة ',
                          ),
                          TextSpan(
                            text: '${numberOfGuestController.totalAdults}',
                          ),
                          TextSpan(
                            text: ' بالغون ',
                          ),
                          TextSpan(
                            text: '${numberOfGuestController.totalChildren}',
                          ),
                          TextSpan(
                            text: ' اطفال ',
                          ),
                        ])),
                    // Text(
                    //   '1 غرفة 2  بالغون 0 اطفال ',
                    // style: TextStyle(
                    //     fontSize: 13,
                    //     fontWeight: FontWeight.bold,
                    //     color: AppColors.text4),
                    // ),
                  ],
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
