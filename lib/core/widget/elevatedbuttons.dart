import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label; // النص الظاهر على الزر
  final IconData icon; // الأيقونة في الزر
  final Color backgroundColor; // لون الخلفية
  final Color textColor; // لون النص
  final VoidCallback onPressed; // الحدث عند الضغط

  const CustomElevatedButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: textColor),
      label: Text(
        label,
        style: TextStyle(color: textColor, fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // حواف مستديرة
        ),
      ),
    );
  }
}
