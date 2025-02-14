
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:newhotelyemeni/core/class/statusRquest.dart';
import 'package:newhotelyemeni/core/function/chackinternt.dart';
class CURD{
  Future< Either< StatusRquest, Map >> PostData(String url , Map data)async{
    if(await CheckInternet()){
      var response = await http.post(Uri.parse(url) , body: data);
      if(response.statusCode ==200 || response.statusCode==201){
        Map responsebody =jsonDecode(response.body);
        return Right(responsebody);
      }
      else{
        return Left(StatusRquest.serverfailure);
      }
   }
    else{
      return Left(StatusRquest.offline);
    }
  }

}