import 'package:get/get.dart';

abstract class WellcomeController extends GetxController{
gotohome();
}

class WellcomeControllerImp extends WellcomeController{
  @override
  gotohome() {
Future.delayed(Duration(seconds: 5) , (){
  Get.offNamed("/onboarder");
});
  }

  @override
  void onInit() {
   gotohome();
    super.onInit();
  }

}