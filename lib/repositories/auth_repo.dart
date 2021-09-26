import 'dart:convert';

import 'package:cybersify/constants/api_urls.dart';
import 'package:cybersify/models/user_data.dart';
import 'package:http/http.dart' as http;

class AuthRepo {

  Future<UserData?> login(String email, String password) async {
    try{
      Uri url = Uri.parse(ApiUrls.loginUrl(email, password));

      final response = await http.post(url);

      print('response body = ${response.body}');

      if (response.statusCode == 200){
        var body = jsonDecode(response.body);
        if (body['success'] == true){
          return UserData.fromJson(body['data']);
        }
      }

    }catch(err){
      throw Exception(err);
    }

    return null;
  }

}