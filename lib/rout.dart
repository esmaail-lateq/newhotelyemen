import 'package:get/get.dart';
import 'package:newhotelyemeni/core/consttint/rout_name.dart';
import 'package:newhotelyemeni/core/my_middleware.dart';
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
import 'package:newhotelyemeni/view/screen/homescreen/view/screen/homescreen.dart';
import 'package:newhotelyemeni/view/screen/hotelsdetails.dart';


List<GetPage<dynamic>>? getPages=[
  // GetPage(name: "/", page:()=> Wellcome()),
   GetPage(
      name: '/', page: () => const Login(), middlewares: [Mymiddleware()]),
  GetPage(name: RoutName.aboutScreen, page:()=> AboutScreen()),
  GetPage(name: RoutName.homePage, page:()=> HomeScreen()),
  GetPage(name: RoutName.hotelsDetails, page:()=> HotelsDetails()),
  GetPage(name: RoutName.settingscreen, page:()=> settingscreen()),

  //Auth
  GetPage(name: RoutName.onboarder, page:()=> OnboaderScreen()),
  GetPage(name: RoutName.login, page:()=> Login()),
  GetPage(name: RoutName.signup, page:()=> SignUp()),
  GetPage(name: RoutName.verifyEmail, page:()=> VerifySignup()),
  GetPage(name: RoutName.successEmail, page:()=> SuccessSignup()),
  GetPage(name: RoutName.checkPassword, page:()=> CheckPassword()),
  GetPage(name: RoutName.verifyRepassword, page:()=> VerifyResatePassword()),
  GetPage(name: RoutName.repassword, page:()=> ResetPassword()),









];