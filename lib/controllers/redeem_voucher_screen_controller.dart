import 'dart:convert';

import 'package:cybersify/constants/api_urls.dart';
import 'package:cybersify/database/database.dart';
import 'package:cybersify/models/profile_data.dart';
import 'package:cybersify/utils/ProgressDialog.dart';
import 'package:cybersify/utils/alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RedeemVoucherScreenController extends GetxController{
  final reDeemVoucherFormKey = GlobalKey<FormState>();
  TextEditingController voucherController;
  RxObjectMixin<ProfileData> profiledata = ProfileData().obs;

  @override
  void onInit() {
    super.onInit();
    voucherController = TextEditingController();
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

  void postRedeemVoucherData() async {
    try{
      showProgressDialog('Redeem Voucher');
      dynamic userData = await Database.instance.getUserData();
      final response = await http.post(Uri.parse(ApiUrls.reDeemVoucher),
          body: {
            "voucher":voucherController.text
          },
          headers: {
            'Authorization':('Bearer ${userData['data']['token']}')
          });
      if (response.statusCode == 200){
        voucherController.clear();
        Get.back();
        alertDialog('Success!', 'Redeem Voucher proceed successfully.');
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