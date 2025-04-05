import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';

ThemeData themArabic = ThemeData(
  primarySwatch: Colors.blue,
  primaryColor: AppColors.background,
  hintColor: Colors.amber[600],
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    elevation: 0,
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
        color: AppColors.text1, fontSize: 28, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
    labelLarge: TextStyle(color: Colors.white),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: AppColors.primaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
);
