import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:newhotelyemeni/api_links.dart';

import 'package:newhotelyemeni/core/class/statusRquest.dart';
import 'package:newhotelyemeni/core/function/chackinternt.dart';
import 'package:path/path.dart';

class CURD {
  Future<Either<StatusRquest, Map>> postData(
      String linkurl, data, Map<String, String>? header,
      {String requestType = 'post'}) async {
    try {
      if (await CheckInternet()) {
        http.Response? response;

        switch (requestType) {
          case 'post':
            response = await http.post(
                Uri.parse('${AppLinksApi.protocol}${AppLinksApi.host}$linkurl'),
                headers: header,
                body: data);

            break;
          case 'put':
            response = await http.put(
                Uri.parse('${AppLinksApi.protocol}${AppLinksApi.host}$linkurl'),
                headers: header,
                body: data);
            break;
          case 'delet':
            response = await http.delete(Uri.http(AppLinksApi.host, linkurl),
                body: data);
            break;
          case 'get':
            response = await http.get(
                Uri.http(
                  AppLinksApi.host,
                  linkurl,
                  // data,
                ),
                headers: header);
            break;
        }
        if (kDebugMode) {
          print(
              '=================================================================curd');
          print(response!.statusCode);
          print(response.body);
        }

        if (response!.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          if (kDebugMode) {
            print(
                '=================================================================curd');
            print('1 done =============================');

            print(responsebody);
          }

          return Right(responsebody);
        } else if (response.statusCode == 404) {
          return const Left(StatusRquest.notfound);
        }
         else if (response.statusCode == 401) {
          return const Left(StatusRquest.authFailer);
        } 
         else if (response.statusCode == 400) {
          return const Left(StatusRquest.badRequest);
        } 
         else if (response.statusCode == 500) {
          return const Left(StatusRquest.serverfailure);
        } 
        else {
          return const Left(StatusRquest.failure);
        }
      } else {
        return const Left(StatusRquest.offline);
      }
    } catch (_) {
      if (kDebugMode) {
        print(
            '=====================$_============================================chatch erorr');
      }

      return const Left(StatusRquest.failure);
    }
  }
}




// import 'dart:convert';
// import 'package:dartz/dartz.dart';
// import 'package:http/http.dart' as http;
// import 'package:newhotelyemeni/core/class/statusRquest.dart';
// import 'package:newhotelyemeni/core/function/chackinternt.dart';
// class CURD{
//   Future< Either< StatusRquest, Map >> postData(String url , Map data)async{
//     if(await CheckInternet()){
//       var response = await http.post(Uri.parse(url) , body: data);
//       if(response.statusCode ==200 || response.statusCode==201){
//         Map responsebody =jsonDecode(response.body);
//         return Right(responsebody);
//       }
//       else{
//         return Left(StatusRquest.serverfailure);
//       }
//    }
//     else{
//       return Left(StatusRquest.offline);
//     }
//   }

// }