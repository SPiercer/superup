import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:super_up/app/routes/app_pages.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart' hide AuthApiService;
import 'package:v_chat_utils/v_chat_utils.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final AuthApiService authService;
  final ProfileApiService profileService;

  RegisterController(
    this.authService,
    this.profileService,
  );

  Future<void> register() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    if (name.isEmpty) {
      VAppAlert.showErrorSnackBar(
        msg: "Name must have value",
        context: Get.context!,
      );
      return;
    }
    if (!EmailValidator.validate(email)) {
      VAppAlert.showErrorSnackBar(
        msg: "Email not valid",
        context: Get.context!,
      );
      return;
    }
    final password = passwordController.text;
    final confirm = confirmController.text;

    if (password.isEmpty) {
      VAppAlert.showErrorSnackBar(
        msg: "Password must have value",
        context: Get.context!,
      );
      return;
    }

    if (password != confirm) {
      VAppAlert.showErrorSnackBar(
        msg: "Password not match",
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
        print(trace);
      },
      request: () async {
        final deviceHelper = DeviceInfoHelper();
        await authService.register(RegisterDto(
          email: email,
          method: RegisterMethod.email,
          fullName: name,
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
        await VChatController.I.authApi.register(
          identifier: response.baseUser.id,
          fullName: response.baseUser.fullName,
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

    );
  }

  @override
  void onClose() {
    emailController.dispose();
    nameController.dispose();
    confirmController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void facebook() {}

  void apple() {}

  void google() {}
}
