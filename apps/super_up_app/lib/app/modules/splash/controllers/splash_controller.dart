import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:super_up/app/core/states/s_list_loading_state.dart';
import 'package:super_up/app/modules/home_mobile_tabs/home_mobile/views/home_view.dart';
import 'package:super_up/app/modules/register/views/register_view.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../../core/platforms.dart';
import '../../../core/s_base_controller.dart';
import '../../home_wide_modules/home/view/home_wide_view.dart';

class SplashController extends SLoadingController<String> {
  String get version => data;
  final BuildContext context;

  SplashController(this.context) : super(SLoadingState(""));

  @override
  void onInit() {
    getAppVersion();
    startNavigate();
  }

  Future<void> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    value.data = "$version $buildNumber";
    setStateSuccess();
    print(value.data);
  }

  void _homeNav() {
    if ((VPlatforms.isWeb && !VPlatformsX.isWebRunOnMobile) ||
        VPlatforms.isDeskTop) {
      context.toPageAndRemoveAll(const HomeWideView());
    } else {
      context.toPageAndRemoveAll(const HomeMobileView());
    }
  }

  void startNavigate() async {
    if (VPlatforms.isDeskTop) {
      await _setDesktopAutoUpdater();
    }
    await Future.delayed(const Duration(milliseconds: 1300));
    final isLogin = VAppPref.getBool(SStorageKeys.isLogin.name);
    if (isLogin) {
      _homeNav();

      return;
    }
    final map = VAppPref.getMap(SStorageKeys.myProfile.name);
    if (map == null) {
      context.toPageAndRemoveAll(const RegisterView());

      return;
    }
    final myProfile = SMyProfile.fromMap(map);
    if (myProfile.registerStatus == RegisterStatus.accepted) {
      _homeNav();
    } else {
      context.toPageAndRemoveAll(SWaitingPage(
        profile: myProfile,
      ));
    }
  }

  @override
  void onClose() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
  }

  Future _setDesktopAutoUpdater() async {}
}
