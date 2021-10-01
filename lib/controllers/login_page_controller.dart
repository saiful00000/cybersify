import 'package:cybersify/models/user_data.dart';
import 'package:cybersify/repositories/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
   AuthRepo authRepo;


  @override
  void onInit() {
    authRepo = AuthRepo();

    super.onInit();
  }

  void login(String email, String password) async {

    showProgressDialog();

    /// login user and get user data
    UserData userData = await authRepo.login(email, password);

    if((userData?.verificationStatus??'pending') == 'pending'){

    }
    /// save user data to local database


    Get.back();

  }

  void showProgressDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 16,
              ),
              Text(
                'Login in progress...',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
