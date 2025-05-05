import 'package:dartz/dartz.dart';
import 'package:newhotelyemeni/api_links.dart';
import 'package:newhotelyemeni/core/class/curd.dart';
import 'package:newhotelyemeni/core/class/failer.dart';
import 'package:newhotelyemeni/core/consttint/links.dart';

class ResetPasswordData {
  CURD curd;
  ResetPasswordData(this.curd);

  Map<String, String>? header = {
    "Accept": "application/json",
    "Content-Type": "application/x-www-form-urlencoded",
  };

  Future<Either<Failure, Map>> postData(String email) async {
    var response = await curd.postData(
      AppLinksApi.resetPassword,
      {'email': email,},
      header,
    );
    return response;
  }

  
}
