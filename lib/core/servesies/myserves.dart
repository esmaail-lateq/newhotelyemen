import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myserves extends GetxService{
  late SharedPreferences sharedPreferences;

  Future<Myserves> init()async{
    sharedPreferences= await SharedPreferences.getInstance();
    return this;

  }

}
initialServers ()async{
await Get.putAsync(()=> Myserves().init());

}
