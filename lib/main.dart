import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/locallzition/tranzlation.dart';
import 'package:newhotelyemeni/core/locallzition/tranzlation_controller.dart';
import 'package:newhotelyemeni/core/servesies/binding/binding.dart';
import 'package:newhotelyemeni/core/servesies/myserves.dart';
import 'package:newhotelyemeni/rout.dart';
import 'package:newhotelyemeni/view/screen/aboutscreen.dart';
import 'package:newhotelyemeni/view/screen/auth/login.dart';
import 'package:newhotelyemeni/view/screen/homescreen/homescreen.dart';
import 'package:newhotelyemeni/view/screen/hotel_details_screen.dart';
import 'package:newhotelyemeni/view/screen/hotelsdetails.dart';
import 'package:newhotelyemeni/view/screen/setings/language.dart';
import 'package:newhotelyemeni/view/screen/setings/settingscreen.dart';
import 'package:newhotelyemeni/view/screen/showscreen.dart';
import 'package:newhotelyemeni/view/widget/fontandtext.dart';

import 'controller/homescreen_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServers();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    Get.put(CustomTextStyles());
    return GetMaterialApp(
      translations: MyTranzlation(),
      locale: controller.langage,
      debugShowCheckedModeBanner: false,
      title: 'YemenHotel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: AppColors.background,
        hintColor: Colors.amber[600],
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          elevation: 0,
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(
              color: AppColors.text1,
              fontSize: 28,
              fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
          labelLarge: TextStyle(color: Colors.white),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: AppColors.primaryColor,
          textTheme: ButtonTextTheme.primary,
        ),
      ),

      initialBinding: Binding(),

      home: Login(),
      // home: Language(),
      getPages: getPages,
    );}}
