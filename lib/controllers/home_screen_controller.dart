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
  var isLoading = false.obs;
  @override
  void onInit() {
    homeRepository = HomeRepository();
    super.onInit();

    getProfileData();
  }
  void getProfileData() async {
    try{
      isLoading.value = true;
      Uri url = Uri.parse(ApiUrls.profileUrl);

      dynamic userData = await Database.instance.getUserData();
      final response = await http.get(url,headers: {
        'Authorization':('Bearer ${userData['data']['token']}')
      });

      if (response.statusCode == 200){
        var body = jsonDecode(response.body);
        Database.instance.saveProfileData(response.body);
        profileData.value = ProfileData.fromJson(body);
        isLoading.value = false;
      }else{
        isLoading.value = false;
        Get.back();
        alertDialog('Alert!', 'Internal error occurred.');
      }

    }catch(err){
      isLoading.value = false;
      alertDialog('Alert!', 'Internal error occurred.');
      throw Exception(err);
    }
  }
}