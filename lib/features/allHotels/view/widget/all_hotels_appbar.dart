import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import 'package:newhotelyemeni/core/consttint/app_string.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/function/city_bottom_sheet.dart';
import 'package:newhotelyemeni/core/function/user_city_location_mang.dart';
import 'package:newhotelyemeni/features/home/controller/citys_controller.dart';
import 'package:newhotelyemeni/features/home/view/widget/chooseCityList.dart';

import 'package:newhotelyemeni/features/home/view/widget/custom_appbar_text_filed.dart';

class AllHotelsAppbar extends StatelessWidget {
  final List<String> citys = [
    "صنعاء",
    "الحديدة",
    "عدن",
    "ذمار",
    "تعز",
    "صعدة",
    "اب"
  ];
  AllHotelsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    CityController controller = Get.find();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 25.h),
          // Location
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.arrow_back),
              Obx(
                () {
                  return Container(
                      child: Text(
                          '${AppString.hotelscity}${controller.selectedCity.value}'));
                },
              ),
              Icon(Icons.map),
            ],
          ),

          SizedBox(
            height: 20.h,
          ),

          InkWell(
            onTap: () {
              showCitySelectorBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 55.w),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 0.4)),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search_sharp),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(AppString.searchNearstHotle)
                ],
              ),
            ),
          ),

          SizedBox(
            height: 25.h,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.sort_outlined),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(AppString.sortBy)
                ],
              ),
              Row(
                children: [
                  Icon(Icons.filter_alt_outlined),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(AppString.filterSchose)
                ],
              ),

              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     SizedBox(height: 7.h),
              InkWell(
                onTap: () {
                  showCitySelectorBottomSheet();
                },
                child: Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    SizedBox(
                      width: 5.h,
                    ),
                    Obx(
                      () {
                        return Text(controller.selectedCity.value);
                      },
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                  ],
                ),
              )
              // ChooseCityList(
              //   itemsIcons: Icons.location_on,
              //   items: citys,
              //   hintText: 'صنعاء',
              //   cuntry: 'اليمن',
              //   suffixIcon: Icons.location_city_outlined,
              // )

              //   ],
              // ),
              // Container(
              //   padding: EdgeInsets.all(9.w),
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(9),
              //       border: Border.all(color: Colors.grey, width: 0.5)),
              //   child: Icon(
              //     Icons.notifications_none_rounded,
              //     size: 22,
              //   ),
              // )
            ],
          ),
          SizedBox(height: 20.h),

          // Search Bar

          // SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
