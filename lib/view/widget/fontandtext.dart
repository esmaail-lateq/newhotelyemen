import 'package:flutter/material.dart';

class CustomTextStyles {
  final String = 'fontFamily';
  final double defaultFontSize;
  final Color defaultColor;

  // Constructor for customizability
  CustomTextStyles({
    this.defaultFontSize = 14.0,
    this.defaultColor = Colors.black,
  });

  // A style for titles
  TextStyle titleStyle({double? fontSize, Color? color, FontWeight? fontWeight}) {
    return TextStyle(

      fontSize: fontSize ?? defaultFontSize + 4.0,
      color: color ?? defaultColor,
      fontWeight: fontWeight ?? FontWeight.bold,
    );
  }

  // A style for subtitles
  TextStyle subtitleStyle({double? fontSize, Color? color, FontWeight? fontWeight}) {
    return TextStyle(

      fontSize: fontSize ?? defaultFontSize + 2.0,
      color: color ?? defaultColor.withOpacity(0.8),
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }

  // A style for body text
  TextStyle bodyStyle({double? fontSize, Color? color, FontWeight? fontWeight}) {
    return TextStyle(

      fontSize: fontSize ?? defaultFontSize,
      color: color ?? defaultColor,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
  }

// Add more styles as needed...
}
