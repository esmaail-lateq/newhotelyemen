import 'package:newhotelyemeni/core/class/curd.dart';
import 'package:newhotelyemeni/core/consttint/links.dart';

class HomeData {
  CURD curd;
  HomeData(this.curd);

  postData()async{
    var response = await curd.PostData(AppLinks.LinkHomeScreen, {
    });
    return response.fold((l) => l, (r) => r);
  }
}