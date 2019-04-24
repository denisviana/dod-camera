
/*
* { "emissora": { "pessoas": [ "sbt-Ratinho" ], "objects": [ "cup", "tie" ], "final_image": "media/1ZTG9C.JPG" } }
* */

import 'package:flutter/material.dart';

class Response{

  String emissora;
  String pessoas;
  String sbtRatinho;
  List<String> objects;
  String finalImage;

  Response({
    @required this.emissora,
    @required this.pessoas,
    @required this.sbtRatinho,
    @required this.objects,
    @required this.finalImage
  });

  Map<String,dynamic> toMap() => {
    "emissora" : emissora,
    "pessoas" : pessoas,
    "sbt-Ratinho" : sbtRatinho,
    "objects" : objects,
    "final_image" : finalImage
  };

  factory Response.fromMap(Map<String,dynamic> map) =>
      Response(
        emissora : map["emissora"],
        pessoas: map["pessoas"],
        objects: List.from(map["objects"]),
        finalImage: map["final_image"]
      );

}