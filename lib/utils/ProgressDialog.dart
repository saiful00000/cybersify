import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showProgressDialog(String msg) {
  Get.dialog(
    Dialog(
      backgroundColor: Colors.transparent,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 16,
            ),
            Text(
              '$msg in progress...',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}