import 'package:auto_updater/auto_updater.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:super_up/app/core/s_base_controller.dart';
import 'package:super_up/app/modules/splash/views/splash_view.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:universal_html/html.dart';
import 'package:v_chat_room_page/v_chat_room_page.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';
import 'package:v_chat_web_rtc/v_chat_web_rtc.dart';

import '../../../../core/controllers/version_checker_controller.dart';
import '../view/web_chat_scaffold.dart';

class HomeWideController implements SBaseController {
  final ProfileApiService profileApiService;
  final AuthApiService authApiService;
  final BuildContext context;
  final vRoomController = VRoomController();

  HomeWideController(this.profileApiService, this.context, this.authApiService);

  @override
  void onClose() {
    vRoomController.dispose();
  }

  VRoom? currentRoom;

  @override
  void onInit() {
    setVisit();
    vInitCallListener();
    GetIt.I.get<VersionCheckerController>().check();
  }

  void onRoomItemPress(VRoom room) {
    if (currentRoom == room) {
      return;
    }
    currentRoom = room;

    vRoomController.setRoomSelected(room.id);
    vWebChatNavigation.key.currentState!
        .pushReplacementNamed(ChatRoute.route, arguments: room);
  }

  void setVisit() {
    vSafeApiCall(
      request: () async {
        return profileApiService.setVisit();
      },
      onSuccess: (response) {},
      ignoreTimeoutAndNoInternet: true,
    );
  }

  void logout(BuildContext context) async {
    final res = await VAppAlert.showAskYesNoDialog(
      context: context,
      title: "log out",
      content: "are you sure to logout?",
    );
    if (res == 1) {
      await vSafeApiCall<void>(
        onLoading: () {
          VAppAlert.showLoading(
            context: context,
            isDismissible: true,
          );
        },
        onError: (exception, trace) {
          VAppAlert.showOkAlertDialog(
            context: context,
            title: "Error",
            content: exception,
          );
        },
        request: () async {
          try {
            await authApiService.logout(
              isLogoutFromALl: false,
            );
            await VChatController.I.profileApi.logout();
          } catch (err) {
            print(err);
          }
          return VAppPref.clear();
        },
        onSuccess: (response) {
          context.toPageAndRemoveAll(const SplashView());
        },
        ignoreTimeoutAndNoInternet: false,
      );
    }
  }

  void onUpdateVersion() async {
    if (VPlatforms.isWeb) {
      window.location.reload();
    } else if (VPlatforms.isDeskTop) {
      await autoUpdater.checkForUpdates(inBackground: false);
    }
  }
}
