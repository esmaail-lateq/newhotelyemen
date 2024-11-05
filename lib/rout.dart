import 'package:get/get.dart';
import 'package:newhotelyemeni/view/screen/auth/login.dart';
import 'package:newhotelyemeni/view/screen/auth/signup.dart';
import 'package:newhotelyemeni/view/screen/wellcome.dart';

List<GetPage<dynamic>>? getPages=[
  GetPage(name: "/", page:()=> Wellcome()),
  GetPage(name: "/login", page:()=> Login()),
  GetPage(name: "/signup", page:()=> SignUp())



];