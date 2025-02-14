import 'package:get/get.dart';
import 'package:newhotelyemeni/view/screen/auth/forgetpassword/checkpassword.dart';
import 'package:newhotelyemeni/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:newhotelyemeni/view/screen/auth/forgetpassword/verify_Repassword.dart';
import 'package:newhotelyemeni/view/screen/auth/login.dart';
import 'package:newhotelyemeni/view/screen/auth/onboarder_auth/onboader_screen.dart';
import 'package:newhotelyemeni/view/screen/auth/signup.dart';
import 'package:newhotelyemeni/view/screen/auth/success_signup.dart';
import 'package:newhotelyemeni/view/screen/auth/verfiy_signup.dart';
import 'package:newhotelyemeni/view/screen/hotel_details_screen.dart';
import 'package:newhotelyemeni/view/screen/setings/settingscreen.dart';
import 'package:newhotelyemeni/view/screen/wellcome.dart';
import 'package:newhotelyemeni/view/screen/aboutscreen.dart';
import 'package:newhotelyemeni/view/screen/homescreen/homescreen.dart';
import 'package:newhotelyemeni/view/screen/hotelsdetails.dart';


List<GetPage<dynamic>>? getPages=[
  GetPage(name: "/", page:()=> Wellcome()),
  GetPage(name: "/AboutScreen", page:()=> AboutScreen()),
  GetPage(name: "/HomeScreen", page:()=> HomeScreen()),
  GetPage(name: "/HotelsDetails", page:()=> HotelsDetails()),
  GetPage(name: "/settingscreen", page:()=> settingscreen()),

  //Auth
  GetPage(name: "/onboarder", page:()=> OnboaderScreen()),
  GetPage(name: "/login", page:()=> Login()),
  GetPage(name: "/signup", page:()=> SignUp()),
  GetPage(name: "/verifyEmail", page:()=> VerifySignup()),
  GetPage(name: "/successEmail", page:()=> SuccessSignup()),
  GetPage(name: "/checkPassword", page:()=> CheckPassword()),
  GetPage(name: "/verifyRepassword", page:()=> VerifyResatePassword()),
  GetPage(name: "/Repassword", page:()=> ResetPassword()),









];