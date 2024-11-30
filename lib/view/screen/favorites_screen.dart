import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/view/widget/fontandtext.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});

  // نموذج بيانات للفنادق المفضلة (سيتم استبداله بالبيانات الفعلية من قاعدة البيانات)
  final List<Map<String, dynamic>> favorites = [
    {
      "name": "فندق القصر",
      "location": "صنعاء، اليمن",
      "price": "120",
      "rating": "4.5",
      "image": "assets/images/hotelimg.jpg",
      "amenities": ["واي فاي", "مسبح", "مطعم"],
    },
    {
      "name": "فندق السلام",
      "location": "عدن، اليمن",
      "price": "90",
      "rating": "4.2",
      "image": "assets/images/hotelimg.jpg",
      "amenities": ["موقف سيارات", "مطعم", "خدمة الغرف"],
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
          'المفضلة',
          style: textStyles.titleStyle(),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: favorites.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'لا توجد فنادق في المفضلة',
                    style: textStyles.titleStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: favorites.length,
              padding: EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final hotel = favorites[index];
                return Card(
                  margin: EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15),
                              ),
                              image: DecorationImage(
                                image: AssetImage(hotel['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    hotel['rating'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            left: 10,
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                // حذف من المفضلة
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${hotel['price']}/ليلة',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  hotel['name'],
                                  style: textStyles.titleStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  hotel['location'],
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Icon(Icons.location_on,
                                    color: Colors.grey, size: 16),
                              ],
                            ),
                            SizedBox(height: 12),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              alignment: WrapAlignment.end,
                              children: [
                                for (var amenity in hotel['amenities'])
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      amenity,
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                // الانتقال إلى صفحة الحجز
                              },
                              child: Text('احجز الآن'),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
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
