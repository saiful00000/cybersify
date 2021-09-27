import 'dart:convert';

import 'package:cybersify/models/user_data.dart';
import 'package:get_storage/get_storage.dart';

class DatabaseKeys{
  static const db_name = 'cybercify_db';
  static const user_data = 'user_data';
}


class Database{

  static Database instance = Database._();

  Database._();

  init() async {
    await GetStorage.init(DatabaseKeys.db_name);
  }


  Future<void> saveUserData(String userData) async {
    final storage = GetStorage(DatabaseKeys.db_name);
    await storage.write(DatabaseKeys.user_data, userData);
    await storage.save();
  }

  Future<UserData?> getUserData() async {
    try{
      final storage = GetStorage(DatabaseKeys.db_name);
      String data = storage.read(DatabaseKeys.user_data) ?? '';
      if (data.isEmpty){
        return null;
      }
      return UserData.fromJson(jsonDecode(data));
    }catch(error){
      print('$error');
    }

    return null;
  }


}