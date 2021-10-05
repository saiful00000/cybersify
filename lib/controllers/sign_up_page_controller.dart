import 'package:cybersify/pages/login_page.dart';
import 'package:cybersify/repositories/auth_repo.dart';
import 'package:cybersify/utils/ProgressDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPageController extends GetxController{
   TextEditingController fullNameController;
   TextEditingController phoneNumController;
   TextEditingController emailController;
   TextEditingController passController;
   TextEditingController idNoController;

   AuthRepo authRepo;

  final regFormKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    fullNameController = TextEditingController();
    phoneNumController = TextEditingController();
    emailController = TextEditingController();
    passController = TextEditingController();
    idNoController = TextEditingController();

    authRepo = AuthRepo();
  }

  void signUpOperation() async{
    showProgressDialog('Sign Up');
    bool registerStatus = await authRepo.register(
    fullNameController.text,
    phoneNumController.text,
    emailController.text,
    passController.text,
    idNoController.text);

    if(registerStatus) Get.back();
    if(registerStatus) Get.offAll(()=>LoginPage(),transition: Transition.cupertino);
  }
}