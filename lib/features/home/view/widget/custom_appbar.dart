import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newhotelyemeni/core/consttint/app_string.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/features/home/view/widget/chooseCityList.dart';

import 'package:newhotelyemeni/features/home/view/widget/custom_appbar_text_filed.dart';

class CustomAppbar extends StatelessWidget {
  final List<String> citys = [
    "صنعاء",
    "الحديدة",
    "عدن",
    "ذمار",
    "تعز",
    "صعدة",
    "اب"
  ];
  CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25.h),
          // Location
          Container(child: Text('اهلا عبدالملك !')),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 7.h),

                  ChooseCityList(
                    itemsIcons: Icons.location_on,
                    items: citys,
                    hintText: 'صنعاء',
                    cuntry: 'اليمن',
                    suffixIcon: Icons.location_city_outlined,
                  )

                  // Row(
                  //   children: [
                  //     Icon(
                  //       Icons.location_on_outlined,
                  //       size: 30,
                  //     ),
                  //     SizedBox(
                  //       width: 5,
                  //     ),
                  //     Text(
                  //       AppString.locationData,
                  // style: TextStyle(
                  //   fontSize: 14.sp,
                  //   fontWeight: FontWeight.bold,
                  //   color: AppColors.black,
                  // ),
                  //     ),
                  //     Icon(
                  //       Icons.keyboard_arrow_down_rounded,
                  //       color: AppColors.black,
                  //     ),
                  //   ],
                  // ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(9.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(color: Colors.grey, width: 0.5)),
                child: Icon(
                  Icons.notifications_none_rounded,
                  size: 22,
                ),
              )
            ],
          ),
          SizedBox(height: 20.h),

          // Search Bar
          Row(
            children: [
              Expanded(
                child: Container(
                  // padding: EdgeInsets.symmetric(horizontal: 2.w),
                  height: 42.h,
                  child: CustomAppbarTextFiled(
                    lable: AppString.searchHint,
                    iconDataPrifix: Icons.search,
                    iconDataSufix: null,
                    iconsize: 20,
                    radios: 10,
                    lableSize: 15,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Container(
                padding: EdgeInsets.all(9.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(color: Colors.grey, width: 0.5)),
                child: Icon(
                  Icons.favorite_border_outlined,
                  size: 22,
                ),
              )
            ],
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
