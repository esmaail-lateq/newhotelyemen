import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/features/auth/test-controller/forgetpassword/checkpassword_controller.dart';
import 'package:newhotelyemeni/core/function/validator.dart';
import 'package:newhotelyemeni/core/widget/customtextform.dart';

import '../../../core/consttint/colors.dart';
import '../clipe.dart';
import '../../../core/widget/auth/custometextform.dart';
import '../../../core/widget/auth/customtext.dart';


class CheckPassword extends StatelessWidget {
  const CheckPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CheckPasswordController());
    return GetBuilder<CheckPasswordController>(builder: (controller) => Scaffold(
        body: Container(
            padding: const EdgeInsets.all(1.0),
            child: Form(
              key: controller.formstate,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      child: Stack(
                        children: [
                          ClipPath(
                            clipper: Clipe(),
                            child: Container(
                              height: 280,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 7,
                                    offset: Offset(1,5),
                                    blurRadius: 9,
                                    color: Colors.grey.withOpacity(0.4)
                                  )
                                ],
                                gradient: LinearGradient(colors:[
                                  AppColors.primaryColor,
                                  AppColors.text2
                                ],
                                  begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                ),
                                color:  AppColors.primaryColor,
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 20,
                              left: 50,
                              child:Customtext(
                                text: '15'.tr,
                              ) ),
                          Positioned(
                              bottom: 0,
                              left: 50,
                              child: Container(
                                height: 4,
                                width: 150,
                                color: AppColors.primaryColor,
                              ))
                        ],
                      ),),
                    SizedBox(height: 30,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child:Column(
                        children: [
                          CustomTextForm(

                            label: '11'.tr,
                            mycontroller: controller.email,
                            icon: Icons.phone,
                            keyboardType:TextInputType.numberWithOptions(decimal: true),
                            validator: (value) {
                              return validInput(
                                  value!, 1, 9, 'phone');
                            },
                            onChanged: (val){
                              controller.ChecktextPhone(val);

                            },

                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                     if(controller.chack == false)
                     Container(
                         color: AppColors.primaryColor,
                         child: MaterialButton(
                           onPressed: (){
                             controller.gotoVerifyemail();
                           },
                            child: Text('Check' , style: TextStyle(
                             fontSize: 16,
                             color: Colors.white
                         ),),

                       ),
                     ),

                  ],
                ),
              ),
            ),
        )),);
  }
}











//
// return GetBuilder<CheckPasswordController>(builder: (controller) => Scaffold(
// body: Container(
// padding: const EdgeInsets.all(1.0),
// child: SingleChildScrollView(
// child: Container(
//
// width: double.infinity,
// decoration: BoxDecoration(
// gradient: LinearGradient(
// begin: Alignment.topCenter,
// colors: [
// Colors.blue.shade600,
// Colors.blue.shade400,
// Colors.blue.shade200
// ])),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// SizedBox(
// height: 80,
// ),
// Padding(
// padding: EdgeInsets.all(20),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// FadeInUp(
// duration: Duration(milliseconds: 1000),
// child: Text(
// "ForgetPassword",
// style: TextStyle(
// color:Colors.white, fontSize: 40),
// )),
// SizedBox(
// height: 10,
// ),
// FadeInUp(
// duration: Duration(milliseconds: 1300),
// child: Text(
// "Check Your Phone".tr,
// style: TextStyle(
// color: Colors.white, fontSize: 18),
// )),
// ],
// ),
// ),
// SizedBox(height: 20),
// Container(
// height: 2000,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(60),
// topRight: Radius.circular(60))),
// child: Padding(
// padding: EdgeInsets.all(30),
// child: Form(
// key: controller.formstate,
// child: Column(
// children: <Widget>[
// FadeInUp(
// duration:
// Duration(milliseconds: 1300),
// child: Text(
// "Enter your Phone to check this Phone for you  ",
// style: TextStyle(
// color: Color(0xFF333333),
// ),
// )),
// SizedBox(
// height: 30,
// ),
// FadeInUp(
// duration:
// Duration(milliseconds: 1400),
// child: Container(
// decoration: BoxDecoration(
// color: Color(0xFF333333),
// borderRadius: BorderRadius.circular(
// 10),
//
// ),
// child: Column(
// children: <Widget>[
// CustomTextForm(
// icon: Icons.email,
// mycontroller: controller.email,
// keyboardType: TextInputType.phone,
// label: 'Phone Number',
// validator: (val) {
// return validInput(val!, 9, 9, "phone");
// },
// // لون الإطار
// ),
// ],
// ),
// )),
// SizedBox(
// height: 20,
// ),
// FadeInUp(
// duration:
// Duration(milliseconds: 1600),
// child: CustomButtom(
// titel: 'Chick',
// onPressed: () async{
// await controller.gotoVerifyemail();
// },)),
// SizedBox(
// height: 20,
// ),
// FadeInUp(
// duration:
// Duration(milliseconds: 1500),
// child: Row(
// mainAxisAlignment:
// MainAxisAlignment.center,
// children: [
// InkWell(
// onTap: () {
// Get.toNamed("/login");
// },
// child: Text(
// "Login".tr,
// style: TextStyle(
// color:
// Colors.blue,
// fontWeight:
// FontWeight.bold),
// ),
// ),
// Text("I have an account ",style: TextStyle(color: Colors.grey.shade600),)
// ],
// )),
// ],
// ),
// )),
// ),
// ],
// ),
// ),
// )
// )),);