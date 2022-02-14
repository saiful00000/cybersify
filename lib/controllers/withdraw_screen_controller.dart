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

class WithdrawScreenController extends GetxController{
  final withdrawFormKey = GlobalKey<FormState>();
  TextEditingController bankDetailsController;
  TextEditingController amountController;
  RxObjectMixin<ProfileData> profiledata = ProfileData().obs;

  @override
  void onInit() {
    super.onInit();
    bankDetailsController = TextEditingController();
    amountController = TextEditingController();
  }

  void getProfileData(){
    Database.instance.getProfile().then(
            (value) {
              profiledata.value = ProfileData.fromJson(jsonDecode(value));
            }
    );

  }

  void postWithdrawData() async {
    try{
      showProgressDialog('Withdraw');
      dynamic userData = await Database.instance.getUserData();
      final response = await http.post(ApiUrls.withdrawUrl(bankDetailsController.text, amountController.text),
          headers: {
            'Authorization':('Bearer ${userData['data']['token']}')
      });
      if (response.statusCode == 200){
        bankDetailsController.clear();
        amountController.clear();
        Get.back();
        alertDialog('Success!', 'Withdraw proceed successfully.',onTap:(){
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