import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newhotelyemeni/core/consttint/app_image.dart';

class HomeCarde extends StatelessWidget {
  const HomeCarde({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      // color: Colors.black,
      height: 180.h,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Stack(
              children: [
                Image.asset(
                  AppImage.homecard,
                  width: double.infinity,
                  // height: 160.h,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          );
        },
        itemCount: 10,
        viewportFraction: 0.8,
        scale: 0.9,
      ),
    );
  }
}

Widget textWithBlackEffict(String text, double width) {
  return Container(
    height: 50,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(height: 25, width: width, color: Colors.black),
        ),
        Positioned(
          top: 0,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 30.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
