import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../../routes/app_pages.dart';

class CreateBroadcastController extends GetxController {
  final List<SBaseUser> users;
  final txtController = TextEditingController();
  VChatLoadingState loadingState = VChatLoadingState.ideal;

  CreateBroadcastController(this.users);

  VPlatformFileSource? image;

  Future<void> createGroup() async {
    final title = txtController.text;
    if (title.isEmpty) {
      VAppAlert.showErrorSnackBar(
        msg: "Title is required",
        context: Get.context!,
      );
      return;
    }
    await vSafeApiCall(
      onLoading: () async {
        VAppAlert.showLoading(context: Get.context!);
      },
      onError: (exception, trace) {
        Get.back();
        VAppAlert.showErrorSnackBar(
          msg: exception,
          context: Get.context!,
        );
      },
      request: () async {
        await VChatController.I.nativeApi.remote.room.createBroadcast(
          CreateBroadcastDto(
            identifiers: users.map((e) => e.id).toList(),
            title: title,
            platformImage: image,
          ),
        );
        await Future.delayed(const Duration(seconds: 3));
        return;
      },
      onSuccess: (response) {
        Get.until((route) => route.settings.name == Routes.HOME);
      },
      ignoreTimeoutAndNoInternet: false,
    );
  }

  @override
  void onClose() {
    txtController.dispose();
    super.onClose();
  }
}
