import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/consttint/text_tthems.dart';
import 'package:newhotelyemeni/features/allHotels/view/widget/all_hotels_appbar.dart';
import 'package:newhotelyemeni/features/home/data/model/hotel_model.dart';
import 'package:newhotelyemeni/features/hotelsFilter/controller/hotels_filter_controler.dart';
import 'package:newhotelyemeni/features/hotelsFilter/widget/category_filter_chips.dart';

class AllHotelsView extends StatelessWidget {
  const AllHotelsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HotelsFilterControler());
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              // CategoryFilterChips(),
              FavoritHotelCard(
                hotel: ModelHotel(
                    addressCity: 'صنعاء',
                    addressCuntry: 'adsa',
                    addressHotelid: 'asdsa',
                    addressId: '1',
                    addressStreet: 'شارع الستين',
                    hotelDescription: 'askjxk',
                    hotelId: '65',
                    hotelImage: 'assets/images/test2.png',
                    hotelName: 'ajhxs',
                    hotelNamear: 'فايف استار',
                    hotelRating: '4.5',
                    hotelDescriptionar: 'khk',
                    addressLat: '565',
                    addressLong: '565'),
              ),
              FavoritHotelCard(
                hotel: ModelHotel(
                    addressCity: 'صنعاء',
                    addressCuntry: 'adsa',
                    addressHotelid: 'asdsa',
                    addressId: '1',
                    addressStreet: 'شارع الستين',
                    hotelDescription: 'askjxk',
                    hotelId: '65',
                    hotelImage: 'assets/images/test2.png',
                    hotelName: 'ajhxs',
                    hotelNamear: 'فايف استار',
                    hotelRating: '4.5',
                    hotelDescriptionar: 'khk',
                    addressLat: '565',
                    addressLong: '565'),
              ),
              FavoritHotelCard(
                hotel: ModelHotel(
                    addressCity: 'صنعاء',
                    addressCuntry: 'adsa',
                    addressHotelid: 'asdsa',
                    addressId: '1',
                    addressStreet: 'شارع الستين',
                    hotelDescription: 'askjxk',
                    hotelId: '65',
                    hotelImage: 'assets/images/test2.png',
                    hotelName: 'ajhxs',
                    hotelNamear: 'فايف استار',
                    hotelRating: '4.5',
                    hotelDescriptionar: 'khk',
                    addressLat: '565',
                    addressLong: '565'),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class FavoritHotelCard extends StatelessWidget {
  final ModelHotel hotel;
  const FavoritHotelCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.to(() => HotelDetailsScreen(hotel: hotel),arguments: {

        //                                     "hotelId":hotel.hotelId
        //                                   });
        print('hootel taaped');
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 16),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 250.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: AssetImage(hotel.hotelImage!),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      // حذف من المفضلة
                      print('fave taaped');
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text(
                      //   '\$${hotel['price']}/ليلة',
                      //   style: TextStyle(
                      //     color: Colors.green,
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 16,
                      //   ),
                      // ),
                      Text(
                        hotel.hotelNamear!,
                        style: TextThemsCustom.font22BlackBolde,
                      ),
                    ],
                  ),
                  SizedBox(height: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.grey,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            hotel.addressCity!,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '.  ${hotel.addressStreet}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  hotel.hotelRating!,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '(156تقييم)',
                            style: TextThemsCustom.font10GrayColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'السعر لليلة الواحدة',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'USD 458.0',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.secundColor),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
