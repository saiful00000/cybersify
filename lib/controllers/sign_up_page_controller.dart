import 'package:cybersify/pages/login_page.dart';
import 'package:cybersify/repositories/auth_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPageController extends GetxController{
  late TextEditingController fullNameController;
  late TextEditingController phoneNumController;
  late TextEditingController emailController;
  late TextEditingController passController;
  late TextEditingController idNoController;

  late AuthRepo authRepo;

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
    showProgressDialog();
    bool registerStatus = await authRepo.register(
    fullNameController.text,
    phoneNumController.text,
    emailController.text,
    passController.text,
    idNoController.text);

    Get.back();
    if(registerStatus) Get.offAll(()=>LoginPage(),transition: Transition.cupertino);
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