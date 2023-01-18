import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_up/app/routes/app_pages.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart' hide AuthApiService;
import 'package:v_chat_utils/v_chat_utils.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthApiService authService;
  final ProfileApiService profileService;

  LoginController(
    this.authService,
    this.profileService,
  );

  Future<void> login() async {
    final email = emailController.text.trim();

    if (!EmailValidator.validate(email)) {
      VAppAlert.showErrorSnackBar(
        msg: "Email not valid",
        context: Get.context!,
      );
      return;
    }
    final password = passwordController.text;

    if (password.isEmpty) {
      VAppAlert.showErrorSnackBar(
        msg: "Password must have value",
        context: Get.context!,
      );
      return;
    }

    await vSafeApiCall<SMyProfile>(
      onLoading: () async {
        VAppAlert.showLoading(context: Get.context!);
      },
      onError: (exception, trace) {
        Get.back();
        VAppAlert.showOkAlertDialog(
          context: Get.context!,
          title: "Error",
          content: exception.toString(),
        );
      },
      request: () async {
        final deviceHelper = DeviceInfoHelper();
        await authService.login(LoginDto(
          email: email,
          method: RegisterMethod.email,
          //todo fix
          pushKey: null,
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

        await VChatController.I.authApi.login(
          identifier: response.baseUser.id,
          deviceLanguage: response.language,
        );
        if (status == RegisterStatus.accepted) {
          await VAppPref.setBool(SStorageKeys.isLogin.name, true);
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.offAll(
            () => SWaitingPage(
              profile: response,
            ),
          );
        }
      },
      ignoreTimeoutAndNoInternet: false,
      showToastError: false,
    );
  }

  @override
  void onClose() {
    emailController.dispose();

    passwordController.dispose();
    super.onClose();
  }

  void facebook() {}

  void apple() {}

  void google() {}
}
