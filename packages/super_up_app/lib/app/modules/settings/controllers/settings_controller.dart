import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:super_up/app/routes/app_pages.dart';
import 'package:super_up_core/super_up_core.dart';
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
    await vSafeApiCall<void>(
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
