
import 'package:dod_camera/src/model/request.dart';
import 'package:dod_camera/src/model/result.dart';
import 'package:dod_camera/src/resource/api.dart';

class ImageRepository{

  Api api = Api();

  Future<Result> uploadImage(Request request) => api.uploadImage(request);

}