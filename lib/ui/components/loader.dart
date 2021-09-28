import 'package:flutter/material.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:get/get.dart';

class Loader {
  static startLoading() async {
    return Get.dialog(
        Center(
            child: CircularProgressIndicator(
          color: kPrimaryColor,
        )),
        barrierDismissible: false);
  }

  static stopLoading() {
    Get.back();
  }
}
