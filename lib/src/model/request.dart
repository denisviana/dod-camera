
import 'package:flutter/material.dart';

class Request{

  String image;

  Request({@required this.image});

  Map<String,dynamic> toMap()=>{
    "image" : image
  };

  factory Request.fromMap(Map<String,dynamic> map) =>
      Request(image: map["image"]);

}