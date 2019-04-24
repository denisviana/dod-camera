
import 'dart:convert';

import 'package:dod_camera/src/model/request.dart';
import 'package:dod_camera/src/model/response.dart';
import 'package:http/http.dart' as http;

class Api {

  final String url = "https://reqres.in/api/";

 Future<Response> uploadImage(Request request) async{

   var response = await http.post(url, body: request)
       .then((response){

         Map<String,dynamic> mapResult = jsonDecode(response.body);
         
         return mapResult;
   });

 }

}