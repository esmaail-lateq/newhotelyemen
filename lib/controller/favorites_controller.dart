import 'package:get/get.dart';

class FavoritesController extends GetxController {
  // قائمة لتخزين معرفات الفنادق المفضلة
  final favoriteHotels = <String>[].obs;

  // دالة لإضافة أو إزالة فندق من المفضلة
  void toggleFavorite(String hotelId) {
    if (favoriteHotels.contains(hotelId)) {
      favoriteHotels.remove(hotelId);
    } else {
      favoriteHotels.add(hotelId);
    }
  }

  // دالة للتحقق مما إذا كان الفندق مفضلاً
  bool isFavorite(String hotelId) {
    return favoriteHotels.contains(hotelId);
  }
}
