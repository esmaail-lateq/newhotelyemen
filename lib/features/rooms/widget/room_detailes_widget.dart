import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/consttint/text_tthems.dart';
import 'package:newhotelyemeni/features/MyReservations/view/screen/bookings_details.dart';

Widget buildHeaderSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'جناح تنفيذي',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 8),
      Text(
        '2 بالغين، 0 أطفال',
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[600],
        ),
      ),
    ],
  );
}

Widget buildRoomDetilse() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'وصف الغرفة',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 16,
      ),
      Text(
          'السلام عليكم ورحمه الله وبركاته كيف الحال هذه اليوم بتكون الغرفه الحاصه بك في الفندق حقنا افضال غرفه في العالم بدون اي منازع '),
    ],
  );
}

Widget buildFacilitiesSection() {
  final facilities = [
    {'icon': Icons.bathtub, 'text': 'الحمام'},
    {'icon': Icons.privacy_tip, 'text': 'حمام خاص'},
    {'icon': Icons.hot_tub, 'text': 'حوض الاستحمام'},
    {'icon': Icons.dry_cleaning, 'text': 'مجفف الشعر'},
    {'icon': Icons.free_breakfast, 'text': 'مستلزمات الحمام مجاناً'},
    {'icon': Icons.beach_access, 'text': 'مناشف'},
    {'icon': Icons.pan_tool_sharp, 'text': 'رداء الحمام'},
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'المرافق',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 12),
      ...facilities
          .map((item) => Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Icon(item['icon'] as IconData?,
                        size: 24, color: Colors.blue),
                    SizedBox(width: 12),
                    Text(item['text'].toString(),
                        style: TextStyle(fontSize: 16)),
                  ],
                ),
              ))
          .toList(),
    ],
  );
}

Widget buildClothingSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'الملابس والفساتين',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 12),
      _buildListTile(Icons.h_mobiledata, 'خزانة ملابس'),
      _buildListTile(Icons.iron, 'مكواة و طاولة الكي'),
    ],
  );
}

Widget _buildListTile(IconData icon, String text) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8),
    child: Row(
      children: [
        Icon(icon, size: 24, color: Colors.blue),
        SizedBox(width: 12),
        Text(text, style: TextStyle(fontSize: 16)),
      ],
    ),
  );
}

Widget buildPriceSection() {
  return Row(
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
            'USD 511',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget buildShowOptionsButton() {
  return InkWell(
    onTap: () {
      Get.to(() => BookingDetailsPage(
              actionBotton: Center(
            child: InkWell(
              onTap: () {
                Get.to(Scaffold(
                  appBar: AppBar(
                    title: Text('طريقة الدفع'),
                  ),
                ));
              },
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.center,
                  // width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      color: AppColors.text4,
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    'تاكيد الحجز',
                    style: TextThemsCustom.font12WhithColor,
                  )),
            ),
          )));
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
      decoration: BoxDecoration(
          color: AppColors.text4, borderRadius: BorderRadius.circular(20)),
      child: Text(
        'احجز الان',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
  );
}

Widget buildImageSlider() {
  return Stack(
    children: [
      SizedBox(
        height: 250,
        child: PageView.builder(
          itemCount: 5, // Replace with actual image count
          itemBuilder: (context, index) => Image.network(
            'https://picsum.photos/400/250?random=$index',
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(top: 15, left: 10, child: buildNumberOfImage()),
    ],
  );
}

Widget buildNumberOfImage() {
  return IntrinsicWidth(
    child: Container(
      alignment: Alignment.center,
      // width: 80,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 40, 39, 39),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '20',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.camera_alt_outlined,
            color: Colors.white,
          ),
        ],
      ),
    ),
  );
}
