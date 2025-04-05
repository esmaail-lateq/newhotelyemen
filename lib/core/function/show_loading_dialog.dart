import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newhotelyemeni/core/class/statusRquest.dart';
import 'package:newhotelyemeni/core/sharedWidget/loaging_dialog.dart';

showLoadingDialog(statusRquest ) {
    if (statusRquest == StatusRquest.loading) {
      Get.dialog(const LoagingDialog());
    }
  }