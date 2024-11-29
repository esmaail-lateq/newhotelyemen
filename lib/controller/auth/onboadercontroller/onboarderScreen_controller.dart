import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboarderScreenController extends GetxController{

late PageController pageController ;
double process = 0.0;

changePage(){
  if(pageController.page == 0){
    process++;
     pageController.animateToPage(1, duration: Duration(milliseconds: 400), curve: Curves.ease);
  }
}

curentPage(int index){
  process = index.toDouble();
  update();
}

@override
  void onInit() {

    pageController = PageController()..addListener(update);

    super.onInit();
  }
}