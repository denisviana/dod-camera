
import 'package:flutter/material.dart';

class Emissora{

  List<String> pessoas;
  List<String> objects;
  String finalImage;

  Emissora({
    @required this.pessoas,
    @required this.objects,
    @required this.finalImage,
  });

  Map<String,dynamic> toMap() => {
    "pessoas" : pessoas,
    "objects" : objects,
    "final_image" : finalImage
  };

  factory Emissora.fromMap(Map<String,dynamic> map) =>
      Emissora(
          pessoas: map.containsKey("pessoas") ? List.from(map["pessoas"]) : List(),
          objects: map.containsKey("objects") ? List.from(map["objects"]) : List(),
          finalImage: map.containsKey("final_image") ? map["final_image"] : null
      );

}