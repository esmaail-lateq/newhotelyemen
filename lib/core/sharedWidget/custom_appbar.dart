import 'package:flutter/material.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';

PreferredSize customAppBar(String title, {double height = 50}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(height), // ارتفاع الـ AppBar
    child: AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryColor, AppColors.primaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      elevation: 0, // إزالة الظل
      backgroundColor: Colors.transparent, // ضروري ليعمل التدرج
    ),
  );
}
