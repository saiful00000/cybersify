import 'package:cybersify/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WithdrawScreen extends StatelessWidget {
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
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              'assets/dummy_image.png',
                              height: 50,
                              width: 50,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ashrin Neah',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              Text(
                                'Wallet is: 313123323',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              )
                            ],
                          )
                        ],
                      )),
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
                  Text(
                    "10,714.25 MRG",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
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
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: hp(5),
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Wallet Address',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    validator: (v) {
                      return v!.isEmpty ? 'Wallet Address required.' : null;
                    },
                  ),
                  SizedBox(
                    height: hp(2),
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Amount',
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    validator: (v) {
                      return v!.isEmpty ? 'Amount required.' : null;
                    },
                  ),
                  SizedBox(
                    height: hp(2),
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    validator: (v) {
                      return v!.isEmpty ? 'Amount required.' : null;
                    },
                  ),
                  SizedBox(
                    height: hp(2),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      alignment: Alignment.center,
                      constraints: BoxConstraints(maxHeight: 45, maxWidth: 160),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                      color: Color(0xff051C3E)),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white,fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
