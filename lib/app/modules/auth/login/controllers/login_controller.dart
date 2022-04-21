import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:superup/app/routes/app_pages.dart';

import '../../../../core/alerts_widgets/confirm_phone/confirm_phone_alert.dart';
import '../../../../core/alerts_widgets/loading/loading_alert.dart';

class LoginController extends GetxController {
  final phoneTextController = TextEditingController();
  String countryCode = "+20";
  DateTime? otpSendAt;

  void nextPress() async {
    LoadingAlert().show();
    // InfoAlert().show(text: "Info");
    await Future.delayed(const Duration(seconds: 1));
    Get.back();
    final res = await ConfirmPhoneAlert()
        .show(text: "$countryCode ${phoneTextController.text}");
    if (res == 1) {
      otpSendAt ??= DateTime.now();
      Get.toNamed(Routes.VERIFY_NUMBER,arguments: phoneTextController.text);
    }
  }
}
