import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/class/handlin_status_view.dart';
import 'package:newhotelyemeni/core/class/shimmer%20effects/home_page_card_shimmer.dart';
import 'package:newhotelyemeni/core/consttint/app_string.dart';
import 'package:newhotelyemeni/features/allHotels/view/all_hotels_view.dart';

import 'package:newhotelyemeni/features/favorite/favorites_controller.dart';

import 'package:newhotelyemeni/features/home/controller/home_page_controller.dart';
import 'package:newhotelyemeni/features/home/view/widget/home_card.dart';
import 'package:newhotelyemeni/features/hotelDetiles/view/screen/hotel_details_screen_new.dart';
import 'package:newhotelyemeni/features/user-profile/user_controller.dart';

import 'package:newhotelyemeni/features/home/view/widget/chooseCityList.dart';
import 'package:newhotelyemeni/features/home/view/widget/custom_appbar.dart';

import 'package:newhotelyemeni/features/home/view/widget/home_page_top_texts.dart';
import 'package:newhotelyemeni/features/home/view/widget/hotel_card_view.dart';

import 'package:newhotelyemeni/core/widget/fontandtext.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesController = Get.put(FavoritesController());
    final userController = Get.put(UserController());
    final textStyles = Get.find<CustomTextStyles>();
    final List<String> citys = [
      "صنعاء",
      "الحديدة",
      "عدن",
      "ذمار",
      "تعز",
      "صعدة",
      "اب"
    ];
    final List<String> hotelAttre = [
      "الاكثر زيارة",
      "الاعلى تقييم",
      "الاكثر مميزات",
    ];
    final List<Map<String, dynamic>> cityData = [
      {"id": "1", "name": "صنعاء", "street": "حدة", "icon": Icons.location_on},
      {"id": "2", "name": "عدن", "street": "حدة", "icon": Icons.location_on},
      {"id": "3", "name": "ذمار", "street": "حدة", "icon": Icons.location_on},
      {"id": "4", "name": "تعز", "street": "حدة", "icon": Icons.location_on},
      {
        "id": "5",
        "name": "الحديدة",
        "street": "حدة",
        "icon": Icons.location_on
      },
      {"id": "6", "name": "إب", "street": "حدة", "icon": Icons.location_on},
    ];
    // final size = MediaQuery.of(context).size;
    Get.put(HomePageController());
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white, // يجعل شريط الحالة شفافًا
        statusBarIconBrightness:
            Brightness.dark, // يجعل الأيقونات داكنة عند استخدام خلفية بيضاء
      ),
    );

    return GetBuilder<HomePageController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(200.h),
            child: Container(
              margin: const EdgeInsets.only(bottom: 4),
              child: Column(
                children: [
                  CustomAppbar(),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),

          //  PreferredSize(
          //     preferredSize: Size.fromHeight(300.h), child: CustomAppbar()),
          body: CustomScrollView(slivers: [
            SliverAppBar(
              expandedHeight: 190.h,
              floating: false,
              pinned: true,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background: HomeCarde(),
              ),
            ),
            SliverToBoxAdapter(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 20),
                              HomePageTopTexts(
                                showall: () {
                                  Get.to(() => AllHotelsView());
                                },
                                text: AppString.topHotelRate,
                              ),
                              SizedBox(
                                  // width: ,
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                  child: HandlinStatusView(
                                      // onRefresh: controller.refresh,
                                      statusRquest: controller.statusRquest,
                                      widget: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: controller.hoteldata.length,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(HotelDetailsScreenNew(
                                                    hotelsModle: controller
                                                        .hoteldata[index],
                                                  ));
                                                  // Get.to(
                                                  //     HotelDetailsScreen(
                                                  //         hotel:
                                                  //             controller.hoteldata[index]),
                                                  //     arguments: {
                                                  //       "cateogry": controller.servicesData,
                                                  //       "hotelId": controller
                                                  //           .hoteldata[index].hotelId
                                                  //     });
                                                },
                                                child: HotelCardView(
                                                  hotel: controller
                                                      .hoteldata[index],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      shimmerWidget: 
                                      ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 3,
                                        itemBuilder: (context, index) =>
                                            HomePageCardShimmer(),
                                      )
                                      )),
                              SizedBox(height: 20),
                            ]),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: <Widget>[
                        //     SizedBox(height: 20),
                        //     HomePageTopTexts(
                        //       text: AppString.topHotelRate,
                        //     ),
                        //     SizedBox(
                        //       // width: ,
                        //       height: MediaQuery.of(context).size.height / 4,
                        //       child: ListView.builder(
                        //         scrollDirection: Axis.horizontal,
                        //         itemCount: controller.hoteldata.length,
                        //         itemBuilder: (context, index) {
                        //           return Row(
                        //             mainAxisAlignment:
                        //                 MainAxisAlignment.spaceAround,
                        //             children: [
                        //               GestureDetector(
                        //                   onTap: () {
                        //                     Get.to(HotelDetailsScreenNew());
                        //                     // Get.to(
                        //                     //     HotelDetailsScreen(
                        //                     //         hotel:
                        //                     //             controller.hoteldata[index]),
                        //                     //     arguments: {
                        //                     //       "cateogry": controller.servicesData,
                        //                     //       "hotelId": controller
                        //                     //           .hoteldata[index].hotelId
                        //                     //     });
                        //                   },
                        //                   child: HomePageCardShimmer()),
                        //             ],
                        //           );
                        //         },
                        //       ),
                        //     ),
                        //     SizedBox(height: 20),
                        //   ],
                        // ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
