import 'package:newhotelyemeni/core/class/curd.dart';
import 'package:newhotelyemeni/core/consttint/links.dart';

class SignupData{

  CURD curd;

  SignupData(this.curd);

  postData(String name , String password , String email , String phone)async{
   var response = await curd.PostData(AppLinks.LinkSignup, {
     "user_name":name,
     "user_password":password,
     "user_email":email,
     "user_phone":phone,
   });
   return response.fold((l) => l, (r) => r,);

  }

}