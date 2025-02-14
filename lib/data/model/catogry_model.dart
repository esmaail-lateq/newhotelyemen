
class ModelCateogrey {
  String? cateogreyId;
  String? cateogreyName;
  String? cateogreyImage;

  ModelCateogrey({this.cateogreyId, this.cateogreyName, this.cateogreyImage});

  ModelCateogrey.fromJson(Map<String, dynamic> json) {
    cateogreyId = json["cateogrey_id"];
    cateogreyName = json["cateogrey_name"];
    cateogreyImage = json["cateogrey_image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["cateogrey_id"] = cateogreyId;
    _data["cateogrey_name"] = cateogreyName;
    _data["cateogrey_image"] = cateogreyImage;
    return _data;
  }
}
