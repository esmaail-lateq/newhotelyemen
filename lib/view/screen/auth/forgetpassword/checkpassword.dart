import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/controller/auth/forgetpassword/checkpassword_controller.dart';
import 'package:newhotelyemeni/core/function/validator.dart';

class CheckPassword extends StatelessWidget {
  const CheckPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckPasswordController());
    return GetBuilder<CheckPasswordController>(builder: (controller) => Scaffold(
        body: Container(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              padding: EdgeInsets.only(top: 80),
              children: [
                Text('Forgot Password' , style: TextStyle(fontSize: 24 , color: Colors.white, fontWeight: FontWeight.bold),),
                SizedBox(height: 4,),
                Text('Enter Your Email to reset password' , style: TextStyle(fontSize: 14 , color: Colors.white, fontWeight: FontWeight.bold),),
                SizedBox(height: 15,),

                Form(
                  key: controller.formstate,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextFormField(
                        controller: controller.email,
                        style: TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            labelText: 'Email' ,labelStyle: TextStyle(color: Colors.white)),
                        validator: (value) {
                          return validInput(value!, 3, 50, "email");
                        },

                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: (){
                          controller.gotoVerifyemail();
                        },
                        child: const Text('Submit' , style: TextStyle(color: Colors.indigo),),
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
        )),);
  }
}
