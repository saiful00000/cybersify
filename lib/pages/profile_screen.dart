import 'package:cybersify/controllers/profile_screen_controller.dart';
import 'package:cybersify/database/database.dart';
import 'package:cybersify/pages/change_password_screen.dart';
import 'package:cybersify/pages/login_page.dart';
import 'package:cybersify/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  Function wp = () {};
  Function hp = () {};

  ProfilePageController _controller = Get.put(ProfilePageController());

  @override
  Widget build(BuildContext context) {
    wp = Screen(MediaQuery.of(context).size).wp;
    hp = Screen(MediaQuery.of(context).size).hp;

    return Scaffold(
      body: SafeArea(
        child: Obx((){
          if(_controller.apiLoading.value){
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }else if(_controller.profile.value == null){
            return Center(
              child: Text('There was an problem.'),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: wp(100),
                  constraints: BoxConstraints(minHeight: 200),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff004D79),
                        Color(0xff051C3E),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/dummy_image.png',
                        height: 100,
                        width: 100,
                      ),
                      Text(
                        '${_controller.profile.value.name}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Wallet id: ${_controller.profile.value.wallet}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
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
                SizedBox(
                  height: 16,
                ),
                _cardItem(
                  title: 'Change My Number',
                  icon: Icons.call,
                  ontap: () {},
                ),

                _cardItem(
                  title: 'Change My E-mail',
                  icon: Icons.email,
                  ontap: () {},
                ),

                _cardItem(
                  title: 'Change My Password',
                  icon: CupertinoIcons.lock_open_fill,
                  ontap: () {
                    Get.to(() => ChangePasswordScreen());
                  },
                ),

                _cardItem(
                  title: 'Customer support',
                  icon: Icons.headset_mic_rounded,
                  ontap: () {},
                ),

                _cardItem(
                  title: 'Logout',
                  icon: Icons.logout,
                  ontap: () {
                    Get.defaultDialog(
                        barrierDismissible: false,
                        title: 'Warning',
                        middleText: 'Are you sure to logout?',
                        textConfirm: 'Ok',
                        confirmTextColor: Colors.white,
                        buttonColor: Color(0xff051C3E),
                        onConfirm: () async {
                          await Database.instance.logOut();
                          Get.offAll(LoginPage());
                        },
                    );
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _cardItem(
      {@required String title,
      @required IconData icon,
      @required Function ontap}) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: (){
          ontap();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 40,
                  width: 40,
                  color: Colors.blue,
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    '$title',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
