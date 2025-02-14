class ModelHotelitems {
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
  String? roomsId;
  String? roomsName;
  String? roomsNumbers;
  String? bedCount;
  String? pricePerNight;
  String? maxOccupancy;
  String? roomsImage;
  String? isAvailable;
  String? cateId;

  ModelHotelitems({this.hotelId, this.hotelName, this.hotelNamear, this.hotelDescription, this.hotelDescriptionar, this.hotelRating, this.hotelImage, this.managerId, this.addressId, this.addressCuntry, this.addressCity, this.addressStreet, this.addressLat, this.addressLong, this.addressHotelid, this.roomsId, this.roomsName, this.roomsNumbers, this.bedCount, this.pricePerNight, this.maxOccupancy, this.isAvailable,this.roomsImage, this.cateId});

  ModelHotelitems.fromJson(Map<String, dynamic> json) {
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
    roomsId = json["rooms_id"];
    roomsName = json["rooms_name"];
    roomsNumbers = json["rooms_numbers"];
    bedCount = json["bed_count"];
    pricePerNight = json["price_per_night"];
    maxOccupancy = json["max_occupancy"];
    isAvailable = json["is_available"];
    roomsImage = json["rooms_images"];
    cateId = json["cate_id"];
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
    _data["rooms_id"] = roomsId;
    _data["rooms_name"] = roomsName;
    _data["rooms_numbers"] = roomsNumbers;
    _data["bed_count"] = bedCount;
    _data["price_per_night"] = pricePerNight;
    _data["max_occupancy"] = maxOccupancy;
    _data["is_available"] = isAvailable;
    _data["rooms_images"] = roomsImage;
    _data["cate_id"] = cateId;
    return _data;
  }
}