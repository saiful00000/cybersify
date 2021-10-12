import 'package:cybersify/controllers/activity_list_screen_controller.dart';
import 'package:cybersify/controllers/home_screen_controller.dart';
import 'package:cybersify/models/activity)data_model.dart';
import 'package:cybersify/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityListScreen extends StatelessWidget {
  Function wp = () {};
  Function hp = () {};

  HomeScreenController _hmController = Get.find();
  ActivityListScreenController _controller =
      Get.put(ActivityListScreenController());

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
                width: wp(100),
                constraints: BoxConstraints(minHeight: 250),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff004D79),
                      Color(0xff051C3E),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Balance",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => Text(
                        "${_hmController.profileData?.value?.profile?.balance ?? '0'} MRG",
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "= ${_hmController.profileData.value.profile?.balance??'0'} USD",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: wp(100),
                      child: Image.asset(
                        'assets/cover.png',
                        fit: BoxFit.fitWidth,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16,),

              GetBuilder<ActivityListScreenController>(builder: (controller){
                if (_controller.apiLoading) {
                  return Center(
                    child: CupertinoActivityIndicator(),
                  );
                } else if (_controller.activityList.isEmpty) {
                  return Center(
                    child: Text('No activity available'),
                  );
                }
                return ListView.builder(
                  itemCount: /*_controller.activityList.length*/2,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    ActivityDataModel activity =
                    _controller.activityList[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/app_icon.png',
                              height: 50,
                              width: 50,
                            ),
                            SizedBox(width: 8,),
                            Expanded(
                              child: Text(
                                '${activity.activity}',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            SizedBox(width: 8,),
                            Text(
                              '${activity.createdAt.split('T')[0]}',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
