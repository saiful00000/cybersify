import 'dart:convert';

import 'package:cybersify/database/database.dart';
import 'package:cybersify/models/activity)data_model.dart';
import 'package:cybersify/models/profile_data.dart';
import 'package:cybersify/repositories/activity_list_repo.dart';
import 'package:get/get.dart';

class ActivityListScreenController extends GetxController{
  ActivityListRepo _repo = ActivityListRepo();
  RxObjectMixin<ProfileData> profiledata = ProfileData().obs;


  List<ActivityDataModel> activityList = <ActivityDataModel>[];
  bool apiLoading = false;

  @override
  void onInit() {
    super.onInit();
    _getActivityList();
  }

  void getProfileData(){
    Database.instance.getProfile().then(
            (value) {
          profiledata.value = ProfileData.fromJson(jsonDecode(value));
        }
    );

  }

  void _getActivityList() async {
    apiLoading = true;
    activityList.clear();
    activityList.addAll(await _repo.getVendorList());
    apiLoading = false;
    update();
  }

}