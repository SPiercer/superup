import 'package:flutter/material.dart';
import 'package:super_up/app/core/states/s_list_loading_state.dart';
import 'package:super_up/app/modules/choose_members/views/choose_members_view.dart';
import 'package:super_up/app/modules/group_members/views/group_members_view.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../../../core/s_base_controller.dart';

class GroupRoomSettingsController extends SLoadingController<VMyGroupInfo> {
  final txtController = TextEditingController();
  final BuildContext context;
  VToChatSettingsModel settingsModel;
  bool isMuted = true;
  late VMyGroupInfo groupInfo;

  GroupRoomSettingsController(
    this.settingsModel,
    this.context,
  ) : super(SLoadingState(VMyGroupInfo.empty()));

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

    getData();
  }

  Future<void> getData() async {
    await vSafeApiCall<VMyGroupInfo>(
      onLoading: () async {
        setStateLoading();
      },
      onError: (exception, trace) {
        setStateError(exception);
      },
      request: () async {
        return VChatController.I.roomApi.getGroupVMyGroupInfo(roomId: roomId);
      },
      onSuccess: (response) {
        groupInfo = response;
        setStateSuccess();
      },
      ignoreTimeoutAndNoInternet: false,
    );
  }

  @override
  void onClose() {
    txtController.dispose();
  }

  void onChangeImage() async {
    final image = await VAppPick.getCroppedImage();
    if (image != null) {
      vSafeApiCall<String>(
        onLoading: () {
          VAppAlert.showLoading(context: context, isDismissible: true);
        },
        request: () async {
          return VChatController.I.roomApi.updateGroupImage(
            roomId: roomId,
            file: image,
          );
        },
        onSuccess: (response) {
          settingsModel = settingsModel.copyWith(image: response);
          context.pop();
          update();
        },
      );
    }
  }

  void addParticipantsToGroup() async {
    final users =
        await context.toPage(const ChooseMembersView()) as List<SBaseUser>?;
    if (users != null) {
      _addGroupMembers(users.map((e) => e.id).toList());
    }
  }

  void onChangeGroupDescriptionClicked() async {
    final newTitle = await context.toPage(SingleRename(
      appbarTitle: "Update group description",
      oldValue: groupInfo.groupSettings!.desc,
      subTitle: '',
    )) as String?;
    if (newTitle == null || newTitle.toString().isEmpty) return;
    if (newTitle != settingsModel.title) {
      await vSafeApiCall<String>(
        onLoading: () {
          VAppAlert.showLoading(context: context, isDismissible: true);
        },
        request: () async {
          await VChatController.I.roomApi
              .updateGroupDescription(roomId: roomId, description: newTitle);
          return newTitle;
        },
        onSuccess: (response) {
          groupInfo = groupInfo.copyWith(
              groupSettings: groupInfo.groupSettings!.copyWith(desc: newTitle));

          update();
        },
      );
      context.pop();
    }
  }

  void muteRoomNotification() {
    vSafeApiCall<void>(
      onLoading: () {
        VAppAlert.showLoading(context: context);
      },
      request: () async {
        await VChatController.I.nativeApi.remote.room.muteRoomNotification(
          roomId: roomId,
        );
        await VChatController.I.nativeApi.local.room.updateRoomIsMuted(
          VUpdateRoomMuteEvent(
            roomId: roomId,
            isMuted: true,
          ),
        );
      },
      onSuccess: (response) {
        isMuted = !isMuted;
        context.pop();
        notifyListeners();
      },
    );
  }

  void unMuteRoomNotification() {
    vSafeApiCall<void>(
      onLoading: () {
        VAppAlert.showLoading(context: context);
      },
      request: () async {
        await VChatController.I.nativeApi.remote.room.unMuteRoomNotification(
          roomId: roomId,
        );
        await VChatController.I.nativeApi.local.room.updateRoomIsMuted(
          VUpdateRoomMuteEvent(
            roomId: roomId,
            isMuted: false,
          ),
        );
      },
      onSuccess: (response) {
        isMuted = !isMuted;
        context.pop();
        notifyListeners();
      },
    );
  }

  void onGoShowMembers() {
    context.toPage(GroupMembersView(roomId: roomId, myGroupInfo: groupInfo));
  }

  void onExitClicked() {
    context.pop();
    context.pop();
  }

  void onUpdateTitle() async {
    final newTitle = await context.toPage(SingleRename(
      appbarTitle: "Update group title",
      oldValue: settingsModel.title,
      subTitle: '',
    ));
    if (newTitle == null || newTitle.toString().isEmpty) return;
    if (newTitle != settingsModel.title) {
      await vSafeApiCall<String>(
        onLoading: () {
          VAppAlert.showLoading(context: context, isDismissible: true);
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

          update();
        },
      );
      context.pop();
    }
  }

  void _addGroupMembers(List<String> list) async {
    await vSafeApiCall<void>(
      onLoading: () {
        VAppAlert.showLoading(context: context, isDismissible: true);
      },
      request: () async {
        await VChatController.I.roomApi.addParticipantsToGroup(roomId, list);
      },
      onSuccess: (response) {
        VAppAlert.showOverlaySupport(title: "Users added successfully");
        context.pop();
      },
      onError: (exception, trace) {
        context.pop();
      },
    );
  }
}
