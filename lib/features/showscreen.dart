import 'package:flutter/material.dart';

class HotelHomePage extends StatelessWidget {
  const HotelHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> hotels = [
      {
        'name': 'Grand Hotel',
        'city': 'New York',
        'image': 'assets/images/hotelimg.jpg',
        'rating': 4.5,
        'services': ['Free WiFi', 'Pool', 'Spa'],
      },
      {
        'name': 'Sea View Resort',
        'city': 'Los Angeles',
        'image': 'assets/images/hotelimg.jpg',
        'rating': 4.8,
        'services': ['Beachfront', 'Breakfast', 'Gym'],
      },
      {
        'name': 'Mountain Retreat',
        'city': 'Denver',
        'image': 'assets/images/hotelimg.jpg',
        'rating': 4.3,
        'services': ['Hiking Trails', 'Restaurant', 'Parking'],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hotels',
          style: TextStyle(color: Colors.teal),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.teal),
            onPressed: () {
              // إجراء البحث
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // قسم الفلترة
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // فتح خيارات تصفية المدن
                  },
                  icon: const Icon(Icons.location_city),
                  label: const Text('City'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // فتح خيارات تصفية الخدمات
                  },
                  icon: const Icon(Icons.filter_alt),
                  label: const Text('Services'),
                ),
              ],
            ),
          ),
          // قائمة الفنادق
          Expanded(
            child: ListView.builder(
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                final hotel = hotels[index];
                return GestureDetector(
                  onTap: () {
                    _showHotelDetails(context, hotel);
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        // صورة الفندق
                        ClipRRect(
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(12)),
                          child: Image.asset(
                            hotel['image'],
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        // تفاصيل الفندق
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                hotel['name'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                hotel['city'],
                                style: const TextStyle(color: Colors.grey),
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      color: Colors.amber, size: 16),
                                  Text(
                                    '${hotel['rating']}',
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // دالة لإظهار تفاصيل الفندق
  void _showHotelDetails(BuildContext context, Map<String, dynamic> hotel) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    hotel['image'],
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                hotel['name'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(hotel['city'], style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text('${hotel['rating']}',
                      style: const TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // إجراء الحجز
                },
                child: const Text('Book Now'),
              ),
            ],
          ),
        );
      },
    );
  }
}
