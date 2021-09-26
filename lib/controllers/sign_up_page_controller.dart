import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpPageController extends GetxController{
  late TextEditingController fullNameController;
  late TextEditingController phoneNumController;
  late TextEditingController emailController;
  late TextEditingController passController;
  late TextEditingController idNoController;

  final regFormKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    fullNameController = TextEditingController();
    phoneNumController = TextEditingController();
    emailController = TextEditingController();
    passController = TextEditingController();
    idNoController = TextEditingController();
  }

  void signUpOperation() {

  }
}