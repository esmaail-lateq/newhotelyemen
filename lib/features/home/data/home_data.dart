import 'package:dartz/dartz.dart';
import 'package:newhotelyemeni/api_links.dart';
import 'package:newhotelyemeni/core/class/curd.dart';
import 'package:newhotelyemeni/core/class/failer.dart';
import 'package:newhotelyemeni/core/consttint/links.dart';
import 'package:newhotelyemeni/core/function/auth_Token.dart';

class HomeData {
  CURD curd;
  HomeData(this.curd);

  Map<String, String>? header = {
    "Accept": "application/json",
    "Content-Type": "application/x-www-form-urlencoded",
    "Authorization": authToken()
  };

  Future<Either<Failure, Map>> getData(Map<String,dynamic> data) async {
    Uri url =
        Uri.https(AppLinksApi.host, AppLinksApi.homePage, data);
    print(url.toString());
    var response =
        await curd.postData(url.toString(), {}, header, requestType: 'get');
    return response;
  }
}
