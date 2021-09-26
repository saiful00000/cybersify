import 'package:cybersify/pages/login_page.dart';
import 'package:cybersify/pages/sign_up_page.dart';
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
        primaryColor:  Color(0xff051C3E),
        accentColor: Colors.blueAccent,
        scaffoldBackgroundColor: Color(0xFFE5E6E7),
      ),
      home: /*SignUpPage()*/SplashScreen()/*VerifyScreen()*/,
    );
  }
}