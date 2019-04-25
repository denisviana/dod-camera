
import 'dart:io';

import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {

  String imageUrl;

  ImageScreen({@required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network("https://tv.dodvision.com/$imageUrl"),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black, Colors.black12],
                      begin: Alignment.bottomCenter,
                      end: Alignment(-0.0,-0.0),
                      tileMode: TileMode.clamp
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
