import 'package:flutter/material.dart';
import 'package:get/get.dart';

void alertDialog(String title, String msg, {Function() onTap}) {
  Get.defaultDialog(
      barrierDismissible: false,
      title: title,
      middleText: msg,
      textConfirm: 'Ok',
      confirmTextColor: Colors.white,
      buttonColor: Color(0xff051C3E),
      onConfirm: ()=>onTap==null?Get.back():onTap()
  );
}
