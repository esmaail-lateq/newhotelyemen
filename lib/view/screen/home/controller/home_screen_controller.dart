import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newhotelyemeni/core/servesies/myserves.dart';
import 'package:newhotelyemeni/view/screen/MyReservations/view/my_reservation_screen.dart';
import 'package:newhotelyemeni/view/screen/bookings_screen.dart';
import 'package:newhotelyemeni/view/screen/favorite/view/favorites_screen.dart';
import 'package:newhotelyemeni/view/screen/home/view/home_page.dart';
import 'package:newhotelyemeni/view/screen/setting/settingscreen.dart';

class HomeScreenController extends GetxController {
  int currentPage = 0;

  bool? check;
  MyServices myServices = Get.find();

  List<Widget> listPage = [
    HomePage(),
    FavoritesScreen(),
    MyReservationScreen(),
    Settingscreen(),
  ];
  List<Map> list_title_appbar = [
    {"title": "Home", "icon": Icons.home},
    {"title": "facorit", "icon": Icons.favorite},
    {"title": "booking", "icon": Icons.book_online},
    {"title": "settings", "icon": Icons.settings},
  ];

  @override
  chnagePage(int currentpage) {
    currentPage = currentpage;
    if (currentPage != 0) {
      // Get.delete<HomeAnimationController>();
    }
    update();
  }

  @override
  int whatCuurentpage() {
    update();
    return currentPage;
  }

  @override
  void onClose() {
    update();
    // theThem();
    super.onClose();
  }

  // Future<void> showNotification(RemoteMessage message) async {
  //   var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
  //     'channel_id',
  //     'channel_name',
  //     channelDescription: 'channel_description',
  //     importance: Importance.max,
  //     priority: Priority.high,
  //     showWhen: false,
  //   );

  //   var platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //     0, // معرف الإشعار
  //     message.notification?.title, // عنوان الإشعار
  //     message.notification?.body, // محتوى الإشعار
  //     platformChannelSpecifics,
  //     payload: 'item x',
  //   );
  // }

  @override
  void onInit() {
    // var step = myServices.sharedPreferences.getString('step');
    // if (step == null) {
    //   myServices.sharedPreferences.setString('step', '1');
    // }
    // if (step == '2') {
    //   FirebaseMessaging.instance.subscribeToTopic('all_users');
    //   _firebaseMessaging.requestPermission();
    //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //     // معالجة الرسالة
    //     if (kDebugMode) {
    //       print(
    //           'Received=============================== message: ${message.notification?.title}');
    //     }
    //     showNotification(message);
    //     notifactionController.fetchData();
    //     // getData();
    //     // getNotivactionCount();
    //   });
    //   flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    //   var initializationSettingsAndroid =
    //       const AndroidInitializationSettings('@mipmap/ic_launcher');
    //   var initializationSettings =
    //       InitializationSettings(android: initializationSettingsAndroid);
    //   flutterLocalNotificationsPlugin.initialize(initializationSettings);
    // }

    super.onInit();
  }
}
