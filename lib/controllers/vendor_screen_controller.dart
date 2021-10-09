import 'package:cybersify/models/vendor_data_model.dart';
import 'package:cybersify/repositories/vendor_list_repo.dart';
import 'package:get/get.dart';

class VendorScreenController extends GetxController{
  VendorListRepo _repo = VendorListRepo();


  List<VendorDataModel> vendorList = <VendorDataModel>[];
  bool apiLoading = false;

  @override
  void onInit() {
    _getVendorList();
    super.onInit();
  }

  void _getVendorList() async {
    apiLoading = true;
    vendorList = await _repo.getVendorList();
    apiLoading = false;
    update();
  }

}