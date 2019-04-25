
import 'dart:convert';
import 'dart:io';

import 'package:bloc_provider/bloc_provider.dart';
import 'package:dod_camera/src/model/http_response.dart';
import 'package:dod_camera/src/model/request.dart';
import 'package:dod_camera/src/model/result.dart';
import 'package:dod_camera/src/repository/image_repository.dart';
import 'package:rxdart/rxdart.dart';

class ImageBloc extends Bloc{

  final _repository = ImageRepository();
  final _stateSubject = BehaviorSubject<HttpResponse>();

  Stream<HttpResponse> get imageStream => _stateSubject.stream;

  void uploadImage(File file) async{

    _stateSubject.sink.add(HttpResponse(state: AppState.LOADING));

    String base64Image = base64Encode(file.readAsBytesSync());

    await _repository.uploadImage(Request(image: base64Image))
      .then((result){
        _stateSubject.sink.add(HttpResponse(state: AppState.SUCCESSFUL, result: result));
    }).catchError((error){
        _stateSubject.sink.add(HttpResponse(state: AppState.ERROR, error : "$error"));
    });

  }

  @override
  void dispose() {
    _stateSubject.close();
  }

}

enum AppState{
  LOADING, SUCCESSFUL, ERROR
}