import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    startNavigate();
  }

  void startNavigate() async {
    await Future.delayed(const Duration(milliseconds: 500));
    Get.offAndToNamed(Routes.PRIVACY_POLICY);
  }

  @override
  void onClose() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
    super.onClose();
  }
}
