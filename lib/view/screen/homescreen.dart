import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/view/widget/fontandtext.dart';
import 'package:newhotelyemeni/view/widget/elevatedbuttons.dart';
import 'package:newhotelyemeni/view/screen/notifications_screen.dart';
import 'package:newhotelyemeni/view/widget/category_section.dart';
import 'package:newhotelyemeni/view/screen/bookings_screen.dart';
import 'package:newhotelyemeni/view/screen/favorites_screen.dart';
import 'package:newhotelyemeni/controller/favorites_controller.dart';
import 'package:newhotelyemeni/controller/user_controller.dart';
import 'package:newhotelyemeni/view/screen/profile_screen.dart';
import 'package:newhotelyemeni/view/screen/hotel_details_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final favoritesController = Get.put(FavoritesController());
  final userController = Get.put(UserController());

  final List<Map<String, dynamic>> cityData = [
    {"id": "1", "name": "صنعاء", "icon": Icons.location_on},
    {"id": "2", "name": "عدن", "icon": Icons.location_on},
    {"id": "3", "name": "ذمار", "icon": Icons.location_on},
    {"id": "4", "name": "تعز", "icon": Icons.location_on},
    {"id": "5", "name": "الحديدة", "icon": Icons.location_on},
    {"id": "6", "name": "إب", "icon": Icons.location_on},
  ];

  final List<Map<String, dynamic>> servicesData = [
    {"id": "1", "name": "مطعم", "icon": Icons.restaurant},
    {"id": "2", "name": "مسبح", "icon": Icons.pool},
    {"id": "3", "name": "واي فاي", "icon": Icons.wifi},
    {"id": "4", "name": "موقف سيارات", "icon": Icons.local_parking},
    {"id": "5", "name": "تكييف", "icon": Icons.ac_unit},
    {"id": "6", "name": "خدمة الغرف", "icon": Icons.room_service},
  ];

  @override
  Widget build(BuildContext context) {
    final textStyles = Get.find<CustomTextStyles>();
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.favorite_border, color: Colors.black),
              onPressed: () => Get.to(() => FavoritesScreen()),
            ),
            IconButton(
              icon: Stack(
                children: [
                  Icon(Icons.notifications_none, color: Colors.black),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 14,
                        minHeight: 14,
                      ),
                      child: Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: () => Get.to(() => NotificationsScreen()),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () => Get.to(() => ProfileScreen()),
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage(
                    userController.userData.value['profileImage'] ??
                        'assets/images/hotelimg.jpg',
                  ),
                ),
              ),
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: constraints.maxHeight * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/posterbk.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.black.withOpacity(.8),
                            Colors.black.withOpacity(.2),
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "ابحث عن فندقك الان",
                            textAlign: TextAlign.center,
                            style: textStyles.titleStyle(
                              color: Colors.white,
                              fontSize: constraints.maxWidth * 0.08,
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 3),
                            margin: EdgeInsets.symmetric(
                              horizontal: constraints.maxWidth * 0.1,
                            ),
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: TextField(
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon:
                                    Icon(Icons.search, color: Colors.grey),
                                suffixIcon:
                                    Icon(Icons.filter_list, color: Colors.grey),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                                hintText: "ابحث عن المدن والفنادق ...",
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        CategorySection(
                          title: "المدينة الأقرب اليك",
                          items: cityData,
                          defaultIcon: Icons.location_on,
                          showAllCities: true,
                          onViewAllPressed: () {
                            // Handle view all cities
                          },
                        ),
                        SizedBox(height: 30),
                        CategorySection(
                          title: "الخدمات المتوفرة",
                          items: servicesData,
                          defaultIcon: Icons.room_service,
                          showAllCities: false,
                          onViewAllPressed: () {
                            // Handle view all services
                          },
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'عرض الكل',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            Text("الأعلى تقييماً",
                                style: textStyles.titleStyle()),
                          ],
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 250,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: cityData.length,
                            itemBuilder: (context, index) {
                              final items = cityData[index];
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => HotelDetailsScreen(
                                        hotel: {
                                          'id': items['id'],
                                          'name': 'فندق اليمن السعيد',
                                          'location': 'صنعاء - شارع الزبيري',
                                          'rating': 4.5,
                                          'price': '120',
                                          'description': 'يقع فندق اليمن السعيد في قلب العاصمة صنعاء، ويوفر إطلالات خلابة على المدينة القديمة. يتميز الفندق بموقعه الاستراتيجي وخدماته الراقية التي تلبي احتياجات النزلاء.',
                                        },
                                      ));
                                    },
                                    child: makeItem(
                                      image: 'assets/images/hotelimg.jpg',
                                      title: '${items['name']}',
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        // Text("حسب الخدمات", style: textStyles.titleStyle()),
                        // SizedBox(height: 20),
                        // SizedBox(
                        //   height: 40,
                        //   child: ListView.builder(
                        //     scrollDirection: Axis.horizontal,
                        //     itemCount: servicesData.length,
                        //     itemBuilder: (context, index) {
                        //       final items = servicesData[index];
                        //       return Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //         children: [
                        //           Padding(
                        //             padding: const EdgeInsets.symmetric(horizontal: 4),
                        //             child: CustomElevatedButton(
                        //               label: '${items['name']}',
                        //               icon: items['icon'],
                        //               backgroundColor: Colors.blueGrey,
                        //               textColor: Colors.white,
                        //               onPressed: () {},
                        //             ),
                        //           ),
                        //         ],
                        //       );
                        //     },
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildAmenityItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue, size: 24),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget makeItem({image, title}) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.2),
              ],
            ),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
