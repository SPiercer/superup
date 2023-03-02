import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:super_up/app/core/s_base_controller.dart';
import 'package:super_up/app/modules/home_mobile_tabs/home_mobile/views/home_view.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../../core/platforms.dart';
import '../../home_wide_modules/home/view/home_wide_view.dart';

class LoginController implements SBaseController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthApiService authService;
  final ProfileApiService profileService;
  final BuildContext context;
  LoginController(
    this.authService,
    this.profileService,
    this.context,
  );

  @override
  onInit() {
    emailController.text = "user1@gmail.com";
    passwordController.text = "12345678";
  }

  void _homeNav() {
    if ((VPlatforms.isWeb && !VPlatformsX.isWebRunOnMobile) ||
        VPlatforms.isDeskTop) {
      context.toPageAndRemoveAll(const HomeWideView());
    } else {
      context.toPageAndRemoveAll(const HomeMobileView());
    }
  }

  Future<void> login() async {
    final email = emailController.text.trim();

    if (!EmailValidator.validate(email)) {
      VAppAlert.showErrorSnackBar(
        msg: "Email not valid",
        context: context,
      );
      return;
    }
    final password = passwordController.text;

    if (password.isEmpty) {
      VAppAlert.showErrorSnackBar(
        msg: "Password must have value",
        context: context,
      );
      return;
    }

    await vSafeApiCall<SMyProfile>(
      onLoading: () async {
        VAppAlert.showLoading(context: context);
      },
      onError: (exception, trace) {
        context.pop();
        VAppAlert.showOkAlertDialog(
          context: context,
          title: "Error",
          content: exception.toString(),
        );
      },
      request: () async {
        final deviceHelper = DeviceInfoHelper();
        await authService.login(LoginDto(
          email: email,
          method: RegisterMethod.email,
          pushKey: await VChatController
              .I.vChatConfig.currentPushProviderService!
              .getToken(),
          deviceInfo: await deviceHelper.getDeviceMapInfo(),
          deviceId: await deviceHelper.getId(),
          //todo fix
          language: "en",
          platform: VPlatforms.currentPlatform,
          password: password,
        ));
        return profileService.getMyProfile();
      },
      onSuccess: (response) async {
        final status = response.registerStatus;
        await VAppPref.setMap(SStorageKeys.myProfile.name, response.toMap());

        await VChatController.I.profileApi.login(
          identifier: response.baseUser.id,
          deviceLanguage: response.language,
        );
        if (status == RegisterStatus.accepted) {
          await VAppPref.setBool(SStorageKeys.isLogin.name, true);
          _homeNav();
        } else {
          context.toPageAndRemoveAll(
            SWaitingPage(
              profile: response,
            ),
          );
        }
      },
      ignoreTimeoutAndNoInternet: false,
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  void facebook() {}

  void apple() {}

  void google() {}
}
