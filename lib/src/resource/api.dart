
import 'dart:convert';

import 'package:dod_camera/src/model/request.dart';
import 'package:dod_camera/src/model/result.dart';
import 'package:http_logger/http_logger.dart';
import 'package:http_middleware/http_middleware.dart';

class Api {

  HttpWithMiddleware httpClient = HttpWithMiddleware.build(middlewares: [
    HttpLogger(logLevel: LogLevel.BODY),
  ]);

  final String url = "https://tv.dodvision.com";

 Future<Result> uploadImage(Request request) async{
   return await httpClient.post(""
       "$url/test-app/",
       body: jsonEncode(request.toMap()),
       headers: {"Content-Type": "application/json"})
     .then((response){
       Map<String,dynamic> mapResult = jsonDecode(response.body);
       return Result.fromMap(mapResult);
   });
 }

}