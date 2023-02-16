import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../../../routes/app_pages.dart';

class GroupRoomSettingsController extends GetxController {
  final txtController = TextEditingController();
  VChatLoadingState loadingState = VChatLoadingState.ideal;
  VToChatSettingsModel settingsModel;
  bool isMuted = true;
  late VMyGroupInfo groupInfo;

  GroupRoomSettingsController(
    this.settingsModel,
  );

  bool get isMeAdminOrSuper {
    if (groupInfo.myRole == VGroupMemberRole.member) return false;
    return true;
  }

  String? get getGroupDesc {
    if (groupInfo.groupSettings == null) return null;
    return groupInfo.groupSettings!.desc;
  }

  String get roomId => settingsModel.roomId;

  @override
  void onInit() {
    isMuted = settingsModel.room.isMuted;
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    await vSafeApiCall<VMyGroupInfo>(
      onLoading: () async {
        loadingState = VChatLoadingState.loading;
        update();
      },
      onError: (exception, trace) {
        loadingState = VChatLoadingState.error;
        update();
      },
      request: () async {
        return VChatController.I.roomApi.getGroupVMyGroupInfo(roomId: roomId);
      },
      onSuccess: (response) {
        groupInfo = response;
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

  void onChangeImage() async {
    final image = await VAppPick.getCroppedImage();
    if (image != null) {
      vSafeApiCall<String>(
        onLoading: () {
          VAppAlert.showLoading(context: Get.context!);
        },
        request: () async {
          return VChatController.I.roomApi.updateGroupImage(
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

  void addParticipantsToGroup() async {
    final users = await Get.toNamed(
      Routes.CHOOSE_MEMBERS,
    ) as List<SBaseUser>?;
    if (users != null) {
      _addGroupMembers(users.map((e) => e.id).toList());
    }
  }

  void onChangeGroupDescriptionClicked() async {
    final newTitle = await Get.to(() => SingleRename(
          appbarTitle: "Update group description",
          oldValue: groupInfo.groupSettings!.desc,
          subTitle: '',
        ));
    if (newTitle != settingsModel.title) {
      vSafeApiCall<String>(
        onLoading: () {
          VAppAlert.showLoading(context: Get.context!);
        },
        request: () async {
          await VChatController.I.roomApi
              .updateGroupDescription(roomId: roomId, description: newTitle);
          return newTitle;
        },
        onSuccess: (response) {
          groupInfo = groupInfo.copyWith(
              groupSettings: groupInfo.groupSettings!.copyWith(desc: newTitle));
          Get.back();
          update();
        },
      );
    }
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

  void onGoShowMembers() {
    Get.toNamed(Routes.GROUP_MEMBERS, arguments: roomId);
  }

  void onExitClicked() {
    Get.until((route) => route.settings.name == Routes.HOME);
  }

  void onUpdateTitle() async {
    final newTitle = await Get.to(() => SingleRename(
          appbarTitle: "Update group title",
          oldValue: settingsModel.title,
          subTitle: '',
        ));
    if (newTitle != settingsModel.title) {
      vSafeApiCall<String>(
        onLoading: () {
          VAppAlert.showLoading(context: Get.context!);
        },
        request: () async {
          await VChatController.I.roomApi
              .updateGroupTitle(roomId: roomId, title: newTitle);
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

  void _addGroupMembers(List<String> list) async {
    await vSafeApiCall<void>(
      onLoading: () {
        VAppAlert.showLoading(context: Get.context!);
      },
      request: () async {
        await VChatController.I.roomApi.addParticipantsToGroup(roomId, list);
      },
      onSuccess: (response) {
        VAppAlert.showOverlaySupport(title: "Users added successfully");
        Get.back();
      },
      onError: (exception, trace) {
        Get.back();
      },
    );
  }
}
