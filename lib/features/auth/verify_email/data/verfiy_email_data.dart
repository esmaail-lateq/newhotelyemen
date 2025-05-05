import 'package:newhotelyemeni/api_links.dart';
import 'package:newhotelyemeni/core/class/curd.dart';
import 'package:newhotelyemeni/core/consttint/links.dart';
import 'package:newhotelyemeni/core/function/auth_Token.dart';

class VerfiyEmailData {
  CURD curd;

  VerfiyEmailData(this.curd);

  getUserData() async {
    String? token = await authToken();
    print('token: $token');
    Map<String, String>? header = {
      // "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": token!,
    };

    var response = await curd.postData(
        requestType: 'get', AppLinksApi.userData, {}, header);
    return response;
  }
}
