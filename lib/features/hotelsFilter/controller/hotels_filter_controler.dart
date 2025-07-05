// controllers/hotel_filter_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HotelsFilterControler extends GetxController {
  var selectedSort = 'rating_desc'.obs;
  var selectedCategory = 'all'.obs;
  final double minPrice = 100;
  var selectedRating = Rxn<double>();
  var selectedFeatures = <String>[].obs;

void toggleFeature(String feature) {
  if (selectedFeatures.contains(feature)) {
    selectedFeatures.remove(feature);
  } else {
    selectedFeatures.add(feature);
  }
}

void selectRating(double value) {
  selectedRating.value = value;
}

  var priceRange = RangeValues(100, 1000).obs;

  void updateSort(String value) {
    selectedSort.value = value;
  }

  void updateCategory(String value) {
    selectedCategory.value = value;
  }

  void updatePriceEnd(double end) {
    priceRange.value = RangeValues(minPrice, end);
  }

  void applyFiltersAndClose() {
    applyFilters();
    Get.back();
  }

  void applyFilters() {
    print("تصفية الفنادق حسب:");
    print("التصنيف: ${selectedCategory.value}");
    print("الترتيب: ${selectedSort.value}");
    print("السعر: ${priceRange.value.start} - ${priceRange.value.end}");
    // ضع منطق تصفية البيانات هنا
  }

  // void updatePriceRange(RangeValues values) {
  //   priceRange.value = values;
  // }
}
