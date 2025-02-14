import 'dart:io';

CheckInternet()async{

  try {


    var response = await InternetAddress.lookup("bing.com");
    if(response.isNotEmpty && response[0].rawAddress.isNotEmpty) {
      return true;
    }
  }on SocketException catch(_){
    return false;
  }

}

