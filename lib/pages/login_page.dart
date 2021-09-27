import 'package:cybersify/controllers/login_page_controller.dart';
import 'package:cybersify/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  Function wp = () {};
  Function hp = () {};

  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  var _formKey = GlobalKey<FormState>();

  LoginPageController _controller = Get.put(LoginPageController());

  String email = '';
  String password = '';

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
            ])),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(wp(6)),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: hp(10),
                  ),
                  Image.asset(
                    'assets/app_icon.png',
                    height: wp(35),
                    width: wp(35),
                  ),
                  Container(
                    height: hp(5),
                  ),
                  Center(
                      child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.white,
                    ),
                  )),
                  SizedBox(
                    height: hp(5),
                  ),
                  Text('Email/Phone'),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    focusNode: emailNode,
                    decoration: InputDecoration(
                      hintText: 'Enter email or phone number',
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (val) {
                      if (val?.isEmpty ?? true) {
                        return 'Enter your email';
                      }
                      if (!GetUtils.isEmail(val ?? '')) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      email = val ?? '';
                    },
                  ),
                  SizedBox(
                    height: hp(3),
                  ),
                  Text('Password'),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    focusNode: passwordNode,
                    decoration: InputDecoration(
                      hintText: 'Enter password',
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (val) {
                      if (val == null) {
                        return 'Enter password';
                      } else if (val.isEmpty) {
                        return 'Enter your password';
                      } else if (val.length < 4) {
                        return 'Password must be more than 4 character';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      password = val ?? '';
                    },
                  ),
                  SizedBox(
                    height: hp(2),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: hp(5),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();

                        if (email.isNotEmpty && password.isNotEmpty) {
                          _controller.login(email, password);
                          print('$email\n$password');
                        }
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      constraints: BoxConstraints(maxHeight: 45, maxWidth: 160),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xff15B3DC),
                              Color(0xff332FF2),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
