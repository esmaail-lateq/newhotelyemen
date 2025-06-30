import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/features/home/controller/citys_controller.dart';
import 'package:newhotelyemeni/features/home/controller/home_page_controller.dart';

Future<void> showCitySelectorBottomSheet() async {
  final controller = Get.find<CityController>();

  await Get.bottomSheet(
    WillPopScope(
      onWillPop: controller.backExit,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        height: Get.height * 0.7,
        child: Column(
          children: [
            Text('اختر مدينتك',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            TextField(
              controller: controller.textEditingController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'ابحث عن المدينة...',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onChanged: controller.filterCities,
            ),
            SizedBox(height: 10),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.filteredCities.length,
                    itemBuilder: (context, index) {
                      final city = controller.filteredCities[index];
                      return ListTile(
                        title: Text(city),
                        onTap: () => controller.selectCity(city),
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    ),
    isScrollControlled: true,
  );
}
