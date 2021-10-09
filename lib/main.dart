import 'package:cybersify/database/database.dart';
import 'package:cybersify/pages/home_screen.dart';
import 'package:cybersify/pages/login_page.dart';
import 'package:cybersify/pages/pass_base_verification_scree.dart';
import 'package:cybersify/pages/splash_screen.dart';
import 'package:cybersify/pages/verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:passbase_flutter/passbase_flutter.dart';

void main() async {
  await GetStorage.init(DatabaseKeys.db_name);
  PassbaseSDK.prefillUserEmail = "testuser@mail.com";
  PassbaseSDK.initialize(publishableApiKey: "VYNGOZbX0eQFxfL8xWObIsKfvjpzOdbcxzBNZvbcddlwbLIQJRsP01scWLRvErv1");

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
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: Colors.transparent,
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Color(0xff051C3E),
          ),
        ),

        colorScheme: ColorScheme(
          secondary: Color(0xff051C3E),
          background: Colors.white,
          brightness: Brightness.light,
          error: Colors.red,
          onBackground: Colors.white,
          primary: Color(0xff051C3E),
          onError: Colors.red,
          onPrimary: Color(0xff051C3E),
          onSecondary: Color(0xff051C3E),
          surface: Colors.white,
          onSurface: Colors.white,
          primaryVariant: Color(0xff051C3E),
          secondaryVariant: Color(0xff051C3E),
        ),
        scaffoldBackgroundColor: Color(0xFFE5E6E7),

      ),
      home: /*SignUpPage()*/SplashScreen()/*VerifyScreen()*//*HomeScreen()*//*PassbaseVerificationScreen()*//*LoginPage()*//*HomeScreen()*/,
    );
  }
}

//hasib.0951@gmail.com