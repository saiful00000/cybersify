import 'package:cybersify/models/activity)data_model.dart';
import 'package:cybersify/repositories/activity_list_repo.dart';
import 'package:get/get.dart';

class ActivityListScreenController extends GetxController{
  ActivityListRepo _repo = ActivityListRepo();


  RxList<ActivityDataModel> activityList = <ActivityDataModel>[].obs;
  RxBool apiLoading = false.obs;

  @override
  void onInit() {
    _getActivityList();
    super.onInit();
  }

  void _getActivityList() async {
    apiLoading.value = true;
    activityList.value = await _repo.getVendorList();
    apiLoading.value = false;
  }

}