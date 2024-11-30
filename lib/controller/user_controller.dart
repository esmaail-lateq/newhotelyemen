import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserController extends GetxController {
  // بيانات المستخدم (ستتم إضافة المزيد من البيانات عند ربط قاعدة البيانات)
  final Rx<Map<String, dynamic>> userData = Rx<Map<String, dynamic>>({
    'name': 'محمد أحمد',
    'email': 'mohammed@example.com',
    'phone': '+967 777 123 456',
    'location': 'صنعاء، اليمن',
    'profileImage': 'assets/images/profile.png',
    'totalBookings': 12,
    'favoriteHotels': 5,
    'memberSince': '2023',
  });

  final ImagePicker _picker = ImagePicker();
  final Rx<File?> selectedImage = Rx<File?>(null);

  // دالة لتحديث بيانات المستخدم
  void updateUserData(Map<String, dynamic> newData) {
    userData.update((val) {
      val?.addAll(newData);
    });
  }

  Future<void> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        selectedImage.value = File(image.path);
        // في التطبيق الحقيقي، سنقوم برفع الصورة إلى الخادم هنا
        // ثم تحديث مسار الصورة في userData
      }
    } catch (e) {
      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء اختيار الصورة',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  bool validateEmail(String email) {
    return GetUtils.isEmail(email);
  }

  bool validatePhone(String phone) {
    // تحقق بسيط من رقم الهاتف اليمني
    return phone.startsWith('+967') && phone.length >= 12;
  }

  Future<bool> saveProfile(Map<String, dynamic> newData) async {
    try {
      // هنا سيتم إضافة كود الاتصال بالخادم لحفظ البيانات
      updateUserData(newData);
      Get.snackbar(
        'نجاح',
        'تم تحديث البيانات بنجاح',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      return true;
    } catch (e) {
      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء حفظ البيانات',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
  }
}
