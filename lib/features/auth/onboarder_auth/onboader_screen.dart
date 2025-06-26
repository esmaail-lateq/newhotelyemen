import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newhotelyemeni/features/auth/onboarder_auth/onboarder_content.dart';

import '../../../core/consttint/app_icons_lottet.dart';
class OnboaderScreen extends StatefulWidget {
  const OnboaderScreen({super.key});

  @override
  State<OnboaderScreen> createState() => _OnboaderScreenState();
}

class _OnboaderScreenState extends State<OnboaderScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, (){
      return showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(44),
              topLeft: Radius.circular(44)
            )
          ),
          builder: (_)=>OnboarderContent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Image.asset(AppIconsLotit.Imlogo ,
        fit: BoxFit.cover,
        width: double.infinity,),
    );
  }
}
