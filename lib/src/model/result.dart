
/*
* { "emissora": { "pessoas": [ "sbt-Ratinho" ], "objects": [ "cup", "tie" ], "final_image": "media/1ZTG9C.JPG" } }
* */

import 'package:dod_camera/src/bloc/image_bloc.dart';
import 'package:flutter/material.dart';

class Result{

  String emissora;
  String pessoas;
  String sbtRatinho;
  List<String> objects;
  String finalImage;
  String _error;

  Result({
    @required this.emissora,
    @required this.pessoas,
    @required this.sbtRatinho,
    @required this.objects,
    @required this.finalImage,
  });

  Map<String,dynamic> toMap() => {
    "emissora" : emissora,
    "pessoas" : pessoas,
    "sbt-Ratinho" : sbtRatinho,
    "objects" : objects,
    "final_image" : finalImage
  };

  factory Result.fromMap(Map<String,dynamic> map) =>
      Result(
        emissora : map["emissora"],
        pessoas: map["pessoas"],
        sbtRatinho: map["sbt-Ratinho"],
        objects: List.from(map["objects"]),
        finalImage: map["final_image"]
      );

  Result.withError(String error)
    : this._error = error;

  String get error => _error;

}