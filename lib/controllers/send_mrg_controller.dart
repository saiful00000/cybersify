import 'dart:convert';

import 'package:cybersify/constants/api_urls.dart';
import 'package:cybersify/database/database.dart';
import 'package:cybersify/models/profile_data.dart';
import 'package:cybersify/pages/home_screen.dart';
import 'package:cybersify/utils/ProgressDialog.dart';
import 'package:cybersify/utils/alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SendMRGController extends GetxController{
  final sendMRGFormKey = GlobalKey<FormState>();
  TextEditingController walletIdController;
  TextEditingController amountController;
  TextEditingController passController;
  RxObjectMixin<ProfileData> profiledata = ProfileData().obs;

  @override
  void onInit() {
    super.onInit();
    walletIdController = TextEditingController();
    amountController = TextEditingController();
    passController = TextEditingController();

    getProfileData();
  }

  void getProfileData(){
    Database.instance.getProfile().then(
            (value) {
          print(value);
          profiledata.value = ProfileData.fromJson(jsonDecode(value));
        }
    );

  }

  void postMRGData() async {
    try{
      showProgressDialog('Transfer');
      dynamic userData = await Database.instance.getUserData();
      final response = await http.post(ApiUrls.sendMRGUrl(walletIdController.text, amountController.text,passController.text),
          headers: {
            'Authorization':('Bearer ${userData['data']['token']}')
          });
      if (response.statusCode == 200){
        Get.back();
        walletIdController.clear();
        amountController.clear();
        passController.clear();
        print(response.body);
        alertDialog('Success!', 'Withdraw proceed successfully.',onTap: (){
          Get.offAll(()=>HomeScreen());
        });
      }else{
        Get.back();
        alertDialog('Alert!', 'Internal error occurred.');
      }

    }catch(err){
      alertDialog('Alert!', 'Internal error occurred.');
      throw Exception(err);
    }
  }
}