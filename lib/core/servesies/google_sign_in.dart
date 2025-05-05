import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInServec {
  static GoogleSignIn? _googleSignIn;

  static Future<String> getUserIdToken() async {
    await dotenv.load(fileName: '.env');

    _googleSignIn = GoogleSignIn(
      serverClientId: dotenv.env['SERVES_CLINT'],
      clientId: dotenv.env['CLINT_ID'],
      scopes: ['email', 'profile', 'openid'],
    );
    try {
      // تسجيل خروج لضمان جلسة جديدة
      await _googleSignIn!.signOut();

      // محاولة تسجيل الدخول
      final GoogleSignInAccount? account = await _googleSignIn!.signIn();
      if (account == null) {
        // المستخدم ألغى العملية
        return '';
      }

      // الحصول على معلومات المصادقة
      final GoogleSignInAuthentication auth = await account.authentication;
      print(auth);
      final String? idToken = auth.idToken;
      final String? accessToken = auth.accessToken;

      if (idToken != null) {
        print('ID Token: $idToken');
        return idToken;
        // أرسله إلى سيرفرك للتحقق
      } else {
        print('ID token is null');
      }
    } catch (error) {
      print('Google Sign-In error: $error');
    }
    return '';
  }
}
