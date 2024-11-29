import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/controller/auth/onboadercontroller/onboarderScreen_controller.dart';
import 'package:newhotelyemeni/view/screen/auth/login.dart';
import 'package:newhotelyemeni/view/screen/auth/signup.dart';

class OnboarderContent extends StatelessWidget {
  const OnboarderContent({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboarderScreenController());
    return GetBuilder<OnboarderScreenController>(builder: (controller) =>
        Container(
      height: 400 + controller.process * 200,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Expanded(
                child: PageView(
                  onPageChanged: (index){
                    controller.curentPage(index);
                  },
                  controller: controller.pageController,
                  children: [
                    Login(),
                    SignUp()
                  ],
                ),
              )
            ],
          ),
          Positioned(
            height: 56   ,
            bottom: 40  ,
            right: 16,
            child: GestureDetector(
              onTap: () {
                controller.changePage();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        stops: [
                          0.4,
                          0.8
                        ],
                        colors: [
                          Color.fromARGB(255, 43, 100, 166),
                          Color.fromARGB(255, 139, 33, 146),
                        ])),
                child: DefaultTextStyle(
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 70 + controller.process *32 ,
                        child: Stack(
                          fit: StackFit.passthrough,
                          children: [
                            FadeTransition(
                              opacity: AlwaysStoppedAnimation(1 - controller.process),
                              child: Text("SignUp"),
                            ),
                            FadeTransition(
                              opacity: AlwaysStoppedAnimation(controller.process),
                              child: Text(
                                "Create Count",
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              ),
                            )
                          ],
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 24,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),);
  }
}
