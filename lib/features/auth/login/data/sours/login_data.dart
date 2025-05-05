import 'package:dartz/dartz.dart';
import 'package:newhotelyemeni/api_links.dart';
import 'package:newhotelyemeni/core/class/curd.dart';
import 'package:newhotelyemeni/core/class/failer.dart';
import 'package:newhotelyemeni/core/consttint/links.dart';

class LoginData {
  CURD curd;
  LoginData(this.curd);

  Map<String, String>? header = {
    "Accept": "application/json",
    "Content-Type": "application/x-www-form-urlencoded",
  };

  Future<Either<Failure, Map>> postData(String email, String password) async {
    var response = await curd.postData(
      AppLinksApi.login,
      {'email': email, 'password': password},
      header,
    );
    return response;
  }

  googleToken(
    String tokenId,
  ) async {
    var response = await curd.postData(
        AppLinksApi.googleSignup,
        {
          "id_token": tokenId,
        },
        header);
    return response;
  }
}
