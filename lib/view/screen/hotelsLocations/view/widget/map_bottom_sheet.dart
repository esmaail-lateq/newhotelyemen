import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:newhotelyemeni/core/class/shimmer%20effects/map_bottom_sheet_shimmer.dart';
import 'package:newhotelyemeni/core/class/statusRquest.dart';
import 'package:newhotelyemeni/data/model/hotel_model.dart';
import 'package:newhotelyemeni/view/screen/hotel_details_screen.dart';
import 'package:newhotelyemeni/view/screen/hotelsLocations/controller/helper_class.dart';
import 'package:newhotelyemeni/view/screen/hotelsLocations/controller/mapBox_actions_controller.dart';

class MapBottomSheet extends GetView<MapboxActionsController> {
  final ScrollController scrollController;
  final String hotelName;
  final String hotelDescribe;
  final List<String> hotelImages;
  const MapBottomSheet(
      {super.key,
      required this.scrollController,
      required this.hotelName,
      required this.hotelDescribe,
      required this.hotelImages});

  @override
  Widget build(BuildContext context) {
    // List<Widget> images = [
    //   _imageCard('assets/images/test1.png'),
    //   _imageCard('assets/images/test2.png'),
    //   _imageCard('assets/images/test3.webp'),
    //   _imageCard('assets/images/test4.jpg'),
    //   _imageCard('assets/images/test5.jpg'),
    //   _imageCard('assets/images/test6.webp'),
    //   _imageCard('assets/images/test7.png'),
    //   _imageCard('assets/images/test8.png'),
    //   _imageCard('assets/images/test9.png'),
    // ];
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: 5,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      hotelName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  const Icon(Icons.star, color: Colors.amber),
                  const Text('3.7 (138)'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text('المسافة:'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    formatDistance(double.parse(controller
                            .routDataReault!['routes'][0]['distance']
                            .toString()) /
                        1000),
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.drive_eta_outlined,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                      formatTime(double.parse(controller
                              .routDataReault!['routes'][0]['duration']
                              .toString()) /
                          60),
                      style: TextStyle(fontSize: 12, color: Colors.grey))
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // _customChip(Icons.call, 'الاتصال'),
                  // _customChip(Icons.hotel, 'مدى التوفر'),
                  InkWell(
                    onTap: () {
                      controller.drawRoutLineAndChangeCameraPostition(
                          controller.routDataReault!['routes'][0]['geometry']);
                    },
                    child: _customChip(Icons.directions, 'الاتجاهات',
                        color: Colors.teal),
                  ),
                  InkWell(
                      onTap: () {
                        if (kDebugMode) {
                          print(controller.routDataReault!['routes'][0]);
                        }
                        Get.to(
                            () => HotelDetailsScreen(
                                  hotel: ModelHotel(hotelName: hotelName),
                                ),
                            arguments: {"cateogry": [], "hotelId": '1'});
                      },
                      child: _customChip(Icons.play_arrow, 'التفاصيل والحجز')),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                  height: 230,
                  child: GridView.custom(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 2,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      repeatPattern: QuiltedGridRepeatPattern.same,
                      pattern: [
                        QuiltedGridTile(2, 2),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                        // QuiltedGridTile(2, 2),
                      ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                      childCount: hotelImages.length,
                      (context, index) => _imageCard(hotelImages[index]),
                    ),
                  )),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.teal),
                  SizedBox(width: 8),
                  Expanded(
                      child: Text(
                          'اليمن، ${controller.routDataReault!['routes'][0]['legs'][0]['summary']}')),
                ],
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text('التفاصيل:',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                        textAlign: TextAlign.start,
                        '''
لمستقبل للتدريب الصيفي لطلاب وطالبات المستويين الأخيرين في الجامعات اليمنية لمنحهم فرصة التدريب خلال الإجازة الصيفية.
على مدار شهرين، سيوفر البرنامج للمشاركين فرصة فريدة لاكتساب خبرات وتطوير مهاراتهم من خلال التدريب عبر وظائف وشركات مختلفة في مجموعة هائل سعيد أنعم وشركاه. اغتنم هذه الفرصة لتنمية وتعزيز نموك الذاتي من 
''',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

void showHotelBottomSheet(String name, String decs, List<String> images) {
  MapboxActionsController mapboxActionsController = Get.find();
  Get.bottomSheet(
    DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.25,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        // return MapBottomSheet(
        //   scrollController: scrollController,
        // );
        return Obx(
          () {
            if (mapboxActionsController.statusRquest.value ==
                StatusRquest.success) {
              return MapBottomSheet(
                hotelName: name,
                hotelDescribe: decs,
                hotelImages: images,
                scrollController: scrollController,
              );
            } else if (mapboxActionsController.statusRquest.value ==
                StatusRquest.loading) {
              return MapBottomSheetShimmer(
                scrollController: scrollController,
              );
            } else {
              return Text('error');
            }
          },
        );
      },
    ),
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
  );
}

Widget _customChip(IconData icon, String label,
    {Color color = Colors.lightBlueAccent}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: color.withOpacity(0.2),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 4),
        Text(label, style: TextStyle(color: color)),
      ],
    ),
  );
}

Widget _imageCard(String assetPath) {
  return ClipRRect(
    child: Container(
      margin: const EdgeInsets.only(right: 8),
      width: 120,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(assetPath),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
// Widget _imageCard(String assetPath) {
//   return Container(
//     margin: const EdgeInsets.only(right: 8),
//     width: 120,
//     height: 100,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(12),
//       image: DecorationImage(
//         image: AssetImage(assetPath),
//         fit: BoxFit.cover,
//       ),
//     ),
//   );
// }
