import 'package:cybersify/repositories/auth_repo.dart';
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

    apiLoading = true;
    update();
    String message = await repo.changePassword(body);
    apiLoading = false;
    update();

    Get.rawSnackbar(backgroundColor: Colors.blue, messageText: Text('$message', style: TextStyle(color: Colors.white)));
  }

}