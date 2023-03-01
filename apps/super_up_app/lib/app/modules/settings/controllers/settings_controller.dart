import 'package:flutter/material.dart';
import 'package:super_up/app/core/states/s_list_loading_state.dart';
import 'package:super_up/app/modules/splash/views/splash_view.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../../core/s_base_controller.dart';

class SettingsController extends SLoadingController<Object> {
  final txtController = TextEditingController();
  final ProfileApiService service;
  final AuthApiService authApiService;
  final BuildContext context;

  SettingsController(this.service, this.authApiService, this.context)
      : super(SLoadingState("data"));

  @override
  void onClose() {
    txtController.dispose();
  }

  void logout() async {
    final res = await VAppAlert.showAskYesNoDialog(
      context: context,
      title: "Logout",
      content: "Are you sure?",
    );
    if (res != 1) return;
    await vSafeApiCall<void>(
      onLoading: () {
        VAppAlert.showLoading(context: context, isDismissible: true);
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

  @override
  void onInit() {
    // TODO: implement onInit
  }
}
