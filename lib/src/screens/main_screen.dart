

import 'dart:io';

import 'package:dod_camera/src/bloc/image_bloc.dart';
import 'package:dod_camera/src/bloc/image_bloc_provider.dart';
import 'package:dod_camera/src/helper/assets.dart';
import 'package:dod_camera/src/model/http_response.dart';
import 'package:dod_camera/src/screens/image_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  ImageBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = ImageBlocProvider.of(context);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: StreamBuilder<HttpResponse>(
          stream: _bloc.imageStream,
          builder: (context, snapshot){

            if(snapshot.hasData){

              switch(snapshot.data.state){
                case AppState.LOADING :
                  return _showLoading();
                  break;
                case AppState.SUCCESSFUL :

                  var result = snapshot.data.result;
                  if(result.finalImage!=null && result.finalImage.isNotEmpty)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageScreen(imageUrl: result.finalImage),
                      ),
                    );
                  else{
                    WidgetsBinding.instance.addPostFrameCallback((_)=>
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("Erro inesperado"), duration: Duration(seconds: 2)))
                    );
                    return _buildUi();
                  }

                  return Container();
                  break;
                case AppState.ERROR :
                  WidgetsBinding.instance.addPostFrameCallback((_)=>
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text(snapshot.data.error), duration: Duration(seconds: 2)))
                  );
                  return _buildUi();
                  break;
              }

            }else
              return _buildUi();

          }
        ),
      ),
    );
  }

  Widget _buildUi(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[

        Image.asset(AssetsHelper.pathOf("dod.png")),

        Container(
            margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
            height: 44.0,
            child : RaisedButton(
              child: Text("TIRAR FOTO", style: TextStyle(fontWeight: FontWeight.w700)),
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
              onPressed: () async{
                var image = await ImagePicker.pickImage(
                    source: ImageSource.camera, maxHeight: 500.0);
                _bloc.uploadImage(File(image.path));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13)
              ),
            )
        ),

        SizedBox(
          height: 40.0,
        ),

      ],
    );
}

  Widget _showLoading(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

}
