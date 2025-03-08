

import 'package:flutter/material.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';

class Customtextsignup extends StatelessWidget {
  final String textAske;
  final String textOption;

  final void Function()? onTap;

  const Customtextsignup(
      {super.key,
      required this.textAske,
      required this.textOption,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textAske),
        InkWell(
          onTap: onTap,
          child: Text(
            textOption,
            style:  TextStyle(
                color: AppColors.primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
