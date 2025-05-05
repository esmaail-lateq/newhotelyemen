import 'package:newhotelyemeni/core/class/curd.dart';

import '../../../core/consttint/links.dart';

class HotelItemsData {
  CURD curd;
  HotelItemsData(this.curd);

  postData(String cateId) async {
    var response = await curd.postData(AppLinks.LinkHotelItems, {
      "cateoid": cateId,
    },{});
    return response.fold((l) => l, (r) => r);
  }
}
