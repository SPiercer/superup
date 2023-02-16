import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../widgets/single_rename.dart';

class BroadcastRoomSettingsController extends GetxController {
  final txtController = TextEditingController();
  VChatLoadingState loadingState = VChatLoadingState.ideal;
  VToChatSettingsModel settingsModel;
  late VMyBroadcastInfo info;

  BroadcastRoomSettingsController(
    this.settingsModel,
  );

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  String get roomId => settingsModel.roomId;

  void onChangeImage() async {
    final image = await VAppPick.getCroppedImage();
    if (image != null) {
      vSafeApiCall<String>(
        onLoading: () {
          VAppAlert.showLoading(context: Get.context!);
        },
        request: () async {
          return VChatController.I.roomApi.updateBroadcastImage(
            roomId: roomId,
            file: image,
          );
        },
        onSuccess: (response) {
          settingsModel = settingsModel.copyWith(image: response);
          Get.back();
          update();
        },
      );
    }
  }

  Future<void> getData() async {
    await vSafeApiCall<VMyBroadcastInfo>(
      onLoading: () async {
        loadingState = VChatLoadingState.loading;
        update();
      },
      onError: (exception, trace) {
        loadingState = VChatLoadingState.error;
        update();
      },
      request: () async {
        return VChatController.I.roomApi.getBroadcastMyInfo(roomId: roomId);
      },
      onSuccess: (response) {
        info = response;
        loadingState = VChatLoadingState.success;
        update();
      },
      ignoreTimeoutAndNoInternet: false,
    );
  }

  @override
  void onClose() {
    txtController.dispose();
    super.onClose();
  }

  void onUpdateTitle() async {
    final newTitle = await Get.to(() => SingleRename(
          appbarTitle: "update broadcast title",
          oldValue: settingsModel.title,
        ));
    if (newTitle != settingsModel.title) {
      vSafeApiCall<String>(
        onLoading: () {
          VAppAlert.showLoading(context: Get.context!);
        },
        request: () async {
          await VChatController.I.roomApi
              .updateBroadcastTitle(roomId: roomId, title: newTitle);
          return newTitle;
        },
        onSuccess: (response) {
          settingsModel = settingsModel.copyWith(
            title: response,
          );
          Get.back();
          update();
        },
      );
    }
  }

  void onGoShowMembers() {}
}
