import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/consttint/text_tthems.dart';
import 'package:newhotelyemeni/features/home/data/model/hotel_model.dart';
import 'package:newhotelyemeni/features/hotelDetiles/hotel_details_screen.dart';

class FavoritHotelCard extends StatelessWidget {
  final ModelHotel hotel;
  const FavoritHotelCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => HotelDetailsScreen(hotel: hotel),arguments: {
                                       
                                            "hotelId":hotel.hotelId
                                          });
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
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: AssetImage(hotel.hotelImage!),
                      fit: BoxFit.cover,
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
                  // SizedBox(height: 12),
                  // Wrap(
                  //   spacing: 8,
                  //   runSpacing: 8,
                  //   alignment: WrapAlignment.end,
                  //   children: [
                  //     for (var amenity in hotel['amenities'])
                  //       Container(
                  //         padding: EdgeInsets.symmetric(
                  //           horizontal: 8,
                  //           vertical: 4,
                  //         ),
                  //         decoration: BoxDecoration(
                  //           color: Colors.blue.withOpacity(0.1),
                  //           borderRadius:
                  //               BorderRadius.circular(12),
                  //         ),
                  //         child: Text(
                  //           amenity,
                  //           style: TextStyle(
                  //             color: Colors.blue,
                  //             fontSize: 12,
                  //           ),
                  //         ),
                  //       ),
                  //   ],
                  // ),
                  // SizedBox(height: 16),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // الانتقال إلى صفحة الحجز
                  //   },
                  //   child: Text('احجز الآن'),
                  //   style: ElevatedButton.styleFrom(
                  //     minimumSize: Size(double.infinity, 45),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
