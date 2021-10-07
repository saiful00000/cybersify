import 'package:cybersify/models/profile_data_model.dart';
import 'package:cybersify/repositories/profile_repo.dart';
import 'package:get/get.dart';

class ProfilePageController extends GetxController{

  ProfileRepo _repo = ProfileRepo();

  Rx<ProfileDataModel> profile = ProfileDataModel().obs;
  RxBool apiLoading = false.obs;

  @override
  void onInit() {

    _getProfileData();

    super.onInit();
  }

  void _getProfileData() async {
    apiLoading.value = true;
    profile.value = await _repo.getProfileData();
    apiLoading.value = false;
  }

}