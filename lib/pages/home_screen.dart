import 'dart:convert';

import 'package:cybersify/controllers/home_screen_controller.dart';
import 'package:cybersify/database/database.dart';
import 'package:cybersify/models/user_data.dart';
import 'package:cybersify/pages/activity_list_screen.dart';
import 'package:cybersify/pages/vendor_list_screnn.dart';
import 'package:cybersify/pages/withdraw_screen.dart';
import 'package:cybersify/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreenController _controller = Get.put(HomeScreenController());
  Function wp = () {};
  Function hp = () {};

  @override
  Widget build(BuildContext context) {
    wp = Screen(MediaQuery.of(context).size).wp;
    hp = Screen(MediaQuery.of(context).size).hp;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: wp(100),
                constraints: BoxConstraints(minHeight: 250),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,
                        colors: [
                      Color(0xff004D79),
                      Color(0xff051C3E),
                    ])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: wp(100),
                      alignment: Alignment.centerLeft,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'assets/dummy_image.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                    Text(
                      "Balance",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => Text(
                        "${_controller.profileData?.value?.profile?.balance ?? '0'} MRG",
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "= 2892.20 USD",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: wp(100),
                      child: Image.asset(
                        'assets/cover.png',
                        fit: BoxFit.fitWidth,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    _wideButton("Send MRG"),
                    _wideButton("Redeem Voucher"),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40, right: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _cardItem(
                            title: 'Withdraw',
                            image: 'assets/cash_withdraw.png',
                            onTap: () {
                              Get.to(() => WithdrawScreen(),
                                  transition: Transition.cupertino);
                            },
                          ),
                          _cardItem(
                            title: 'Buy Voucher',
                            image: 'assets/ticket.png',
                            onTap: () {

                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40, right: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _cardItem(
                            title: 'Transaction',
                            image: 'assets/transaction.png',
                            onTap: () {

                            },
                          ),

                          _cardItem(
                            title: 'Customer\nSupport',
                            image: 'assets/customer_sup.png',
                            onTap: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
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
                      onPressed: () {},
                      icon: Icon(
                        Icons.person,
                        size: 50,
                        color: Color(0xff051C3E),
                      ))
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(top: 30),
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () async {
              Get.to(() => VendorListScreen());
            },
            child: Padding(
                padding: EdgeInsets.all(5),
                child: Image.asset('assets/home.png')),
          ),
        ),
      ),
    );
  }

  Widget _wideButton(String s) {
    return InkWell(
      onTap: () {
        if (s == 'Send MRG') {
        } else if (s == 'Redeem Voucher') {}
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          alignment: Alignment.center,
          height: 45,
          width: wp(50),
          child: Text(
            s,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget _cardItem(
      {@required String title,
      @required String image,
      @required Function onTap}) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          constraints: BoxConstraints(minHeight: 100, minWidth: 100),
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Image.asset(
                '$image',
                height: 60,
                width: 60,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                '$title',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
