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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left:wp(10),right: wp(10),bottom: wp(6),top: wp(6)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: hp(20),
                width: wp(88),
              ),
              Center(
                  child: Text(
                    'Create Account',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: hp(5),
              ),

              TextFormField(
                focusNode: fullNameNode,
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  hintStyle: TextStyle(color: Colors.grey),
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
                height: hp(1.5),
              ),
              TextFormField(
                focusNode: phoneNode,
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
                height: hp(1.5),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                focusNode: emailNode,
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
                height: hp(1.5),
              ),

              TextFormField(
                focusNode: passwordNode,
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
                height: hp(1.5),
              ),

              TextFormField(
                focusNode: nIdCardNode,
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
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: (){

                    },
                    child: Container(
                      color: Colors.blue,
                      height: 40,
                      width: wp(88),
                      alignment: Alignment.center,
                      child: Text('Sign Up', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
