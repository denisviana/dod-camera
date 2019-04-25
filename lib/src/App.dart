
import 'package:bloc_provider/bloc_provider.dart';
import 'package:dod_camera/src/bloc/image_bloc_provider.dart';
import 'package:dod_camera/src/common/localization.dart';
import 'package:dod_camera/src/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class DodCameraApp extends StatelessWidget {

  static MaterialApp _app;

  @override
  Widget build(BuildContext context) {

    _app = MaterialApp(
      title: "My App",
      theme: ThemeData(
        backgroundColor: Colors.white,
        primaryColor: Color(0xFF2AAEC2),
        primaryColorDark: Color(0xFF1e7d8c),
        accentColor: Color(0xFF00bcd4),
        brightness: Brightness.dark,
        fontFamily: 'Comfortaa',

        inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Color(0xFF00bcd4)),
            hintStyle: TextStyle(color: Colors.black38),
            border: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF00bcd4))),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF00bcd4)))
        ),
      ),
      localizationsDelegates: [
        LocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt', ''),
      ],
      debugShowCheckedModeBanner: false,
      /*routes: {
        MyRoutes.login: (context) => LoginScreen(),
      },
      initialRoute: MyRoutes.login,*/
      home: MainScreen(),
    );

    return BlocProviderTree(
      blocProviders: [
        ImageBlocProvider()
      ],
      child: _app,
    );

  }

}
