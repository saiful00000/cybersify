import 'package:cybersify/models/vendor_data_model.dart';
import 'package:cybersify/repositories/vendor_list_repo.dart';
import 'package:get/get.dart';

class VendorScreenController extends GetxController{
  VendorListRepo _repo = VendorListRepo();


  RxList<VendorDataModel> vendorList = <VendorDataModel>[].obs;
  RxBool apiLoading = false.obs;

  @override
  void onInit() {
    _getVendorList();
    super.onInit();
  }

  void _getVendorList() async {
    apiLoading.value = true;
    vendorList.value = await _repo.getVendorList();
    apiLoading.value = false;
  }

}