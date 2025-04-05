import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newhotelyemeni/core/consttint/images.dart';

class LoagingDialog extends StatelessWidget {
  const LoagingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Lottie.asset(AppImages.Loading, height: 250, width: 250),
      ),
    );
  }
}
