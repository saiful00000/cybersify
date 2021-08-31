import 'package:cybersify/utils/screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  Function wp = (){};
  Function hp = (){};


  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    wp = Screen(MediaQuery.of(context).size).wp;
    hp = Screen(MediaQuery.of(context).size).hp;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(wp(6)),
          child: Column(
            children: [
              Container(
                height: hp(30),
                width: wp(88),
                color: Colors.grey,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
