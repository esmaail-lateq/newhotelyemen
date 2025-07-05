// widgets/sort_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/features/hotelsFilter/controller/hotels_filter_controler.dart';

class SortBottomSheet extends StatelessWidget {
  final List<Map<String, String>> sortOptions = [
    {'value': 'rating_desc', 'label': 'الأعلى تقييمًا'},
    {'value': 'price_asc', 'label': 'الأقل سعرًا'},
    {'value': 'price_desc', 'label': 'الأعلى سعرًا'},
    {'value': 'nearest', 'label': 'الأقرب'},
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HotelsFilterControler>();

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Obx(() {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "الترتيب حسب",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ...sortOptions.map((option) {
              final isSelected =
                  controller.selectedSort.value == option['value'];
              return InkWell(
                onTap: () => controller.updateSort(option['value']!),
                child: Row(
                  children: [
                    isSelected
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(Icons.check, color: Colors.blue),
                          )
                        : SizedBox(
                            width: 36,
                          ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(option['label']!),
                    ),
                  ],
                ),
              );

              // ListTile(
              //   title: Text(option['label']!),
              //   trailing:
              //       isSelected ? Icon(Icons.check, color: Colors.blue) : null,
              //   onTap: () => controller.updateSort(option['value']!),
              // );
            }).toList(),
          ],
        );
      }),
    );
  }
}
