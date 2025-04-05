import 'package:newhotelyemeni/api_links.dart';
import 'package:newhotelyemeni/core/class/curd.dart';
import 'package:newhotelyemeni/core/consttint/links.dart';

class LoginData {
  CURD curd;
  LoginData(this.curd);

  Map<String, String>? header = {
    "Accept": "application/json",
    "Content-Type": "application/x-www-form-urlencoded",
  };

  postData(String email, String password) async {
    var response = await curd.postData(
      AppLinksApi.login,
      {'email': email, 'password': password},
      header,
    );
    return response.fold((l) => l, (r) => r);
  }
}
