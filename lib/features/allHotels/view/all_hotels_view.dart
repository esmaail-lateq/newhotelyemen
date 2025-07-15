import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:newhotelyemeni/core/class/handlin_status_view.dart';
import 'package:newhotelyemeni/core/class/shimmer%20effects/all_hotels_card_shimmer.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/consttint/text_tthems.dart';
import 'package:newhotelyemeni/features/allHotels/controller/all_hotels_controller.dart';
import 'package:newhotelyemeni/features/allHotels/view/widget/all_hotels_appbar.dart';
import 'package:newhotelyemeni/features/allHotels/view/widget/all_hotels_card.dart';
import 'package:newhotelyemeni/features/home/data/model/hotel_model.dart';
import 'package:newhotelyemeni/features/hotelsFilter/controller/hotels_filter_controler.dart';
import 'package:newhotelyemeni/features/hotelsFilter/widget/category_filter_chips.dart';

class AllHotelsView extends StatelessWidget {
  const AllHotelsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HotelsFilterControler());
    Get.put(AllHotelsController());
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(190.h),
        child: Container(
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.grey, width: 0.3))),
          // color: Colors.amber,
          // margin: const EdgeInsets.only(bottom: 4),
          child: Column(
            children: [
              AllHotelsAppbar(),
              // SizedBox(
              //   height: 10.h,
              // ),
            ],
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: GetBuilder<AllHotelsController>(
            builder: (controller) => HandlinStatusView(
                // onRefresh: controller.refresh,
                statusRquest: controller.statusRquest,
                widget: ListView.builder(
                  itemCount: controller.hoteldata.length,
                  itemBuilder: (context, index) => AllHotelCard(
                    hotel: controller.hoteldata[index],
                  ),
                ),
                shimmerWidget: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) => AllHotelsCardShimmer(),
                )),
          )

          // SingleChildScrollView(
          //   child: Column(
          //     children: [
          //       AllHotelsCardShimmer(),
          //       // CategoryFigetlterChips(),
          // AllHotelCard(
          //   hotel: ModelHotel(
          //       addressCity: 'صنعاء',
          //       addressCuntry: 'adsa',
          //       addressHotelid: 'asdsa',
          //       addressId: '1',
          //       addressStreet: 'شارع الستين',
          //       hotelDescription: 'askjxk',
          //       hotelId: '65',
          //       hotelImage: 'assets/images/test2.png',
          //       hotelName: 'ajhxs',
          //       hotelNamear: 'فايف استار',
          //       hotelRating: '4.5',
          //       hotelDescriptionar: 'khk',
          //       addressLat: '565',
          //       addressLong: '565'),
          // ),
          //       AllHotelCard(
          //         hotel: ModelHotel(
          //             addressCity: 'صنعاء',
          //             addressCuntry: 'adsa',
          //             addressHotelid: 'asdsa',
          //             addressId: '1',
          //             addressStreet: 'شارع الستين',
          //             hotelDescription: 'askjxk',
          //             hotelId: '65',
          //             hotelImage: 'assets/images/test2.png',
          //             hotelName: 'ajhxs',
          //             hotelNamear: 'فايف استار',
          //             hotelRating: '4.5',
          //             hotelDescriptionar: 'khk',
          //             addressLat: '565',
          //             addressLong: '565'),
          //       ),
          //       AllHotelCard(
          //         hotel: ModelHotel(
          //             addressCity: 'صنعاء',
          //             addressCuntry: 'adsa',
          //             addressHotelid: 'asdsa',
          //             addressId: '1',
          //             addressStreet: 'شارع الستين',
          //             hotelDescription: 'askjxk',
          //             hotelId: '65',
          //             hotelImage: 'assets/images/test2.png',
          //             hotelName: 'ajhxs',
          //             hotelNamear: 'فايف استار',
          //             hotelRating: '4.5',
          //             hotelDescriptionar: 'khk',
          //             addressLat: '565',
          //             addressLong: '565'),
          //       ),
          //     ],
          //   ),
          // ),
          ),
    ));
  }
}
