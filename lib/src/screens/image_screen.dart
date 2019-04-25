
import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {

  String imageUrl;

  ImageScreen({@required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image(
              image: NetworkImage(this.imageUrl),
            ),
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
