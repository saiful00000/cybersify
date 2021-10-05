import 'dart:convert';

import 'package:cybersify/constants/api_urls.dart';
import 'package:cybersify/database/database.dart';
import 'package:cybersify/models/profile_data.dart';
import 'package:cybersify/models/user_data.dart';
import 'package:cybersify/repositories/home_repo.dart';
import 'package:cybersify/utils/ProgressDialog.dart';
import 'package:cybersify/utils/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController{
  HomeRepository homeRepository;

  RxObjectMixin<ProfileData> profileData = ProfileData().obs;
  @override
  void onInit() {
    print('called oninit');
    homeRepository = HomeRepository();
    //getProfileData();
    super.onInit();

    getProfileData();
  }
  void getProfileData() async {
    try{
      showProgressDialog('Loading');
      Uri url = Uri.parse(ApiUrls.profileUrl);

      dynamic userData = await Database.instance.getUserData();
      final response = await http.get(url,headers: {
        'Authorization':('Bearer ${userData['data']['token']}')
      });
      print('response body = ${  response.body}');

      if (response.statusCode == 200){
        var body = jsonDecode(response.body);
        profileData.value = ProfileData.fromJson(body);
        Get.back();
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