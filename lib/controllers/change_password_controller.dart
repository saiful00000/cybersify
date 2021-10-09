import 'package:cybersify/repositories/auth_repo.dart';
import 'package:cybersify/utils/ProgressDialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController{
  AuthRepo repo = AuthRepo();


  bool apiLoading = false;

  @override
  void onInit() {
    super.onInit();
  }


  void changePassword(String old, String new1, String new2) async {

    Map<String, String> body = {};
    body['c_pass'] = '$new1';
    body['old_pass'] = '$old';
    body['new_pass'] = '$new2';

    showProgressDialog('Changing password');
    String message = await repo.changePassword(body);
    Get.back();

    Get.rawSnackbar(backgroundColor: Colors.blue, messageText: Text('$message', style: TextStyle(color: Colors.white)));
  }

}