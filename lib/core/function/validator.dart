import 'package:get/get_utils/get_utils.dart';

validInput(String val,int min,int max,String type){
  if(type == "username"){
    if(!GetUtils.isUsername(val)){
      return "Not vaild username";
    }
  }
  if(type == "email"){
    if(!GetUtils.isEmail(val)){
      return "Not vail email";
    }
  }

  if(type =="phone"){
    if(!GetUtils.isPhoneNumber(val)){
      return "Not vail phone";
    }
    String cleanedPhoneNumber = val.replaceAll(RegExp(r'\D'), '');
    if(!cleanedPhoneNumber.startsWith('77') &&
        !cleanedPhoneNumber.startsWith('78') &&
        !cleanedPhoneNumber.startsWith('71') &&
        !cleanedPhoneNumber.startsWith('70')){
      return 'رقم الهاتف يجب أن يبدأ بـ 77 أو 78 أو 71 أو 70';
    }
  }
if(type == "password"){
  if(!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(val)){
    return "يجب أن تحتوي كلمة السر على رمزوز";
  }
  if(!RegExp(r'[0-9]').hasMatch(val)){
    return 'يجب أن تحتوي كلمة السر على أرقام';

  }
  if(!RegExp(r'[a-zA-Z]').hasMatch(val)){
    return 'يجب أن تحتوي كلمة السر على حروف';

  }
}


  if(val.isEmpty){
    return "can't be empty";
  }

  if(val.length < min){
    return "can't be less than $min";
  }

  if(val.length > max){
    return "can't be larger than $max";
  }




}