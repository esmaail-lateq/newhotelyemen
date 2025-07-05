// widgets/category_filter_chips.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/consttint/app_string.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/widget/auth/customebuttone.dart';
import 'package:newhotelyemeni/core/widget/custom_floating_buttom.dart';
import 'package:newhotelyemeni/features/hotelsFilter/controller/hotels_filter_controler.dart';

class CategoryFilterChips extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'value': 'all', 'label': 'الكل'},
    {'value': '5_star', 'label': '⭐ 5 نجوم'},
    {'value': 'budget', 'label': '💰 اقتصادي'},
    {'value': 'resort', 'label': '🏝️ منتجع'},
    {'value': 'fgs', 'label': '⭐ 5 نجوم'},
    {'value': 'budgdfgsdet', 'label': '💰 اقتصادي'},
    {'value': 'sfdgd', 'label': '🏝️ منتجع'},
  ];
  final ratingOptions = [
    {"label": "+4.5 ممتاز", "value": 4.5},
    {"label": "+3.5 جيد جدًا", "value": 3.5},
    {"label": "+2.5 جيد", "value": 2.5},
    {"label": "<2 عادي", "value": 2},
  ];
  final List<String> features = [
    'واي فاي مجاني',
    'موقف سيارات',
    'مسبح',
    'صالة رياضية',
    'مسموح بالحيوانات الأليفة',
    'مطعم',
    'تكييف',
    'مكتب استقبال 24 ساعة',
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HotelsFilterControler>();

    return Container(
      height: MediaQuery.of(context).size.height - 50.h,
      padding: EdgeInsets.only(right: 20, left: 20, top: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Obx(() {
        return Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(AppString.filterSchose,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppString.nightPriceRange,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('USD ${controller.minPrice.round()}'),
                            Text(
                                'USD ${controller.priceRange.value.end.round()}'),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              activeTrackColor:
                                  AppColors.secundColor, // الجزء المملوء
                              inactiveTrackColor:
                                  Colors.grey.shade300, // الجزء الفارغ
                              thumbColor: AppColors.secundColor, // الدائرة
                              overlayColor: AppColors.secundColor
                                  .withAlpha(32), // عند الضغط على الدائرة
                              trackHeight: 18.0,
                              thumbShape: CustomVerticalBarThumb(),
                              // overlayShape:
                              //     RoundSliderOverlayShape(overlayRadius: 20.0),
                              valueIndicatorColor: AppColors
                                  .secundColor, // لون البالونة عند السحب
                              valueIndicatorTextStyle:
                                  TextStyle(color: Colors.white),
                              valueIndicatorShape:
                                  SliderComponentShape.noThumb),
                          child: Slider(
                            value: controller.priceRange.value.end,
                            min: controller.minPrice,
                            divisions: ((10000 - controller.minPrice) ~/ 100),
                            max: 10000,
                            onChanged: controller.updatePriceEnd,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 0.5,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(AppString.catagore,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      spacing: 8,
                      children: categories.map((cat) {
                        final isSelected =
                            controller.selectedCategory.value == cat['value'];
                        return ChoiceChip(
                          checkmarkColor: AppColors.secundColor,
                          surfaceTintColor: Colors.transparent,
                          // color: WidgetStateMapper(Color),
                          shadowColor: Colors.transparent,
                          disabledColor: Colors.transparent,
                          selectedShadowColor: Colors.transparent,
                          backgroundColor: Colors.white,
                          selectedColor:
                              const Color.fromARGB(160, 204, 235, 255),
                          label: Text(
                            cat['label']!,
                            style: TextStyle(color: AppColors.primaryColor),
                          ),
                          selected: isSelected,
                          onSelected: (_) =>
                              controller.updateCategory(cat['value']!),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 0.5,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(AppString.rating,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),

                    Wrap(
                      spacing: 8,
                      children: ratingOptions.map((option) {
                        return ChoiceChip(
                          // chipAnimationStyle: ChipAnimationStyle(avatarDrawerAnimation: AnimationStyle()),
                          checkmarkColor: AppColors.secundColor,
                          surfaceTintColor: Colors.transparent,
                          // color: WidgetStateMapper(Color),
                          shadowColor: Colors.transparent,
                          disabledColor: Colors.transparent,
                          selectedShadowColor: Colors.transparent,
                          backgroundColor: Colors.white,
                          selectedColor:
                              const Color.fromARGB(160, 204, 235, 255),
                          label: Container(
                            width: 120,
                            child: Row(
                              children: [
                                Text(
                                  '${option["label"]!}',
                                  style:
                                      TextStyle(color: AppColors.primaryColor),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                          selected: controller.selectedRating.value ==
                              option["value"],
                          onSelected: (_) => controller.selectRating(
                              double.parse(option["value"]!.toString())),
                          labelStyle: TextStyle(
                            color: controller.selectedRating.value ==
                                    option["value"]
                                ? Colors.white
                                : Colors.black,
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 0.5,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "مميزات الفندق",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: features.map((feature) {
                        final isSelected =
                            controller.selectedFeatures.contains(feature);
                        return FilterChip(
                          label: Text(feature),
                          selected: isSelected,
                          checkmarkColor: AppColors.secundColor,
                          surfaceTintColor: Colors.transparent,
                          // color: WidgetStateMapper(Color),
                          shadowColor: Colors.transparent,
                          disabledColor: Colors.transparent,
                          selectedShadowColor: Colors.transparent,
                          backgroundColor: Colors.white,
                          selectedColor:
                              const Color.fromARGB(160, 204, 235, 255),
                          onSelected: (_) => controller.toggleFeature(feature),
                          labelStyle: TextStyle(color: AppColors.primaryColor),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 0.5,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // SizedBox(height: 20),
                    // SizedBox(height: 20),
                    // SizedBox(height: 20),
                    // Center(
                    //   child: ElevatedButton.icon(
                    //     onPressed: () => controller.applyFiltersAndClose(),
                    //     icon: Icon(Icons.check),
                    //     label: Text("تطبيق الفلاتر"),
                    //     style: ElevatedButton.styleFrom(
                    //       padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    //     ),
                    //   ),
                    // )

                    CustomFloatingButtom(
                      onTap: () {
                        controller.applyFiltersAndClose();
                      },
                      text: AppString.showFilterResult,
                      color: AppColors.secundColor,
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  // final List<Map<String, String>> categories = [
  //   {'value': 'all', 'label': 'الكل'},
  //   {'value': '5_star', 'label': '⭐ 5 نجوم'},
  //   {'value': 'budget', 'label': '💰 اقتصادي'},
  //   {'value': 'resort', 'label': '🏝️ منتجع'},
  // ];

  // @override
  // Widget build(BuildContext context) {
  //   final controller = Get.find<HotelsFilterControler>();

  //   return Obx(() => Wrap(
  //     spacing: 8,
  //     children: categories.map((cat) {
  //       final isSelected = controller.selectedCategory.value == cat['value'];
  //       return ChoiceChip(
  //         label: Text(cat['label']!),
  //         selected: isSelected,
  //         onSelected: (_) => controller.updateCategory(cat['value']!),
  //       );
  //     }).toList(),
  //   ));
  // }
}

class CustomVerticalBarThumb extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(10, 24); // عرض وارتفاع العمود
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;
    final paint = Paint()..color = sliderTheme.thumbColor ?? Colors.teal;

    // ارسم مستطيل عمودي (عمود)
    final rect = Rect.fromCenter(center: center, width: 15, height: 35);
    canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(3)), paint);
  }
}
