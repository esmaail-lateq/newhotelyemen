import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: 'Aleart',
      middleText: 'Are tou shor you want exit the app',
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: Text('confirm')),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text('cancel'))
      ]);
  return Future.value(true);
}
