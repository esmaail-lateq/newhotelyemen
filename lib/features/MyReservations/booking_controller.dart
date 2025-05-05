import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BookingController extends GetxController {
  final selectedStartDate = Rx<DateTime?>(null);
  final selectedEndDate = Rx<DateTime?>(null);
  final numberOfGuests = 1.obs;
  final numberOfRooms = 1.obs;

  // حساب عدد الليالي
  int get numberOfNights {
    if (selectedStartDate.value == null || selectedEndDate.value == null) {
      return 0;
    }
    return selectedEndDate.value!.difference(selectedStartDate.value!).inDays;
  }

  // حساب السعر الإجمالي
  double calculateTotalPrice(double pricePerNight) {
    return pricePerNight * numberOfNights * numberOfRooms.value;
  }

  // التحقق من صحة التواريخ
  bool get isValidDateRange {
    if (selectedStartDate.value == null || selectedEndDate.value == null) {
      return false;
    }
    return selectedEndDate.value!.isAfter(selectedStartDate.value!);
  }

  // تحديد تاريخ البداية
  Future<void> selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null) {
      selectedStartDate.value = picked;
      // إذا كان تاريخ النهاية قبل تاريخ البداية، نقوم بتحديثه
      if (selectedEndDate.value != null &&
          selectedEndDate.value!.isBefore(picked)) {
        selectedEndDate.value = picked.add(Duration(days: 1));
      }
    }
  }

  // تحديد تاريخ النهاية
  Future<void> selectEndDate(BuildContext context) async {
    if (selectedStartDate.value == null) {
      Get.snackbar(
        'تنبيه',
        'الرجاء اختيار تاريخ الوصول أولاً',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedStartDate.value!.add(Duration(days: 1)),
      firstDate: selectedStartDate.value!.add(Duration(days: 1)),
      lastDate: selectedStartDate.value!.add(Duration(days: 30)),
    );
    if (picked != null) {
      selectedEndDate.value = picked;
    }
  }

  // زيادة عدد الضيوف
  void incrementGuests() {
    if (numberOfGuests.value < 10) {
      numberOfGuests.value++;
    }
  }

  // تقليل عدد الضيوف
  void decrementGuests() {
    if (numberOfGuests.value > 1) {
      numberOfGuests.value--;
    }
  }

  // زيادة عدد الغرف
  void incrementRooms() {
    if (numberOfRooms.value < 5) {
      numberOfRooms.value++;
    }
  }

  // تقليل عدد الغرف
  void decrementRooms() {
    if (numberOfRooms.value > 1) {
      numberOfRooms.value--;
    }
  }

  // إعادة تعيين البيانات
  void resetBookingData() {
    selectedStartDate.value = null;
    selectedEndDate.value = null;
    numberOfGuests.value = 1;
    numberOfRooms.value = 1;
  }

  // إتمام عملية الحجز
  Future<bool> confirmBooking(Map<String, dynamic> bookingData) async {
    try {
      // هنا سيتم إضافة كود الاتصال بالخادم لحفظ بيانات الحجز
      await Future.delayed(Duration(seconds: 2)); // محاكاة الاتصال بالخادم
      return true;
    } catch (e) {
      return false;
    }
  }
}
