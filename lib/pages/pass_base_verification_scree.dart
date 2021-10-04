import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passbase_flutter/passbase_flutter.dart';

class PassbaseVerificationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff051C3E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 80),
              child: Image.asset(
                'assets/app_icon.png',
                width: 150,
                height: 150,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 45),
              child: Column(
                children: <Widget>[
                  Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Start your verification by clicking on the button below.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontFamily: 'Exo',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 70),
              child: PassbaseButton(
                onFinish: (identityAccessKey) {
                  // do stuff in case of success
                  print(identityAccessKey);
                },
                onError: (errorCode) {
                  // do stuff in case of cancel
                  print(errorCode);
                },
                onStart: () {
                  // do stuff in case of start
                  print("start");
                },
                width: 300,
                height: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
