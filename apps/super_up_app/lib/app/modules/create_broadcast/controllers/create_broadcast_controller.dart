import 'package:flutter/material.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../../core/s_base_controller.dart';

class CreateBroadcastController extends ValueNotifier
    implements SBaseController {
  final List<SBaseUser> users;
  final txtController = TextEditingController();

  final BuildContext context;

  CreateBroadcastController(this.users, this.context) : super(null);

  VPlatformFileSource? image;

  Future<void> createGroup() async {
    final title = txtController.text;
    if (title.isEmpty) {
      VAppAlert.showErrorSnackBar(
        msg: "Title is required",
        context: context,
      );
      return;
    }
    await vSafeApiCall(
      onLoading: () async {
        VAppAlert.showLoading(context: context);
      },
      onError: (exception, trace) {
        context.pop();
        VAppAlert.showErrorSnackBar(
          msg: exception,
          context: context,
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
        context.pop();
        context.pop();
      },
      ignoreTimeoutAndNoInternet: false,
    );
  }

  @override
  void onClose() {
    txtController.dispose();
  }

  @override
  void onInit() {}
}
