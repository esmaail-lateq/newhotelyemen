import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:newhotelyemeni/features/auth/signup/controller/signup_controller.dart';

class OnboarderScreenController extends GetxController{

late PageController pageController ;
double process = 0.0;

SignUpControllerImp controllerSign = Get.put(SignUpControllerImp());

backPage(){
  if(pageController.page == 1){
    process--;
    pageController.animateToPage(0, duration: Duration(milliseconds: 400), curve: Curves.ease);
  }
}
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