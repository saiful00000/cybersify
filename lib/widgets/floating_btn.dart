import 'package:cybersify/pages/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget floatingActionButton(){
  return Padding(
    padding: EdgeInsets.only(top: 30),
    child: FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: () async {
        Get.offAll(()=>HomeScreen());
      },
      child: Padding(
          padding: EdgeInsets.all(5),
          child: Image.asset('assets/home.png')),
    ),
  );
}