import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:newhotelyemeni/features/favorite/favorites_controller.dart';

import 'package:newhotelyemeni/features/home/controller/home_page_controller.dart';
import 'package:newhotelyemeni/features/user-profile/user_controller.dart';

import 'package:newhotelyemeni/features/home/view/widget/chooseCityList.dart';
import 'package:newhotelyemeni/features/home/view/widget/custom_appbar.dart';
import 'package:newhotelyemeni/features/home/hotel_items.dart';
import 'package:newhotelyemeni/features/home/view/widget/home_page_top_texts.dart';
import 'package:newhotelyemeni/features/home/view/widget/hotel_card_view.dart';
import 'package:newhotelyemeni/features/hotelDetiles/view/hotel_details_screen_new.dart';
import 'package:newhotelyemeni/features/hotelDetiles/hotel_details_screen.dart';

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
    final size = MediaQuery.of(context).size;
    Get.put(HomePageController());

    return GetBuilder<HomePageController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(size.height / 2 - 100),
              child: CustomAppbar()),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        HomePageTopTexts(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ChooseCityList(
                                itemsIcons: Icons.hotel_outlined,
                                items: hotelAttre,
                                hintText: 'مميزات الفندق',
                                suffixIcon: Icons.filter_alt_outlined,
                              ),
                              ChooseCityList(
                                itemsIcons: Icons.location_on,
                                items: citys,
                                hintText: 'اختر مدينة',
                                suffixIcon: Icons.location_city_outlined,
                              ),
                            ],
                          ),
                        ),
                        
                        SizedBox(height: 20),
                        SizedBox(
                          // width: ,
                          height: MediaQuery.of(context).size.height / 4,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.hoteldata.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(HotelDetailsScreenNew());
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
                                      hotel: controller.hoteldata[index],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        if (controller.selectcate != null) HotelItems(),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
