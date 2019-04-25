
import 'package:dod_camera/src/bloc/image_bloc.dart';
import 'package:dod_camera/src/model/result.dart';

class HttpResponse{
  Result result;
  AppState state;
  String error;

  HttpResponse({
    this.result,
    this.state,
    this.error
  });

}