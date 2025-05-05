import 'package:newhotelyemeni/core/class/curd.dart';

import '../../../../core/consttint/links.dart';

class ServesViewData {
  CURD curd;
  ServesViewData(this.curd);

  postData(String hotelId) async {
    var response = await curd.postData(AppLinks.LinkServesView, {
      "hotelID": hotelId,
    },{});
    return response.fold((l) => l, (r) => r);
  }
}
