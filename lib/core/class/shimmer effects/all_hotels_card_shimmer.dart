import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/consttint/text_tthems.dart';
import 'package:shimmer/shimmer.dart';

class AllHotelsCardShimmer extends StatelessWidget {
  const AllHotelsCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[200]!,
        highlightColor: Colors.grey[400]!,
        child: Card(
          margin: EdgeInsets.only(bottom: 16),
          color: Colors.transparent,
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
                      color: Colors.black,

                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                      // image: DecorationImage(
                      //   image: AssetImage(hotel.hotelImage!),
                      //   fit: BoxFit.fill,
                      // ),
                    ),
                  ),
                  // Positioned(
                  //   top: 10,
                  //   left: 10,
                  //   child: Container(
                  //     width: 30,
                  //     height: 30,
                  //     color: Colors.grey,
                  //   ),
                  // ),
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
                        // Text(
                        //   hotel.hotelNamear!,
                        //   style: TextThemsCustom.font22BlackBolde,
                        // ),
                      ],
                    ),
                    SizedBox(height: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Row(
                        //   children: [
                        //     Icon(
                        //       Icons.location_on_outlined,
                        //       color: Colors.grey,
                        //       size: 20,
                        //     ),
                        //     SizedBox(
                        //       width: 5,
                        //     ),
                        //     Text(
                        //       'hotel.addressCity'!,
                        //       style: TextStyle(
                        //         color: Colors.black,
                        //         fontSize: 14,
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 10,
                        //     ),
                        //     Text(
                        //       '.  {hotel.addressStreet}',
                        //       style: TextStyle(
                        //         color: Colors.black,
                        //         fontSize: 14,
                        //       ),
                        //     )
                        //   ],
                        // ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    ' hotel.hotelRating!',
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
                            // Text(
                            //   '(156تقييم)',
                            //   style: TextThemsCustom.font10GrayColor,
                            // ),
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
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 100,
                            vertical: 0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'USD 458.0',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.secundColor),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
