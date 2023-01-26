import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:super_up_web/src/pages/home/home_page.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart' hide AuthApiService;
import 'package:v_chat_utils/v_chat_utils.dart';

class LoginController {
  late final BuildContext context;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void onInit(BuildContext context) {
    this.context = context;
  }

  final AuthApiService authService;
  final ProfileApiService profileService;

  LoginController(
    this.authService,
    this.profileService,
  );

  Future login() async {
    final email = emailController.text.trim();
    final pass = passwordController.text;
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
          context: context!,
          title: "Error",
          content: exception.toString(),
        );
      },
      request: () async {
        final deviceHelper = DeviceInfoHelper();
        await authService.login(LoginDto(
          email: email,
          method: RegisterMethod.email,
          pushKey: null,
          deviceInfo: await deviceHelper.getDeviceMapInfo(),
          deviceId: await deviceHelper.getId(),
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
          context.toPageAndRemoveAll(HomePage());
        } else {
          // Get.offAll(
          //       () => SWaitingPage(
          //     profile: response,
          //   ),
          // );
        }
      },
      ignoreTimeoutAndNoInternet: false,
      showToastError: false,
    );
  }

  void close() {
    emailController.dispose();
    passwordController.dispose();
  }
}
