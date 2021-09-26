import 'package:cybersify/utils/screen.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  Function wp = () {};
  Function hp = () {};

  FocusNode fullNameNode = FocusNode();
  FocusNode phoneNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode nIdCardNode = FocusNode();

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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left:wp(10),right: wp(10),bottom: wp(6),top: wp(6)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height:hp(5)),
                Image.asset('assets/app_icon.png',height: 150,width: 150,),
                Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                SizedBox(
                  height: hp(5),
                ),

                TextFormField(
                  focusNode: fullNameNode,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Full Name',
                    hintStyle: TextStyle(color: Colors.grey,),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.person),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: hp(2),
                ),
                TextFormField(
                  focusNode: phoneNode,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Phone nUmber',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.phone),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),

                SizedBox(
                  height: hp(2),
                ),
                TextFormField(
                  focusNode: emailNode,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Email Address',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.mail),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),

                SizedBox(
                  height: hp(2),
                ),

                TextFormField(
                  focusNode: passwordNode,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.vpn_key),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),

                SizedBox(
                  height: hp(2),
                ),

                TextFormField(
                  focusNode: nIdCardNode,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'ID Card Number',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.credit_card_outlined),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),

                SizedBox(
                  height: hp(5),
                ),

                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      onTap: (){

                      },
                      child: Container(
                        height: 40,
                        width: wp(50),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xff15B3DC),
                                  Color(0xff332FF2),
                                ]
                            ),),
                        child: Text('SIGN UP', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
