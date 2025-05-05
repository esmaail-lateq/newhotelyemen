import 'package:newhotelyemeni/core/consttint/sharedrefernces_keys.dart';
import 'package:newhotelyemeni/core/servesies/myserves.dart';

bool isLoggedIn(MyServices myService) {
  String? step =
      myService.sharedPreferences.getString(SharedreferncesKeys.step);

  if (step == '2') {
    return true;
  }
  return false;
}
