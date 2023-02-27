import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

class SingleRoomSettingsController extends GetxController {
  final VToChatSettingsModel settingsModel;

  SingleRoomSettingsController(this.settingsModel);

  bool isMuted = true;

  String get roomId => settingsModel.roomId;

  @override
  void onInit() {
    isMuted = settingsModel.room.isMuted;
    super.onInit();
    getData();
  }

  void changeRoomNotification(bool value) {
    vSafeApiCall<bool>(
      onLoading: () {
        VAppAlert.showLoading(context: Get.context!);
      },
      request: () async {
        final res = await VChatController.I.roomApi.changeRoomNotification(
          roomId: roomId,
          isMuted: value,
        );
        return res;
      },
      onSuccess: (response) {
        isMuted = response;
        Get.back();
        update();
      },
    );
  }

  Future<void> getData() async {
    // await vSafeApiCall<List<dynamic>>(
    //   onLoading: () async {
    //     loadingState = VChatLoadingState.loading;
    //     update();
    //   },
    //   onError: (exception, trace) {
    //     loadingState = VChatLoadingState.error;
    //     update();
    //   },
    //   request: () async {
    //     await Future.delayed(const Duration(seconds: 4));
    //     return [];
    //   },
    //   onSuccess: (response) {
    //     loadingState = VChatLoadingState.success;
    //     update();
    //   },
    //   ignoreTimeoutAndNoInternet: false,
    // );
  }

  @override
  void onClose() {
    super.onClose();
  }

  void openFullImage() {
    Get.to(() => VImageViewer(
          platformFileSource:
              VPlatformFileSource.fromUrl(url: settingsModel.image),
          appName: SConstants.appName,
        ));
  }

  starMessage(BuildContext context) {}

  onShowMedia(BuildContext context) {}

  Future onBlockUser(BuildContext context) async {
    final res = await VAppAlert.showAskYesNoDialog(
        context: context,
        title: "Block user",
        content: "Are you sure to block ${settingsModel.title}");
    if (res == 1) {
      // await VChatController.I.blockApi.blockUser(
      //   peerIdentifier: settingsModel.room.peerIdentifier!,
      // );
    }
  }

  onReportUser(BuildContext context) {}
}
