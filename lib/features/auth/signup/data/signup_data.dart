import 'package:newhotelyemeni/api_links.dart';
import 'package:newhotelyemeni/core/class/curd.dart';
import 'package:newhotelyemeni/core/consttint/links.dart';

class SignupData {
  CURD curd;

  SignupData(this.curd);
  Map<String, String>? header = {
    // "Accept": "application/json",
    "Content-Type": "application/x-www-form-urlencoded",
  };

  postData(String name, String password, String email, String phone,
      String passwordConfirmation) async {
    var response = await curd.postData(
        AppLinksApi.signup,
        {
          "name": name,
          "password": password,
          "password_confirmation": password,
          "email": email,
          "phone_number": phone,
        },
        header);
    return response;
  }

  googleToken(String tokenId, ) async {
    var response = await curd.postData(
        AppLinksApi.googleSignup,
        {
          "id_token": tokenId,
          
        },
        header);
    return response;
  }
}
