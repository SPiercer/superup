import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    startNavigate();
  }

  void startNavigate() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    final isLogin = VAppPref.getBool(SStorageKeys.isLogin.name);
    if (isLogin) {
      Get.offAllNamed(Routes.HOME);
      return;
    }
    final map = VAppPref.getMap(SStorageKeys.myProfile.name);
    if (map == null) {
      Get.offAllNamed(Routes.REGISTER);
      return;
    }
    final myProfile = SMyProfile.fromMap(map);
    if (myProfile.registerStatus == RegisterStatus.accepted) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAll(
        () => SWaitingPage(
          profile: myProfile,
        ),
      );
    }
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
