
import 'dart:convert';

import 'package:dod_camera/src/model/request.dart';
import 'package:dod_camera/src/model/result.dart';
import 'package:http/http.dart' as http;

class Api {

  final String url = "https://tv.dodvision.com";

 Future<Result> uploadImage(Request request) async{
   return await http.post("$url/test-app/", body: {'image':request.image})
     .then((response){
       Map<String,dynamic> mapResult = jsonDecode(response.body);
       return Result.fromMap(mapResult);
   });
 }

}