class HotelsModle {
  int? id;
  int? ownerId;
  String? name;
  String? description;
  String? address;
  String? city;
  String? state;
  String? country;
  String? zipCode;
  String? latitude;
  String? longitude;
  String? rating;
  int? isVerified;
  String? createdAt;
  String? updatedAt;
  List? rooms;
  List<Images>? images;

  HotelsModle(
      {this.id,
      this.ownerId,
      this.name,
      this.description,
      this.address,
      this.city,
      this.state,
      this.country,
      this.zipCode,
      this.latitude,
      this.longitude,
      this.rating,
      this.isVerified,
      this.createdAt,
      this.updatedAt,
      this.rooms,
      this.images});

  HotelsModle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ownerId = json['owner_id'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zipCode = json['zip_code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    rating = json['rating'];
    isVerified = json['is_verified'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    rooms = json['rooms'];
    

    // if (json['rooms'] != null) {
    //   rooms = <Null>[];
    //   json['rooms'].forEach((v) {
    //     rooms!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['owner_id'] = this.ownerId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['zip_code'] = this.zipCode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['rating'] = this.rating;
    data['is_verified'] = this.isVerified;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.rooms != null) {
      data['rooms'] = this.rooms!.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  int? id;
  int? hotelId;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;

  Images(
      {this.id, this.hotelId, this.imageUrl, this.createdAt, this.updatedAt});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hotel_id'] = this.hotelId;
    data['image_url'] = this.imageUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
