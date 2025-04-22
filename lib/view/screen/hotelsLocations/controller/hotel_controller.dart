import 'package:get/get.dart';

class HotelController extends GetxController {
  final HotelService _hotelService = HotelService();

  RxList<HotelModel> hotels = <HotelModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadHotels();
  }

  Future<void> loadHotels() async {
    hotels.value = await _hotelService.fetchHotels();
  }
}

class HotelModel {
  final String id;
  final String name;
  final String description;
  final double latitude;
  final double longitude;

  HotelModel({
    required this.id,
    required this.name,
    required this.description,
    required this.latitude,
    required this.longitude,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
  Map<String, dynamic> toGeoJson() {
    return {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [longitude, latitude]
      },
      "properties": {
        "name": name,
        "description": description,
        "latitude": latitude,
        "longitude": longitude,
      }
    };
  }
}

class HotelService {
  Future<List<HotelModel>> fetchHotels() async {
    // فرضًا البيانات محلية حالياً:
    return [
      HotelModel(
        id: '1',
        name: 'فندق السلام',
        description: 'فندق 5 نجوم في صنعاء',
        latitude: 15.3694,
        longitude: 44.1910,
      ),
      HotelModel(
        id: '2',
        name: 'فندق فايف استار',
        description: 'فندق 5 نجوم في صنعاء',
        latitude: 15.394,
        longitude: 44.1910,
      ),
      HotelModel(
        id: '3',
        name: 'فندق الستين',
        description: 'فندق 5 نجوم في صنعاء',
        latitude: 15.394,
        longitude: 44.1,
      ),
      HotelModel(
        id: '4',
        name: 'فندق قصر سبا',
        description: 'فندق 5 نجوم في صنعاء',
        latitude: 15.1814,
        longitude: 44.1910,
      ),
      // أضف المزيد
    ];
  }
}
