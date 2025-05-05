import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/consttint/text_tthems.dart';

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
      Positioned(bottom: 15, right: 20, child: buildNameAndRating())
    ],
  );
}

Widget buildNameAndRating() {
  return Column(
    children: [
      Text(
        ' فايف استارز',
        style: TextThemsCustom.font22WhiteBolde,
      ),
      Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              color: AppColors.red.withOpacity(0.8),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              'فندق ',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.orange, size: 16),
              Icon(Icons.star, color: Colors.orange, size: 16),
              Icon(Icons.star, color: Colors.orange, size: 16),
              Icon(Icons.star, color: Colors.orange, size: 16),
              Icon(Icons.star, color: Colors.orange, size: 16),
            ],
          )
        ],
      )
    ],
  );
}

Widget buildHotelInfo() {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.star, color: Colors.amber, size: 20),
            SizedBox(width: 4),
            Text('9.6', style: TextStyle(color: Colors.grey)),
            SizedBox(width: 8),
            Text('التقييم ممتاز',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.green)),
            SizedBox(width: 8),
            Text('(462 تقييم)', style: TextStyle(color: Colors.grey)),
          ],
        ),
        // SizedBox(height: 12),
      ],
    ),
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
