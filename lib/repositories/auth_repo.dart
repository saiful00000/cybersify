import 'dart:convert';

import 'package:cybersify/constants/api_urls.dart';
import 'package:cybersify/database/database.dart';
import 'package:cybersify/models/user_data.dart';
import 'package:cybersify/utils/alert_dialog.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthRepo {

  Future<UserData> login(String email, String password) async {
    try{
      Uri url = Uri.parse(ApiUrls.loginUrl(email, password));

      final response = await http.post(url);

      print('response body = ${response.body}');
      var body = jsonDecode(response.body);
      if (response.statusCode == 200){
        if (body['success'] == true){
          Database.instance.saveUserData(response.body);
          Get.back();
          return UserData.fromJson(body['data']);
        }else{
          Get.back();
          alertDialog('Alert!', body['message']);
        }
      }else{
        Get.back();
        alertDialog('Alert!', body['message']);
      }

    }catch(err){
      Get.back();
      alertDialog('Error!', 'Internal error occurred.');
      throw Exception(err);
    }

    return null;
  }

  Future<bool> register(String fullName, String phoneNum,String email,String pass,String idCard) async {
    try{
      Uri url = Uri.parse(ApiUrls.registerUrl(fullName, phoneNum, email, pass, idCard));

      final response = await http.post(url);

      print('response body = ${response.body}');
      var body = jsonDecode(response.body);
      if (response.statusCode == 200){
        if (body['success'] == true){
          return true;
        }else {
          Get.back();
          alertDialog('Alert!', body['message']);
          return false;
        }
      }else{
        print('yes false');
        Get.back();
        alertDialog('Alert!', body['message']);
        return false;
      }

    }catch(err){
      Get.back();
      alertDialog('Error!', 'Internal error occurred.');
      throw Exception(err);
    }

    return false;
  }


  Future<String> changePassword (Map<String, String> body) async {
    try{
      Uri url = Uri.parse(ApiUrls.changePassword);
      dynamic userData = await Database.instance.getUserData();
      var headers = {'Authorization':('Bearer ${userData['data']['token']}')};

      final response = await http.post(url, body: body, headers: headers);

      print('change response = ${response.statusCode} = ${response.body}');

      return jsonDecode(response.body)['message'];

    } catch (e, t){
      print('$e');
      print('$t');
    }

    return 'Failed';
  }


  Future<String> forgotPassword (Map<String, String> body) async {
    try{
      Uri url = Uri.parse(ApiUrls.resetPasswordUrl());
      dynamic userData = await Database.instance.getUserData();
      var headers = {'Authorization':('Bearer ${userData['data']['token']}')};

      final response = await http.post(url, body: body, headers: headers);

      print('forget response = ${response.statusCode} = ${response.body}');

      return jsonDecode(response.body)['message'];

    } catch (e, t){
      print('$e');
      print('$t');
    }

    return 'Failed';
  }

}