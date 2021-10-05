import 'package:cybersify/models/user_data.dart';
import 'package:cybersify/pages/home_screen.dart';
import 'package:cybersify/pages/pass_base_verification_scree.dart';
import 'package:cybersify/repositories/auth_repo.dart';
import 'package:cybersify/utils/ProgressDialog.dart';
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

    showProgressDialog('Login');

    /// login user and get user data
    UserData userData = await authRepo.login(email, password);


    if((userData?.verificationStatus??'pending') == 'pending'){
      Get.back();
      Get.to(()=>PassbaseVerificationScreen());
      //Get.to(()=>HomeScreen());
    }else{
      Get.back();
      Get.to(()=>HomeScreen());
    }
    /// save user data to local database


  }
}
