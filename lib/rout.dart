import 'package:get/get.dart';
import 'package:newhotelyemeni/core/consttint/rout_name.dart';
import 'package:newhotelyemeni/core/my_middleware.dart';
import 'package:newhotelyemeni/features/MyReservations/view/screen/bookings_details.dart';
import 'package:newhotelyemeni/features/auth/forgetpassword/checkpassword.dart';
import 'package:newhotelyemeni/features/auth/forgetpassword/resetpassword.dart';
import 'package:newhotelyemeni/features/auth/forgetpassword/verify_Repassword.dart';
import 'package:newhotelyemeni/features/auth/login/login.dart';
import 'package:newhotelyemeni/features/auth/onboarder_auth/onboader_screen.dart';
import 'package:newhotelyemeni/features/auth/signup/signup.dart';
import 'package:newhotelyemeni/features/auth/success_signup.dart';
import 'package:newhotelyemeni/features/auth/verify_email/verfiy_signup.dart';
import 'package:newhotelyemeni/features/hotelDetiles/hotel_details_screen.dart';
import 'package:newhotelyemeni/features/setting/settingscreen.dart';
import 'package:newhotelyemeni/features/wellcome.dart';
import 'package:newhotelyemeni/features/setting/aboutscreen.dart';
import 'package:newhotelyemeni/features/home/view/homescreen.dart';


List<GetPage<dynamic>>? getPages = [
  // GetPage(name: "/", page:()=> Wellcome()),
  GetPage(name: '/', page: () => const Login(), middlewares: [Mymiddleware()]),
  GetPage(name: RoutName.aboutScreen, page: () => AboutScreen()),
  GetPage(name: RoutName.homePage, page: () => HomeScreen()),
  // GetPage(name: RoutName.hotelsDetails, page: () => HotelsDetails()),
  GetPage(name: RoutName.settingscreen, page: () => Settingscreen()),

  //Auth
  GetPage(name: RoutName.onboarder, page: () => OnboaderScreen()),
  GetPage(name: RoutName.login, page: () => Login()),
  GetPage(name: RoutName.signup, page: () => SignUp()),
  GetPage(name: RoutName.verifyEmail, page: () => VerifySignup()),
  GetPage(name: RoutName.successEmail, page: () => SuccessSignup()),
  GetPage(name: RoutName.checkPassword, page: () => CheckPassword()),
  GetPage(name: RoutName.verifyRepassword, page: () => VerifyResatePassword()),
  GetPage(name: RoutName.repassword, page: () => ResetPassword()),
  GetPage(name: RoutName.bookingDetails, page: () => BookingDetailsPage()),
];
