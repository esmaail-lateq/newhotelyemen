import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/controller/auth/forgetpassword/resetpassword_controller.dart';
import 'package:newhotelyemeni/view/widget/customtextform.dart';

import '../../../../core/function/validator.dart';
class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordController());
    return Scaffold(
      body: GetBuilder<ResetPasswordController>(builder: (controller) => Container(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            padding: EdgeInsets.only(top: 80),
            children: [
              Text('Reset Password' , style: TextStyle(fontSize: 24 , color: Colors.white, fontWeight: FontWeight.bold),),
              SizedBox(height: 4,),
              Text('Create New Password' , style: TextStyle(fontSize: 14 , color: Colors.white, fontWeight: FontWeight.bold),),
              SizedBox(height: 15,),

              Form(
                key: controller.formstate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // TextFormField(
                    //   controller: controller.email,
                    //   style: TextStyle(color: Colors.white),
                    //   decoration: const InputDecoration(
                    //       labelText: 'Email' ,labelStyle: TextStyle(color: Colors.white)),
                    //   validator: (value) {
                    //     return validInput(value!, 3, 50, "email");
                    //   },
                    //
                    // ),
                    CustomTextForm(
                      icon: Icons.lock,
                      mycontroller: controller.password,
                      keyboardType: TextInputType.text,
                      label: 'New Password',
                      validator: (val) {
                        return validInput(val!, 8, 50, "password");
                      },
                      isPassword: controller.ispassword,
                      chingpassword: () {
                        controller.showPassword();
                      },
                      iconpassword: Icons.visibility,
                      iconshowpassword: Icons.visibility_off,
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextForm(
                      mycontroller: controller.conpassword,
                      icon: Icons.lock,
                      keyboardType: TextInputType.text,
                      label: 'confirm New Password',
                      validator: (val) {
                        if(val == null || val.isEmpty){
                          return " يرجى تأكيد كلمة المرور'";
                        }
                        else if(val != controller.password.text ){
                          return 'كلمتا المرور غير متطابقتين';
                        }
                        return null;
                      },
                      isPassword: controller.ispassword2,
                      chingpassword: () {
                        controller.showPassword2();
                      },
                      iconpassword: Icons.visibility,
                      iconshowpassword: Icons.visibility_off,

                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: (){
                        controller.gotosuccess();
                      },
                      child: const Text('reset' , style: TextStyle(color: Colors.indigo),),
                    ),
                    const SizedBox(height: 16.0),
                    Center(
                      child: GestureDetector(
                        onTap: (){
                          Get.offAllNamed("/login");
                        },
                        child: RichText(
                          text: const TextSpan(
                            text: 'Have an account? ',
                            style: TextStyle(color: Colors.white),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Sign In',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
      ),),

    );
  }
}
