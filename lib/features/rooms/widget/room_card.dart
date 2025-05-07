import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/features/rooms/room_hotel_details.dart';

class RoomCard extends StatelessWidget {
  final String title;
  final String description;
  final int price;
  final VoidCallback onViewDetails;
  final VoidCallback onShowOptions;

  const RoomCard({
    required this.title,
    required this.description,
    required this.price,
    required this.onViewDetails,
    required this.onShowOptions,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => RoomHotelDetails());
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.caardColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 90,
                    width: 110,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/images/test6.webp',
                            )),
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(11)),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 1),
                        // Text(description),
                        Row(
                          children: [
                            Text('تتسع ل 2'),
                            SizedBox(
                              width: 2,
                            ),
                            Icon(Icons.family_restroom_outlined,
                                size: 20, color: Colors.grey),
                            SizedBox(
                              width: 5,
                            ),
                            Text('فيها 1 سرير '),
                            Icon(
                              Icons.bed_outlined,
                              size: 20,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        SizedBox(height: 2),
                        InkWell(
                          onTap: onViewDetails,
                          child: Text(
                            'عرض معلومات الغرفة',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ابتداء من',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          'USD $price',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        // tabController.animateTo(1);
                      },
                      child: Container(
                        child: Container(
                          height: 40,
                          width: 120,
                          // padding: EdgeInsets.only(right: 20),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.text4,
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            'احجز الان',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
