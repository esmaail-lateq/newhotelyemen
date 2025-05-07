import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:newhotelyemeni/core/consttint/theam_app.dart';
import 'package:newhotelyemeni/core/locallzition/tranzlation.dart';
import 'package:newhotelyemeni/core/locallzition/tranzlation_controller.dart';
import 'package:newhotelyemeni/core/servesies/binding/binding.dart';
import 'package:newhotelyemeni/core/servesies/myserves.dart';

import 'package:newhotelyemeni/rout.dart';

import 'package:newhotelyemeni/features/auth/login/login.dart';

import 'package:newhotelyemeni/core/widget/fontandtext.dart';

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
      fallbackLocale: const Locale('ar'),

      debugShowCheckedModeBanner: false,
      title: 'YemenHotel',
      theme: themArabic,

      initialBinding: Binding(),

      // home: Login(),
      // home: Language(),
      getPages: getPages,
    );
  }
}
