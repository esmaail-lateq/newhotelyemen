import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/consttint/text_tthems.dart';
import 'package:newhotelyemeni/features/home/data/model/hotel_model.dart';
import 'package:newhotelyemeni/features/favorite/view/widget/favorit_hotel_card.dart';
import 'package:newhotelyemeni/core/widget/fontandtext.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  // نموذج بيانات للفنادق المفضلة (سيتم استبداله بالبيانات الفعلية من قاعدة البيانات)

  @override
  Widget build(BuildContext context) {
    final List<ModelHotel> hoteldata = [
      ModelHotel(
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
      ModelHotel(
          addressCity: 'صنعاء',
          addressCuntry: 'adsa',
          addressHotelid: 'asdsa',
          addressId: '1',
          addressStreet: 'جولة عمران',
          hotelDescription: 'askjxk',
          hotelId: '65',
          hotelImage: 'assets/images/test7.png',
          hotelName: 'ajhxs',
          hotelNamear: 'فندق عمران',
          hotelRating: '4.1',
          hotelDescriptionar: 'khk',
          addressLat: '565',
          addressLong: '565'),
      ModelHotel(
          addressCity: 'صنعاء',
          addressCuntry: 'adsa',
          addressHotelid: 'asdsa',
          addressId: '1',
          addressStreet: 'حدة',
          hotelDescription: 'askjxk',
          hotelId: '65',
          hotelImage: 'assets/images/test6.webp',
          hotelName: 'ajhxs',
          hotelNamear: 'فندق حدة',
          hotelRating: '3.2',
          hotelDescriptionar: 'khk',
          addressLat: '565',
          addressLong: '565'),
    ];
    final textStyles = Get.find<CustomTextStyles>();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   title: Text(
      //     'المفضلة',
      //     style: textStyles.titleStyle(),
      //   ),
      //   centerTitle: true,
      // ),
      body: hoteldata.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'لا توجد فنادق في المفضلة',
                    style: textStyles.titleStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'المفضلة',
                    style: TextThemsCustom.appbarText,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: hoteldata.length,
                    padding: EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      final hotel = hoteldata[index];
                      return FavoritHotelCard(
                        hotel: hotel,
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
