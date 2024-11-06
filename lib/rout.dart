import 'package:get/get.dart';
import 'package:newhotelyemeni/view/screen/auth/login.dart';
import 'package:newhotelyemeni/view/screen/auth/signup.dart';
import 'package:newhotelyemeni/view/screen/auth/success_signup.dart';
import 'package:newhotelyemeni/view/screen/auth/verfiy_signup.dart';
import 'package:newhotelyemeni/view/screen/wellcome.dart';

List<GetPage<dynamic>>? getPages=[
  GetPage(name: "/", page:()=> Wellcome()),

  //Auth
  GetPage(name: "/login", page:()=> Login()),
  GetPage(name: "/signup", page:()=> SignUp()),
  GetPage(name: "/verifyEmail", page:()=> VerifySignup()),
  GetPage(name: "/successEmail", page:()=> SuccessSignup())






];