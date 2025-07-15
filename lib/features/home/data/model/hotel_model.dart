
class ModelHotel {
  String? hotelId;
  String? hotelName;
  String? hotelNamear;
  String? hotelDescription;
  String? hotelDescriptionar;
  String? hotelRating;
  String? hotelImage;
  String? managerId;
  String? addressId;
  String? addressCuntry;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;
  String? addressHotelid;
  String? serves;

  ModelHotel({this.hotelId, this.hotelName, this.hotelNamear, this.hotelDescription, this.hotelDescriptionar, this.hotelRating, this.hotelImage, this.managerId, this.addressId, this.addressCuntry, this.addressCity, this.addressStreet, this.addressLat, this.addressLong, this.addressHotelid,this.serves});

  ModelHotel.fromJson(Map<String, dynamic> json) {
    hotelId = json["hotel_id"];
    hotelName = json["hotel_name"];
    hotelNamear = json["hotel_namear"];
    hotelDescription = json["hotel_description"];
    hotelDescriptionar = json["hotel_descriptionar"];
    hotelRating = json["hotel_rating"];
    hotelImage = json["hotel_image"];
    managerId = json["manager_id"];
    addressId = json["address_id"];
    addressCuntry = json["address_cuntry"];
    addressCity = json["address_city"];
    addressStreet = json["address_street"];
    addressLat = json["address_lat"];
    addressLong = json["address_long"];
    addressHotelid = json["address_hotelid"];
    serves = json["address_hotelid"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["hotel_id"] = hotelId;
    _data["hotel_name"] = hotelName;
    _data["hotel_namear"] = hotelNamear;
    _data["hotel_description"] = hotelDescription;
    _data["hotel_descriptionar"] = hotelDescriptionar;
    _data["hotel_rating"] = hotelRating;
    _data["hotel_image"] = hotelImage;
    _data["manager_id"] = managerId;
    _data["address_id"] = addressId;
    _data["address_cuntry"] = addressCuntry;
    _data["address_city"] = addressCity;
    _data["address_street"] = addressStreet;
    _data["address_lat"] = addressLat;
    _data["address_long"] = addressLong;
    _data["address_hotelid"] = addressHotelid;
    return _data;
  }
}
