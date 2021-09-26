import 'package:cybersify/pages/splash_screen.dart';
import 'package:cybersify/pages/verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cybersify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
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