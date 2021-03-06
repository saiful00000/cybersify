import 'dart:convert';

import 'package:cybersify/models/user_data.dart';
import 'package:get_storage/get_storage.dart';

class DatabaseKeys{
  static const db_name = 'cybercify_db';
  static const user_data = 'user_data';
  static const profile_data = 'profile_data';
}


class Database{

  static Database instance = Database._();

  Database._();

  init() async {
    await GetStorage.init(DatabaseKeys.db_name);
  }


  Future<void> saveUserData(String userData) async {
    print('storage data   '+userData);
    final storage = GetStorage(DatabaseKeys.db_name);
    await storage.write(DatabaseKeys.user_data, userData);
    await storage.save();
  }

 dynamic getUserData() async {
    try{
      final storage = GetStorage(DatabaseKeys.db_name);
      String data = storage.read(DatabaseKeys.user_data) ?? '';
      print('get data'+data);
      if (data.isEmpty){
        return null;
      }
      UserData userData = UserData.fromJson(jsonDecode(data));
      print(jsonEncode(userData));
      return jsonDecode(data);
    }catch(error){
      print('$error');
    }

    return null;
  }

  Future<void> saveProfileData(String profileData) async {
    final storage = GetStorage(DatabaseKeys.db_name);
    await storage.write(DatabaseKeys.profile_data, profileData);
    await storage.save();
  }


  Future<String> getProfile() async {
    try{
      final storage = GetStorage(DatabaseKeys.db_name);
      String data = storage.read(DatabaseKeys.profile_data) ?? '';
      if (data.isEmpty){
        return null;
      }
      print("profile data"+data);
      return data;
    }catch(error){
      print('$error');
    }

    return null;
  }

  Future logOut() async {
    final storage = GetStorage(DatabaseKeys.db_name);
    await storage.remove(DatabaseKeys.user_data);
    await storage.remove(DatabaseKeys.profile_data);
  }


}