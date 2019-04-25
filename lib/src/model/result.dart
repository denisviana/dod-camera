
/*
* { "emissora": { "pessoas": [ "sbt-Ratinho" ], "objects": [ "cup", "tie" ], "final_image": "media/1ZTG9C.JPG" } }
* */

import 'package:dod_camera/src/bloc/image_bloc.dart';
import 'package:dod_camera/src/model/emissora.dart';
import 'package:flutter/material.dart';

class Result{

  Emissora emissora;
  String _error;

  Result({
    @required this.emissora,
  });

  Map<String,dynamic> toMap() => {
    "emissora" : emissora,
  };

  factory Result.fromMap(Map<String,dynamic> map) =>
      Result(
        emissora : map.containsKey("emissora") ? Emissora.fromMap(map["emissora"]) : null,
      );

  Result.withError(String error)
    : this._error = error;

  String get error => _error;

}