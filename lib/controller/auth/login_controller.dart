import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/controller/auth/onboadercontroller/onboarderScreen_controller.dart';
import 'package:newhotelyemeni/core/class/statusRquest.dart';
import 'package:newhotelyemeni/core/function/handling.dart';
import 'package:newhotelyemeni/core/servesies/myserves.dart';
import 'package:newhotelyemeni/data/model/users_model.dart';
import 'package:newhotelyemeni/data/sours/remout/auth/login_data.dart';

abstract class LoginController extends GetxController{
 showPassword();
 login();
 forgetpassword();
}

class LoginControllerImp extends LoginController{

 late TextEditingController email;
 late TextEditingController password;
GlobalKey<FormState>formstate=GlobalKey();
LoginData data = LoginData(Get.find());
Myserves myserves = Get.find();
StatusRquest statusRquest= StatusRquest.nune;
List<UserModels> datausers=[];


bool ispassword = true;
  @override
  showPassword() {
    ispassword= ispassword==true?false:true;
    update();
  }


 @override
 forgetpassword() {
    Get.toNamed("/checkPassword");
 }

 @override
 login()async{
   if(formstate.currentState!.validate()){
     statusRquest = StatusRquest.loading;
     update();
     var response = await data.postData(email.text,password.text);
     statusRquest = handling(response);
     if(statusRquest == StatusRquest.success){
       if(response['status'] == "success"){
         List databoye = response['data'];
         datausers.addAll(databoye.map((e) => UserModels.fromJson(e),));
         myserves.sharedPreferences.setString("userId", datausers[0].usersId!);
         myserves.sharedPreferences.setString("userName", datausers[0].usersName!);
         myserves.sharedPreferences.setString("userPhone", datausers[0].usersPhone!);
         myserves.sharedPreferences.setString("userEmail", datausers[0].usersEmail!);
         myserves.sharedPreferences.setString("userPassword", datausers[0].usersPassword!);
         myserves.sharedPreferences.setString("step", "1");
         Get.offAllNamed("/HomeScreen");
       }
       else if(response['status'] == "must verifycode your email"){
         Get.dialog(AlertDialog(
           title:Text("Error"),
           content: Text("must chick for your verifycode"),
           actions: [
             InkWell(
               onTap: (){
               },
               child: Text("Verify"),
             )
           ],
         ));
       }
       else{
         print("============================must verifycode your email");
         Get.dialog(AlertDialog(
           title:Text("Error"),
           content: Text("Not Find This Phone Or password"),
         ));
       }
     }
     else{
       Get.dialog(AlertDialog(
         title:Text("Error"),
         content: Text("Content Wi_Fi"),

       ));
       statusRquest = StatusRquest.failure;
     }


   }
 }



 @override
  void onInit() {
email=TextEditingController();
password=TextEditingController();
    super.onInit();
  }

@override
  void dispose() {
email.dispose();
password.dispose();
    super.dispose();
  }




}