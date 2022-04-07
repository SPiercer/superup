import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:superup/app/core/alerts_widgets/loading/loading_alert.dart';
import 'package:superup/app/modules/auth/login/controllers/login_controller.dart';
import 'package:superup/app/routes/app_pages.dart';

import '../../../../core/constants/app_constants.dart';

class VerifyNumberController extends GetxController {
  final _loginController = Get.find<LoginController>();
  final txtController = TextEditingController();
  int endTime =
      DateTime.now().millisecondsSinceEpoch + 1000 * AppConstants.otpInterval;
  final isResendSmsEnabled = false.obs;

  void onOtpTimeEnd() {
    isResendSmsEnabled.value = true;
  }

  @override
  void onReady() {
    super.onReady();
    txtController.addListener(() async{
      if (txtController.text.length >= 6) {
        LoadingAlert().show(text: "verifying...");
        await Future.delayed(const Duration(seconds: 1));
        Get.offAllNamed(Routes.PROFILE_INFO);
      }
    });
    final oldTime = _loginController.otpSendAt;
    if (oldTime != null) {
      if (oldTime.isBefore(DateTime.fromMillisecondsSinceEpoch(endTime))) {
        isResendSmsEnabled.value = false;
        //endTime = oldTime.millisecondsSinceEpoch;
      }
    }
  }
}
