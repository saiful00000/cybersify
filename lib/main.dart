import 'package:cybersify/database/database.dart';
import 'package:cybersify/pages/home_screen.dart';
import 'package:cybersify/pages/login_page.dart';
import 'package:cybersify/pages/sign_up_page.dart';
import 'package:cybersify/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:passbase_flutter/passbase_flutter.dart';

void main() async {
  await GetStorage.init(DatabaseKeys.db_name);
  PassbaseSDK.prefillUserEmail = "hasib2@xkx.me";
  PassbaseSDK.initialize(publishableApiKey: "cXR0ynShp46OvwTFEL1KHjvleyzQWpXjsx2ryrIiB27LFbLdLw54pGw0ck9Ciqeq");

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
      // home: HomeScreen(),
      home: Test(),
    );
  }
}

class Test extends StatefulWidget {

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {



  @override
  void initState() {

    _checkuserLoginState();

    super.initState();
  }

  void _checkuserLoginState() async {
    dynamic userData = await Database.instance.getUserData();
    if(userData != null){
      Get.offAll(()=>HomeScreen());
    }else{
      Get.offAll(()=>SplashScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}


//hasib.0951@gmail.com