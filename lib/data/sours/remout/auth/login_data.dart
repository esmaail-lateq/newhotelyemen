import 'package:newhotelyemeni/core/class/curd.dart';
import 'package:newhotelyemeni/core/consttint/links.dart';

class LoginData {
  CURD curd;
  LoginData(this.curd);

  postData(String email , String password)async{
    var response = await curd.PostData(AppLinks.LinkLogin, {
      'user_email': email,
      'user_password': password
    });
    return response.fold((l) => l, (r) => r);
  }
}