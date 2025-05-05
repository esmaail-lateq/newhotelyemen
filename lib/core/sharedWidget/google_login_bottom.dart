import 'package:flutter/material.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';

Widget googleLoginBottom(void Function()? onTap) {
  return InkWell(
    onTap:onTap ,
    child: Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 25),
      // height: 15,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(width: 0.4, color: Colors.grey),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.g_mobiledata_outlined,
            size: 30,
          ),
          Text(
            'التسجيل باستخدام جوجل',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor),
          ),
        ],
      ),
    ),
  );
}
