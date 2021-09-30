import 'package:cybersify/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VendorListScreen extends StatelessWidget {
  Function wp = () {};
  Function hp = () {};

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
            Container(child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (ctx, i) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.lightBlueAccent)),
                margin: EdgeInsets.all(5),

                child: Text("vdvdfg"),
              );
            }))
          ],
        ),
      ),
    ));
  }
}
