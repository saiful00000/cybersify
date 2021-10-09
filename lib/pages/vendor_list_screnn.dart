import 'package:cybersify/controllers/vendor_screen_controller.dart';
import 'package:cybersify/models/vendor_data_model.dart';
import 'package:cybersify/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';


class VendorListScreen extends StatelessWidget {
  Function wp = () {};
  Function hp = () {};

  VendorScreenController _controller = Get.put(VendorScreenController());

  @override
  Widget build(BuildContext context) {
    wp = Screen(MediaQuery.of(context).size).wp;
    hp = Screen(MediaQuery.of(context).size).hp;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: wp(100),
                alignment: Alignment.centerLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/dummy_image.png',
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Vendor List',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: GetBuilder<VendorScreenController>(
                  builder: (controller){
                    if (_controller.apiLoading) {
                      return Center(
                        child: CupertinoActivityIndicator(),
                      );
                    } else if (_controller.apiLoading == false &&
                        _controller.vendorList.isEmpty) {
                      return Center(
                        child: Text('No vendor available.'),
                      );
                    }
                    return ListView.builder(
                      itemCount: _controller.vendorList.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index){
                        VendorDataModel vendor = _controller.vendorList[index];
                        return InkWell(
                          onTap: ()async{
                            await _launchInBrowser(vendor.url??'');
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.blue,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('${vendor.name}'),
                                      Text('${vendor.address}'),
                                    ],
                                  ),
                                ),
                                Icon(CupertinoIcons.globe, color: Colors.blue,),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
