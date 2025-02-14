import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/controller/auth_controller.dart';
import 'package:newhotelyemeni/controller/hotelsdetails_controller.dart';
import 'package:newhotelyemeni/core/consttint/images.dart';
import 'package:newhotelyemeni/data/model/hotel_model.dart';
import 'package:newhotelyemeni/view/screen/booking_screen.dart';
import 'package:newhotelyemeni/view/widget/fontandtext.dart';

import '../../core/consttint/links.dart';

class HotelDetailsScreen extends StatelessWidget {
  final ModelHotel hotel;
  final authController = Get.put(AuthController());

  HotelDetailsScreen({required this.hotel});

  Widget _buildFeatureCard(IconData icon, String title, String subtitle) {
    return Container(
      width: Get.width * 0.28,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.blue, size: 28),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          if (subtitle.isNotEmpty) ...[
            SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAmenityChip(IconData icon, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: Colors.blue),
          SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  void _showRatingDialog(BuildContext context) {
    if (authController.isLoggedIn) {
      Get.dialog(
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            'تسجيل الدخول مطلوب',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'يجب عليك تسجيل الدخول أولاً لتتمكن من تقييم الفندق',
            textAlign: TextAlign.right,
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
                // هنا سيتم التوجيه إلى صفحة تسجيل الدخول
                // Get.to(() => LoginScreen());
              },
              child: Text('تسجيل الدخول'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      );
      return;
    }

    double selectedRating = 0;
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(
          'تقييم الفندق',
          textAlign: TextAlign.right,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'ما هو تقييمك لهذا الفندق؟',
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < selectedRating.floor()
                        ? Icons.star
                        : Icons.star_border,
                    color: Colors.amber,
                    size: 40,
                  ),
                  onPressed: () {
                    selectedRating = index + 1.0;
                    Get.back();
                    _submitRating(selectedRating);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  void _submitRating(double rating) {
    Get.snackbar(
      'نجاح',
      'تم إرسال تقييمك بنجاح',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      borderRadius: 10,
      margin: EdgeInsets.all(10),
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HotelsDetailsController());
    final textStyles = Get.find<CustomTextStyles>();
    return GetBuilder<HotelsDetailsController>(builder: (controller) => Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: 'hotel_${hotel.hotelId}',
                    child: Image.network(
                      '${AppLinks.rootImage}/hotel/${hotel.hotelImage}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    left: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          hotel.hotelNamear ?? 'اسم الفندق',
                          style: textStyles.titleStyle(
                            color: Colors.white,
                            fontSize: 28,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              hotel.addressCuntry ?? 'الموقع',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                hotel.hotelRating?.toString() ?? '4.5',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber,
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 28,
                              ),
                            ],
                          ),
                          Text(
                            'التقييم العام',
                            style: textStyles.titleStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () => _showRatingDialog(context),
                        icon: Icon(Icons.star),
                        label: Text('قيم تجربتك'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'المميزات الرئيسية',
                    style: textStyles.titleStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  height: 120,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    children: [
                      _buildFeatureCard(
                        Icons.pool,
                        'مسبح',
                        'مفتوح 24/7',
                      ),
                      SizedBox(width: 12),
                      _buildFeatureCard(
                        Icons.restaurant,
                        'مطعم',
                        'مأكولات عالمية',
                      ),
                      SizedBox(width: 12),
                      _buildFeatureCard(
                        Icons.meeting_room,
                        ' طيرمانات',
                        ' ومجالس',
                      ),
                      SizedBox(width: 12),
                      _buildFeatureCard(
                        Icons.local_parking,
                        'موقف سيارات',
                        'مجاني',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'الخدمات المتوفرة',
                    style: textStyles.titleStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                          itemCount: controller.serves.length,
                          itemBuilder:(context, index) => _buildAmenityChip(Icons.wifi,
                              ' ${controller.serves[index]['serves_name_ar']} '), )

                      // _buildAmenityChip(Icons.wifi, 'واي فاي مجاني'),
                      // _buildAmenityChip(Icons.ac_unit, 'تكييف'),
                      // _buildAmenityChip(Icons.room_service, 'خدمة الغرف'),
                      // _buildAmenityChip(
                      //     Icons.local_laundry_service, 'غسيل ملابس'),
                      // _buildAmenityChip(Icons.security, 'أمن 24 ساعة'),
                      // _buildAmenityChip(Icons.elevator, 'مصعد'),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'وصف الفندق',
                        style: textStyles.titleStyle(fontSize: 20),
                      ),
                      SizedBox(height: 12),
                      Text(
                        hotel.hotelDescriptionar ?? 'وصف الفندق يظهر هنا...',
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.6,
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 100), // Space for bottom bar
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Container(
      //   padding: EdgeInsets.all(16),
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.black.withOpacity(0.1),
      //         blurRadius: 10,
      //         offset: Offset(0, -5),
      //       ),
      //     ],
      //   ),
      //   child: Row(
      //     children: [
      //       Expanded(
      //         flex: 2,
      //         child: ElevatedButton(
      //           onPressed: () {
      //             Get.to(() => BookingScreen(hotel: hotel));
      //           },
      //           style: ElevatedButton.styleFrom(
      //             padding: EdgeInsets.symmetric(vertical: 16),
      //             backgroundColor: Colors.blue,
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(10),
      //             ),
      //           ),
      //           child: Text(
      //             'احجز الآن',
      //             style: TextStyle(
      //               fontSize: 18,
      //               fontWeight: FontWeight.bold,
      //               color: Colors.white,
      //             ),
      //           ),
      //         ),
      //       ),
      //       SizedBox(width: 16),
      //       Expanded(
      //         flex: 1,
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           crossAxisAlignment: CrossAxisAlignment.end,
      //           children: [
      //             Text(
      //               'سعر الليلة',
      //               style: TextStyle(
      //                 color: Colors.grey[600],
      //                 fontSize: 14,
      //               ),
      //             ),
      //             Text(
      //               '${hotel['price'] ?? '100'}\$',
      //               style: TextStyle(
      //                 fontSize: 20,
      //                 fontWeight: FontWeight.bold,
      //                 color: Colors.blue,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    ),);
  }
}
