import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';

class CustomButtom extends StatelessWidget {
  final void Function()? onPressed;

  final String titel;

  const CustomButtom({super.key, this.onPressed, required this.titel});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed,
    child: Text(titel,style:TextStyle(color:AppColors.text1,fontWeight: FontWeight.bold,fontSize: 16) ,),
    );
    // ElevatedButton(
    //   clipBehavior: Clip.none,
    //     style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[900]),
    //     onPressed: onPressed,
    //     child: SizedBox(
    //       width: 20,
    //       height: 20,
    //       child: isLoading
    //           ? LoadingAnimationWidget.staggeredDotsWave(
    //               color: Colors.cyanAccent,
    //               size: 30,
    //             )
    //           : Text('تسجيل الدخول',
    //               style: TextStyle(color: Colors.cyanAccent)),
    //     ));
  }
}
