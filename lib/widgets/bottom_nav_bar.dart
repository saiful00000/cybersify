import 'package:cybersify/pages/activity_list_screen.dart';
import 'package:cybersify/pages/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget bottomNavBar([Function wp]){
  return Padding(
    padding: EdgeInsets.all(5),
    child: Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        width: wp(100),
        constraints: BoxConstraints(minHeight: 80),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  Get.to(() => ActivityListScreen());
                },
                icon: Icon(
                  Icons.notifications,
                  size: 50,
                  color: Color(0xff051C3E),
                )),
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                Get.to(() => ProfileScreen());
              },
              icon: Icon(
                Icons.person,
                size: 50,
                color: Color(0xff051C3E),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}