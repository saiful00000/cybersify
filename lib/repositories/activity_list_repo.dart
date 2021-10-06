import 'dart:convert';

import 'package:cybersify/constants/api_urls.dart';
import 'package:cybersify/database/database.dart';
import 'package:cybersify/models/activity)data_model.dart';
import 'package:http/http.dart' as http;

class ActivityListRepo{

  Future<List<ActivityDataModel>> getVendorList() async {
    List<ActivityDataModel> activityList = [];

    try{
      Uri uri = Uri.parse(ApiUrls.activityListUrl);
      dynamic userData = await Database.instance.getUserData();
      var headers = {'Authorization':('Bearer ${userData['data']['token']}')};

      final response = await http.get(uri, headers: headers);

      print('vendor list response ${response.statusCode} = ${response.body}');

      if(response.statusCode == 200){
        for(var json in jsonDecode(response.body)){
          activityList.add(ActivityDataModel.fromJson(json));
        }
      }

    }catch(err, t){
      print('$err');
      print('$t');
    }

    return activityList;
  }

}