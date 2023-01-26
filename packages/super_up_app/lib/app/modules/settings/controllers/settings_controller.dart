import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:super_up/app/routes/app_pages.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart' hide AuthApiService;
import 'package:v_chat_utils/v_chat_utils.dart';

class SettingsController extends GetxController {
  final txtController = TextEditingController();
  final ProfileApiService service;
  final AuthApiService authApiService;

  SettingsController(this.service, this.authApiService);

  @override
  void onClose() {
    txtController.dispose();
    super.onClose();
  }

  void logout() async {
    final res = await VAppAlert.showAskYesNoDialog(
      context: Get.context!,
      title: "Logout",
      content: "Are you sure?",
    );
    if (res != 1) return;
    await vSafeApiCall<void>(
      onLoading: () {
        VAppAlert.showLoading(context: Get.context!, isDismissible: true);
      },
      onError: (exception, trace) {
        VAppAlert.showOkAlertDialog(
          context: Get.context!,
          title: "Error",
          content: exception,
        );
      },
      request: () async {
        await authApiService.logout(
          isLogoutFromALl: false,
        );
        await VChatController.I.authApi.logout();
        return VAppPref.clear();
      },
      onSuccess: (response) {
        Get.offAllNamed(Routes.SPLASH);
      },
      ignoreTimeoutAndNoInternet: false,
      showToastError: false,
    );
  }
}
