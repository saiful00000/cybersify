import 'dart:convert';

import 'package:cybersify/constants/api_urls.dart';
import 'package:cybersify/database/database.dart';
import 'package:cybersify/models/profile_data_model.dart';
import 'package:http/http.dart' as http;

class ProfileRepo {

  Future<ProfileDataModel> getProfileData() async {
    try{
      Uri url = Uri.parse(ApiUrls.getProfileUrl);

      dynamic userData = await Database.instance.getUserData();
      var headers = {'Authorization':('Bearer ${userData['data']['token']}')};


      final response = await http.get(url, headers: headers);
      print('profile = ${response.body}');

      if(response.statusCode == 200){
        return ProfileDataModel.fromJson(jsonDecode(response.body)['profile']);
      }

    }catch(err){
      print('$err');
    }
    return null;
  }

}