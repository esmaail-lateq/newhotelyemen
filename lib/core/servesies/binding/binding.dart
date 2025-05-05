import 'package:get/get.dart';
import 'package:newhotelyemeni/features/auth/test-controller/onboadercontroller/onboarderScreen_controller.dart';
import 'package:newhotelyemeni/core/class/curd.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.put(CURD());
    // Get.lazyPut(()=> OnboarderScreenController());

  }
}