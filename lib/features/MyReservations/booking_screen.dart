import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newhotelyemeni/features/MyReservations/booking_controller.dart';

import 'package:newhotelyemeni/core/widget/fontandtext.dart';

class BookingScreen extends StatelessWidget {
  final Map<String, dynamic> hotel;
  final bookingController = Get.put(BookingController());
  // final authController = Get.find<AuthController>();

  BookingScreen({required this.hotel});

  Widget _buildDateSelector(
    BuildContext context,
    String title,
    DateTime? selectedDate,
    Function() onSelect,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          InkWell(
            onTap: onSelect,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.calendar_today, color: Colors.blue),
                  Text(
                    selectedDate != null
                        ? DateFormat('yyyy/MM/dd').format(selectedDate)
                        : 'اختر التاريخ',
                    style: TextStyle(
                      color: selectedDate != null ? Colors.black : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCounter(String title, int value, Function() onDecrement,
      Function() onIncrement, String subtitle) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: onDecrement,
                    icon: Icon(Icons.remove_circle_outline),
                    color: Colors.blue,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      value.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: onIncrement,
                    icon: Icon(Icons.add_circle_outline),
                    color: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPriceSummary(double pricePerNight) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'ملخص السعر',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${pricePerNight.toString()}\$',
                style: TextStyle(color: Colors.grey),
              ),
              Text('سعر الليلة'),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => Text(
                    '${bookingController.numberOfNights}',
                    style: TextStyle(color: Colors.grey),
                  )),
              Text('عدد الليالي'),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => Text(
                    '${bookingController.numberOfRooms}',
                    style: TextStyle(color: Colors.grey),
                  )),
              Text('عدد الغرف'),
            ],
          ),
          Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => Text(
                    '${bookingController.calculateTotalPrice(pricePerNight)}\$',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  )),
              Text(
                'الإجمالي',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _confirmBooking(BuildContext context) {
    // if (!authController.isLoggedIn) {
    //   Get.dialog(
    //     AlertDialog(
    //       title: Text(
    //         'تسجيل الدخول مطلوب',
    //         textAlign: TextAlign.right,
    //       ),
    //       content: Text(
    //         'يجب عليك تسجيل الدخول أولاً لإتمام عملية الحجز',
    //         textAlign: TextAlign.right,
    //       ),
    //       actions: [
    //         TextButton(
    //           onPressed: () => Get.back(),
    //           child: Text('إلغاء'),
    //         ),
    //         ElevatedButton(
    //           onPressed: () {
    //             Get.back();
    //             // التوجيه إلى صفحة تسجيل الدخول
    //             // Get.to(() => LoginScreen());
    //           },
    //           child: Text('تسجيل الدخول'),
    //         ),
    //       ],
    //     ),
    //   );
    //   return;
    // }

    if (!bookingController.isValidDateRange) {
      Get.snackbar(
        'تنبيه',
        'الرجاء اختيار تواريخ الحجز',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    Get.dialog(
      AlertDialog(
        title: Text(
          'تأكيد الحجز',
          textAlign: TextAlign.right,
        ),
        content: Text(
          'هل أنت متأكد من إتمام عملية الحجز؟',
          textAlign: TextAlign.right,
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () async {
              Get.back();
              final result = await bookingController.confirmBooking({
                'hotelId': hotel['id'],
                'startDate': bookingController.selectedStartDate.value,
                'endDate': bookingController.selectedEndDate.value,
                'guests': bookingController.numberOfGuests.value,
                'rooms': bookingController.numberOfRooms.value,
              });

              if (result) {
                Get.snackbar(
                  'نجاح',
                  'تم الحجز بنجاح',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
                bookingController.resetBookingData();
                Get.back();
              } else {
                Get.snackbar(
                  'خطأ',
                  'حدث خطأ أثناء الحجز',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              }
            },
            child: Text('تأكيد'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textStyles = Get.find<CustomTextStyles>();
    final pricePerNight = double.tryParse(hotel['price'] ?? '100') ?? 100.0;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'حجز الفندق',
          style: textStyles.titleStyle(),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Obx(() => _buildDateSelector(
                    context,
                    'تاريخ الوصول',
                    bookingController.selectedStartDate.value,
                    () => bookingController.selectStartDate(context),
                  )),
              SizedBox(height: 16),
              Obx(() => _buildDateSelector(
                    context,
                    'تاريخ المغادرة',
                    bookingController.selectedEndDate.value,
                    () => bookingController.selectEndDate(context),
                  )),
              SizedBox(height: 16),
              Obx(() => _buildCounter(
                    'عدد الضيوف',
                    bookingController.numberOfGuests.value,
                    bookingController.decrementGuests,
                    bookingController.incrementGuests,
                    'الحد الأقصى 10 ضيوف',
                  )),
              SizedBox(height: 16),
              Obx(() => _buildCounter(
                    'عدد الغرف',
                    bookingController.numberOfRooms.value,
                    bookingController.decrementRooms,
                    bookingController.incrementRooms,
                    'الحد الأقصى 5 غرف',
                  )),
              SizedBox(height: 24),
              _buildPriceSummary(pricePerNight),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () => _confirmBooking(context),
          child: Text(
            'تأكيد الحجز',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
