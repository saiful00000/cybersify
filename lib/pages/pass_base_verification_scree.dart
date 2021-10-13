import 'dart:convert';

import 'package:cybersify/constants/api_urls.dart';
import 'package:cybersify/database/database.dart';
import 'package:cybersify/models/profile_data.dart';
import 'package:cybersify/pages/home_screen.dart';
import 'package:cybersify/utils/Utils.dart';
import 'package:cybersify/utils/alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passbase_flutter/passbase_flutter.dart';
import 'package:http/http.dart' as http;

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
                  _checkStatus();
                },
                onError: (errorCode) {
                  alertDialog('Error!', 'Error occurred to verify via passbase. Please try again later.');
                },
                onStart: () {
                  //
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

  void _checkStatus() async {
    Uri url = Uri.parse(ApiUrls.profileUrl);

    dynamic userData = await Database.instance.getUserData();
    final response = await http.get(url,headers: {
      'Authorization':('Bearer ${userData['data']['token']}')
    });

    if (response.statusCode == 200){
      var body = jsonDecode(response.body);
      Database.instance.saveProfileData(response.body);
      ProfileData data = ProfileData.fromJson(body);
      if(statusStrList.contains(userData.verificationStatus??'')){
        Get.offAll(()=>HomeScreen());
      }else{
        alertDialog('Error!', 'Verification failed!. Try again later.');
      }
    }else{
      alertDialog('Alert!', 'Internal error occurred.');
    }
  }

}
