import 'dart:convert';

import 'package:cybersify/constants/api_urls.dart';
import 'package:cybersify/database/database.dart';
import 'package:cybersify/models/profile_data.dart';
import 'package:cybersify/models/user_data.dart';
import 'package:http/http.dart' as http;

class HomeRepository{
  Future<ProfileData> profileData() async {
    try{
      Uri url = Uri.parse(ApiUrls.profileUrl);

      UserData userData = await Database.instance.getUserData();
      final response = await http.post(url,headers: {
        'Authorization':('Bearer ${userData.token}')
      });

      print('response body = ${response.body}');

      if (response.statusCode == 200){
        var body = jsonDecode(response.body);

        return body;
      }

    }catch(err){
      throw Exception(err);
    }

    return null;
  }
}