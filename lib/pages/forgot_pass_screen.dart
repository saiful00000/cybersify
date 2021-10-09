import 'package:cybersify/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassScreen extends StatelessWidget {
  Function wp = () {};
  Function hp = () {};
  @override
  Widget build(BuildContext context) {
    wp = Screen(MediaQuery.of(context).size).wp;
    hp = Screen(MediaQuery.of(context).size).hp;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text('Forget Password',style: TextStyle(color: Colors.white),),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
            onPressed: ()=>Get.back(),
          ),
          ),
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
            child: ListView(
              children: [
                SizedBox(height: 20,),
                TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Enter Address',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.email),
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

                ),
                SizedBox(height: 10,),

                TextButton(
                  onPressed: () {
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
                      'Submit',
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
        )
    );
  }
}
