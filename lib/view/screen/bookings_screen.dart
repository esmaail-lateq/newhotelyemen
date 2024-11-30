import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/view/widget/fontandtext.dart';

class BookingsScreen extends StatelessWidget {
  BookingsScreen({super.key});

  // نموذج بيانات للحجوزات (سيتم استبداله بالبيانات الفعلية من قاعدة البيانات)
  final List<Map<String, dynamic>> bookings = [
    {
      "hotelName": "فندق القصر",
      "location": "صنعاء، اليمن",
      "checkIn": "2024-02-15",
      "checkOut": "2024-02-20",
      "price": "120",
      "status": "مؤكد",
      "image": "assets/images/hotelimg.jpg",
    },
    {
      "hotelName": "فندق السلام",
      "location": "عدن، اليمن",
      "checkIn": "2024-03-01",
      "checkOut": "2024-03-05",
      "price": "90",
      "status": "قيد الانتظار",
      "image": "assets/images/hotelimg.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final textStyles = Get.find<CustomTextStyles>();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'حجوزاتي',
          style: textStyles.titleStyle(),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: bookings.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.hotel_outlined,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'لا توجد حجوزات حالية',
                    style: textStyles.titleStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: bookings.length,
              padding: EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final booking = bookings[index];
                return Card(
                  margin: EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                          image: DecorationImage(
                            image: AssetImage(booking['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: booking['status'] == 'مؤكد'
                                        ? Colors.green.withOpacity(0.1)
                                        : Colors.orange.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    booking['status'],
                                    style: TextStyle(
                                      color: booking['status'] == 'مؤكد'
                                          ? Colors.green
                                          : Colors.orange,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  booking['hotelName'],
                                  style: textStyles.titleStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  booking['location'],
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Icon(Icons.location_on,
                                    color: Colors.grey, size: 16),
                              ],
                            ),
                            Divider(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${booking['price']}/ليلة',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'تسجيل الدخول: ${booking['checkIn']}',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Icon(Icons.login,
                                            color: Colors.grey, size: 16),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Text(
                                          'تسجيل الخروج: ${booking['checkOut']}',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Icon(Icons.logout,
                                            color: Colors.grey, size: 16),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
