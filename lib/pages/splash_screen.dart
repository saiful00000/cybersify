import 'package:cybersify/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  Function wp = () {};
  Function hp = () {};

  @override
  Widget build(BuildContext context) {
    wp = Screen(MediaQuery.of(context).size).wp;
    hp = Screen(MediaQuery.of(context).size).hp;
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

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/app_icon.png',height: 200,width: 150,),

            TextButton(
                onPressed: (){

                },
                child: Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints(
                    maxHeight: 40,
                    maxWidth: 150
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

                  child: Text('LOGIN',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),),
                ))
          ],
        ),
      ),
    );
  }
}
