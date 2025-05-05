class AppLinksApi {
  static const String protocol = 'https://';
  static const String webSocketProtocol = 'ws://';
  static const String host = 'yemenihotel.com';
  static const String server = '$protocol$host';

//=====================================auth===================================
  static const String login = '$server/api/login';
  static const String signup = '$server/api/register';
  static const String googleSignup = '$server/api/auth/google/token';
  static const String resetPassword = '$server/api/forgot-password';
  static const String userData = '$server/api/me';
}
