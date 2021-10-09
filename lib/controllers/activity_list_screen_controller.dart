import 'package:cybersify/models/activity)data_model.dart';
import 'package:cybersify/repositories/activity_list_repo.dart';
import 'package:get/get.dart';

class ActivityListScreenController extends GetxController{
  ActivityListRepo _repo = ActivityListRepo();


  List<ActivityDataModel> activityList = <ActivityDataModel>[];
  bool apiLoading = false;

  @override
  void onInit() {
    super.onInit();
    _getActivityList();
  }

  void _getActivityList() async {
    apiLoading = true;
    activityList.clear();
    activityList.addAll(await _repo.getVendorList());
    apiLoading = false;
    update();
  }

}