import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/controller/homescreen_controller.dart';
import 'package:newhotelyemeni/core/class/handlingStatusView.dart';
import 'package:newhotelyemeni/core/consttint/links.dart';
import 'package:newhotelyemeni/data/model/hotelitems_model.dart';

class HotelItems extends GetView<HomeScreenController> {
  const HotelItems({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      builder: (controller) => HandlingStatusView(
          statusRquest: controller.statusRquest, widget:
       Container(
         height: 300,
         child: ListView.builder(
           scrollDirection: Axis.horizontal,
           itemCount: controller.hotelitems.length,
           itemBuilder: (context, index) {
             return Items(
               model: controller.hotelitems[index],
             );
           },
         ),
      ),),
    );
  }
}


class Items extends StatelessWidget {

  ModelHotelitems model;
  Items({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Navigating to more details...");
      },
      child: Container(
        width: 210, // عرض البطاقة
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    "${AppLinks.rootImage}/room/${model.roomsImage}",
                    height: 150.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: Icon(
                    Icons.favorite,
                    size: 27,
                    color: Colors.red,
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: Text(
                  "${model.hotelNamear}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "${model.roomsName}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.blueGrey),
                Expanded(
                  child: Text(
                    "${model.addressCuntry}-${model.addressCity}-${model.addressStreet}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.price_change, size: 18, color: Colors.indigo),
                    SizedBox(width: 10,),
                    Text(
                      "${model.pricePerNight}الف يمني", // عرض السعر
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}