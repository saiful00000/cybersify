import 'package:cybersify/database/database.dart';
import 'package:cybersify/pages/splash_screen.dart';
import 'package:cybersify/pages/verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init(DatabaseKeys.db_name);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cybersify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor:  Color(0xff051C3E),
        fontFamily: 'Bahnschrift',
        accentColor: Colors.blueAccent,
        colorScheme: ColorScheme(
          secondary: Colors.blueAccent,
          background: Colors.white,
          brightness: Brightness.light,
          error: Colors.red,
          onBackground: Colors.white,
          primary: Colors.blue,
          onError: Colors.red,
          onPrimary: Colors.blue,
          onSecondary: Colors.blueAccent,
          surface: Colors.white,
          onSurface: Colors.white,
          primaryVariant: Colors.blue,
          secondaryVariant: Colors.blueAccent,
        ),
        scaffoldBackgroundColor: Color(0xFFE5E6E7),
      ),
      home: /*SignUpPage()*/SplashScreen()/*VerifyScreen()*/,
    );
  }
}