import 'package:cybersify/controllers/change_password_controller.dart';
import 'package:cybersify/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeEmailScreen extends StatelessWidget {

  Function wp = () {};
  Function hp = () {};

  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';


  ChangePasswordController _controller = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    wp = Screen(MediaQuery.of(context).size).wp;
    hp = Screen(MediaQuery.of(context).size).hp;
    return GetBuilder<ChangePasswordController>(
      builder: (controller){
        return SafeArea(
            child: Scaffold(
              appBar: AppBar(title: Text('Change Email',style: TextStyle(color: Colors.white),),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                  onPressed: ()=>Get.back(),
                ),
              ),
              body: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
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
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        children: [
                          SizedBox(height: 20,),
                          TextFormField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'New Email',
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.symmetric(horizontal: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: Icon(Icons.lock),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            validator: (val) {
                              if (val?.isEmpty ?? true) {
                                return 'Enter email';
                              }
                              return null;
                            },
                            onSaved: (val){
                              _email = val;
                            },
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.symmetric(horizontal: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: Icon(Icons.lock),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            validator: (val) {
                              if (val?.isEmpty ?? true) {
                                return 'Enter password';
                              }
                              return null;
                            },
                            onSaved: (val){
                              _password = val;
                            },
                          ),
                          SizedBox(height: 10,),


                          TextButton(
                            onPressed: () {
                              if(_formKey.currentState.validate()){
                                _formKey.currentState.save();
                                controller.changeEmail(_email, _password);
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
                  ),
                  Visibility(
                    visible: controller.apiLoading,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
            )
        );
      },
    );
  }
}
