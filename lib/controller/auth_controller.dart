import 'package:get/get.dart';

class AuthController extends GetxController {
  final _isLoggedIn = false.obs;
  
  bool get isLoggedIn => _isLoggedIn.value;

  // سيتم استبدال هذه الدالة بالتكامل مع الباك اند لاحقاً
  Future<bool> login(String email, String password) async {
    // محاكاة تسجيل الدخول
    await Future.delayed(Duration(seconds: 1));
    _isLoggedIn.value = true;
    return true;
  }

  void logout() {
    _isLoggedIn.value = false;
  }
}
