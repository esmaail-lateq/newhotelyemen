import 'package:flutter/material.dart';
import 'package:get/get.dart';


abstract class verifyemailControllerAuth extends GetxController{
  check();
  gotosuccesssingup(String verifycodeSignup);

}
class verifyemailControllerAuthImp extends verifyemailControllerAuth{
   String? verifycode ;

  String? email;

  @override
  gotosuccesssingup(String verifycodeSignup) {
    if(verifycodeSignup == "77777"){
      Get.offAllNamed("/successEmail");
    }
    else{
      Get.dialog(AlertDialog(
        icon:Icon(Icons.error_outline,color: Colors.red,size: 75,),
        content: Text("This verifycode is false again tray write verifycode"),
        actions: [
          MaterialButton(onPressed: (){
            Get.back();
          },child: Icon(Icons.close),color: Colors.redAccent,)
        ],

      ));
      // Get.defaultDialog(title: "Error" , middleText: "This verifycode is false again tray write verifycode",);
    }
  }

  // @override
  // gotosuccesssingup(verifycodeSignup) async{
  //   stutesRequest = StutesRequest.loading;
  //   update();
  //   var response = await verify.postData(email!,verifycodeSignup);
  //   stutesRequest=handling(response);
  //   if(stutesRequest==StutesRequest.success){
  //     if(response['stutes']=="success"){
  //       Get.offNamed("/success_singup");
  //     }
  //     else{
  //       Get.defaultDialog(title: "Error" , middleText: "This verifycode is false again tray write verifycode") ;
  //       stutesRequest=StutesRequest.failure;
  //     }
  //     update();
  //   }
  //   else{}
  //
  //
  // }

  @override
  check() {

  }
  @override
  void onInit() {
    email=Get.arguments['phone'];

    super.onInit();
  }
  @override
  void dispose() {
    super.dispose();
  }



}