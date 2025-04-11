import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/controller/homescreen_controller.dart';
import 'package:newhotelyemeni/core/consttint/links.dart';
import 'package:newhotelyemeni/view/screen/homescreen/homeScreenWidget/custom_appbar.dart';
import 'package:newhotelyemeni/view/screen/homescreen/hotel_items.dart';
import 'package:newhotelyemeni/view/widget/category_explor.dart';
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
    {"id": "1", "name": "صنعاء", "street": "حدة", "icon": Icons.location_on},
    {"id": "2", "name": "عدن", "street": "حدة", "icon": Icons.location_on},
    {"id": "3", "name": "ذمار", "street": "حدة", "icon": Icons.location_on},
    {"id": "4", "name": "تعز", "street": "حدة", "icon": Icons.location_on},
    {"id": "5", "name": "الحديدة", "street": "حدة", "icon": Icons.location_on},
    {"id": "6", "name": "إب", "street": "حدة", "icon": Icons.location_on},
  ];

  @override
  Widget build(BuildContext context) {
    final textStyles = Get.find<CustomTextStyles>();
    final size = MediaQuery.of(context).size;
    Get.put(HomeScreenController());

    return GetBuilder<HomeScreenController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(size.height / 2 - 100),
              child: CustomAppbar()),

          //  AppBar(
          //   systemOverlayStyle: SystemUiOverlayStyle.light,
          //   elevation: 0,
          //   leading: IconButton(
          //     icon: Icon(Icons.menu, color: Colors.black),
          //     onPressed: () {},
          //   ),
          //   actions: [
          //     IconButton(
          //       icon: Icon(Icons.favorite_border, color: Colors.black),
          //       onPressed: () => Get.to(() => FavoritesScreen()),
          //     ),
          //     IconButton(
          //       icon: Stack(
          //         children: [
          //           Icon(Icons.notifications_none, color: Colors.black),
          //           Positioned(
          //             right: 0,
          //             top: 0,
          //             child: Container(
          //               padding: EdgeInsets.all(2),
          //               decoration: BoxDecoration(
          //                 color: Colors.red,
          //                 borderRadius: BorderRadius.circular(6),
          //               ),
          //               constraints: BoxConstraints(
          //                 minWidth: 14,
          //                 minHeight: 14,
          //               ),
          //               child: Text(
          //                 '3',
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 8,
          //                 ),
          //                 textAlign: TextAlign.center,
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //       onPressed: () => Get.to(() => NotificationsScreen()),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 8),
          //       child: GestureDetector(
          //         onTap: () => Get.to(() => ProfileScreen()),
          //         child: CircleAvatar(
          //           radius: 15,
          //           backgroundImage: AssetImage(
          //             userController.userData.value['profileImage'] ??
          //                 'assets/images/hotelimg.jpg',
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Container(
                    //   height: constraints.maxHeight * 0.4,
                    //   decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //       image: AssetImage('assets/images/posterbk.png'),
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       gradient: LinearGradient(
                    //         begin: Alignment.bottomRight,
                    //         colors: [
                    //           Colors.black.withOpacity(.8),
                    //           Colors.black.withOpacity(.2),
                    //         ],
                    //       ),
                    //     ),
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.end,
                    //       children: <Widget>[
                    //         Text(
                    //           "ابحث عن اقرب فندق لك ",
                    //           textAlign: TextAlign.center,
                    //           style: textStyles.titleStyle(
                    //             color: Colors.white,
                    //             fontSize: constraints.maxWidth * 0.08,
                    //           ),
                    //         ),
                    //         SizedBox(height: 30),
                    //         Container(
                    //           padding: EdgeInsets.symmetric(vertical: 3),
                    //           margin: EdgeInsets.symmetric(
                    //             horizontal: constraints.maxWidth * 0.1,
                    //           ),
                    //           height: 50,
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(50),
                    //             color: Colors.white,
                    //             boxShadow: [
                    //               BoxShadow(
                    //                 color: Colors.black12,
                    //                 blurRadius: 5,
                    //                 offset: Offset(0, 2),
                    //               ),
                    //             ],
                    //           ),
                    //           child: TextField(
                    //             textAlign: TextAlign.right,
                    //             decoration: InputDecoration(
                    //               border: InputBorder.none,
                    //               prefixIcon:
                    //                   Icon(Icons.search, color: Colors.grey),
                    //               suffixIcon: Icon(Icons.filter_list,
                    //                   color: Colors.grey),
                    //               hintStyle: TextStyle(
                    //                 color: Colors.grey,
                    //                 fontSize: 15,
                    //               ),
                    //               hintText: "ابحث عن المدن والفنادق ...",
                    //             ),
                    //           ),
                    //         ),
                    //         SizedBox(height: 30),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "فرز على حسب ",
                              style: textStyles.titleStyle(),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              // physics: NeverScrollableScrollPhysics(),
                              // shrinkWrap: true,
                              itemCount: controller.servicesData.length,
                              itemBuilder: (context, index) => CategoryExpelor(
                                model: controller.servicesData[index],
                                i: index + 1,
                              ),
                            ),
                          ),

                          // CategorySection(
                          //   title: "الخدمات المتوفرة",
                          //   items: servicesData,
                          //   defaultIcon: Icons.room_service,
                          //   showAllCities: false,
                          //   onViewAllPressed: () {
                          //     // Handle view all services
                          //   },
                          // ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // TextButton(
                              //   onPressed: () {},
                              //   child: Text(
                              //     'عرض الكل',
                              //     style: TextStyle(color: Colors.blue),
                              //   ),
                              // ),
                              Text(" عرض الكل", style: textStyles.titleStyle()),
                            ],
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 250,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.hoteldata.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(
                                            HotelDetailsScreen(
                                                hotel: controller
                                                    .hoteldata[index]),
                                            arguments: {
                                              "cateogry":
                                                  controller.servicesData,
                                              "hotelId": controller
                                                  .hoteldata[index].hotelId
                                            });
                                      },
                                      child: makeItem(
                                          image: controller
                                              .hoteldata[index].hotelImage,
                                          title:
                                              '${controller.hoteldata[index].hotelNamear}',
                                          location:
                                              '${controller.hoteldata[index].addressCuntry}',
                                          city:
                                              '${controller.hoteldata[index].addressCity}',
                                          street:
                                              '${controller.hoteldata[index].addressStreet}',
                                          rating: controller
                                              .hoteldata[index].hotelRating),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          if (controller.selectcate != null) HotelItems(),

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

  Widget makeItem({image, title, location, city, street, rating}) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage("${AppLinks.rootImage}/hotel/$image"),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5), // مسافة صغيرة بين العناصر
              Row(
                children: [
                  Text(
                    location,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    city,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    street,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              SizedBox(height: 5), // مسافة صغيرة بين العناصر
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 18),
                  Icon(Icons.star, color: Colors.yellow, size: 18),
                  Icon(Icons.star, color: Colors.yellow, size: 18),
                  Icon(Icons.star, color: Colors.yellow, size: 18),
                  Icon(Icons.star_border, color: Colors.yellow, size: 18),
                  SizedBox(width: 5),
                  Text(
                    rating.toString(),
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

// Widget makeItem({image, title}) {
  //   return AspectRatio(
  //     aspectRatio: 1 / 1,
  //     child: Container(
  //       margin: EdgeInsets.only(right: 15),
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(20),
  //         image: DecorationImage(
  //           image: AssetImage(image),
  //           fit: BoxFit.cover,
  //         ),
  //       ),
  //       child: Container(
  //         padding: EdgeInsets.all(20),
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(20),
  //           gradient: LinearGradient(
  //             begin: Alignment.bottomRight,
  //             colors: [
  //               Colors.black.withOpacity(.8),
  //               Colors.black.withOpacity(.2),
  //             ],
  //           ),
  //         ),
  //         child: Align(
  //           alignment: Alignment.bottomLeft,
  //           child: Text(
  //             title,
  //             style: TextStyle(color: Colors.white, fontSize: 20),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
