
import 'package:bloc_provider/bloc_provider.dart';
import 'package:dod_camera/src/bloc/image_bloc.dart';
import 'package:flutter/material.dart';

class ImageBlocProvider extends BlocProvider<ImageBloc> {

  static final bloc = ImageBloc();

  ImageBlocProvider({Widget child}) : super(
      creator : (context, _bag) => bloc
  );

  static ImageBloc of(BuildContext context) => BlocProvider.of(context);

}
