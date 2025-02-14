import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/view/widget/elevatedbuttons.dart';
import 'package:newhotelyemeni/view/widget/fontandtext.dart';

class CategorySection extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> items;
  final IconData defaultIcon;
  final bool showAllCities;
  final VoidCallback? onViewAllPressed;

  const CategorySection({
    Key? key,
    required this.title,
    required this.items,
    required this.defaultIcon,
    this.showAllCities = false,
    this.onViewAllPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyles = Get.find<CustomTextStyles>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // TextButton(
              //   onPressed: onViewAllPressed,
              //   child: Text(
              //     'عرض الكل',
              //     style: TextStyle(color: Colors.blue),
              //   ),
              // ),
              Text(title, style: textStyles.titleStyle()),
            ],
          ),
        ),
        SizedBox(height: 10),
        if (showAllCities)
          _buildExpandedGrid()
        else
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                final item = items[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8),

                  child: CustomElevatedButton(
                    label: item['name'] ?? '',
                    icon: item['icon'] ?? defaultIcon,
                    backgroundColor: showAllCities ? Colors.white : Colors.blueGrey,
                    textColor: showAllCities ? Colors.black87 : Colors.white,
                    onPressed: () {
                      // Handle button press
                    },
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  Widget _buildExpandedGrid() {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 2.5,
        ),
        // scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return CustomElevatedButton(
            label: item['name'] ?? '',
            icon: item['icon'] ?? defaultIcon,
            backgroundColor: Colors.white,
            textColor: Colors.black87,
            onPressed: () {
              // Handle button press
            },
          );
        },
      ),
    );
  }
}
