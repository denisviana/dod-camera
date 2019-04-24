
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
        fontFamily: 'Didact Gothic',

        inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Color(0xFF00bcd4)),
            hintStyle: TextStyle(color: Colors.black38),
            border: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF00bcd4))),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF00bcd4)))
        ),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt', ''),
      ],
      /*routes: {
        MyRoutes.login: (context) => LoginScreen(),
      },
      initialRoute: MyRoutes.login,*/
      home: Container(),
    );

    return _app;
  }

}