import 'package:flutter/material.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';

class CustomFloatingButtom extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final Color color;
  const CustomFloatingButtom({super.key, this.onTap, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap:onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: EdgeInsets.only(right: 20),
            alignment: Alignment.center,
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
                color:color,
                borderRadius: BorderRadius.circular(12)),
            child: Text(
             text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
  }
}