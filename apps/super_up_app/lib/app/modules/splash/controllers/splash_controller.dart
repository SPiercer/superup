import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final version = "".obs;

  @override
  void onInit() {
    getAppVersion();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    startNavigate();
  }

  Future<void> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    this.version.value = "$version $buildNumber";
    print(this.version.value);
  }

  void startNavigate() async {
    if (VPlatforms.isDeskTop) {
      await _setDesktopAutoUpdater();
    }
    await Future.delayed(const Duration(milliseconds: 1300));
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

  Future _setDesktopAutoUpdater() async {}
}
