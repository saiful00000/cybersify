import 'package:cybersify/database/database.dart';
import 'package:cybersify/models/user_data.dart';
import 'package:cybersify/pages/login_page.dart';
import 'package:cybersify/pages/sign_up_page.dart';
import 'package:cybersify/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  Function wp = () {};
  Function hp = () {};

  @override
  Widget build(BuildContext context) {
    wp = Screen(MediaQuery.of(context).size).wp;
    hp = Screen(MediaQuery.of(context).size).hp;
    
    _checkuserLoginState();
    
    return Scaffold(
      body: Container(
        height: hp(100),
        width: wp(100),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff004D79),
              Color(0xff051C3E),
              Color(0xff051C3E),
              Color(0xff701D5B),
            ]
          )
        ),

        child: ListView(
          children: [
            SizedBox(height:hp(10)),
            Image.asset('assets/app_icon.png',height: 200,width: 150,),
            SizedBox(height:hp(25)),
            Container(
              child: Column(
                children: [
                  _button("LOGIN"),
                  SizedBox(height: 20,),
                  _button("SIGN UP"),
                ],
              ),
            ),
            SizedBox(height:hp(2)),
          ],
        ),
      ),
    );
  }

  Widget _button(String s) {
    return TextButton(
      onPressed: () {
        if (s == 'LOGIN')
          Get.to(() => LoginPage(), transition: Transition.cupertino);
        else if (s == 'SIGN UP')
          Get.to(() => SignUpPage(), transition: Transition.cupertino);
      },
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(maxHeight: 45, maxWidth: 160),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xff15B3DC),
                  Color(0xff332FF2),
                ]),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          s,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Future<void> _checkuserLoginState() async {
    dynamic userData = await Database.instance.getUserData();
    if(userData != null){
      //Get.offAll();
    }
  }
}
