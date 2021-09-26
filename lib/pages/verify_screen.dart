import 'package:cybersify/pages/login_page.dart';
import 'package:cybersify/pages/sign_up_page.dart';
import 'package:cybersify/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyScreen extends StatelessWidget {
  Function wp = () {};
  Function hp = () {};
  @override
  Widget build(BuildContext context) {
    wp = Screen(MediaQuery.of(context).size).wp;
    hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 20,),
              Image.asset('assets/app_icon.png',height: 150,width: 150,),

              Text('Verification',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 25
              ),),
              _button('nid'),
              _button('pass')

            ],
          ),
        ),
      ),
    );
  }


  Widget _button(String s) {
    return  TextButton(
        onPressed: (){
          if(s == 'nid') Get.to(()=>LoginPage(),transition: Transition.cupertino);
          else if(s == 'pass') Get.to(()=>SignUpPage(),transition: Transition.cupertino);
        },
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints(
              maxHeight: 200,
              maxWidth: 200
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff15B3DC),
                    Color(0xff332FF2),
                  ]
              ),

              borderRadius: BorderRadius.circular(15)
          ),

          child: Text(s,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),),
        ));
  }
}
