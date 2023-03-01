import 'package:flutter/material.dart';
import 'package:super_up/app/core/states/s_list_loading_state.dart';
import 'package:super_up/app/modules/broadcast_members/views/broadcast_members_view.dart';
import 'package:super_up/app/modules/choose_members/views/choose_members_view.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../../../core/s_base_controller.dart';

class BroadcastRoomSettingsController
    extends SLoadingController<VMyBroadcastInfo> {
  final txtController = TextEditingController();

  VToChatSettingsModel settingsModel;
  late VMyBroadcastInfo info;
  final BuildContext context;

  BroadcastRoomSettingsController(
    this.settingsModel,
    this.context,
  ) : super(SLoadingState(VMyBroadcastInfo.empty()));

  @override
  void onInit() {
    getData();
  }

  String get roomId => settingsModel.roomId;

  void onChangeImage() async {
    final image = await VAppPick.getCroppedImage();
    if (image != null) {
      vSafeApiCall<String>(
        onLoading: () {
          VAppAlert.showLoading(context: context);
        },
        request: () async {
          return VChatController.I.roomApi.updateBroadcastImage(
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

  Future<void> getData() async {
    await vSafeApiCall<VMyBroadcastInfo>(
      onLoading: () async {
        setStateLoading();
      },
      onError: (exception, trace) {
        setStateError(exception);
      },
      request: () async {
        return VChatController.I.roomApi.getBroadcastMyInfo(roomId: roomId);
      },
      onSuccess: (response) {
        info = response;
        setStateSuccess();
      },
      ignoreTimeoutAndNoInternet: false,
    );
  }

  @override
  void onClose() {
    txtController.dispose();
  }

  void onUpdateTitle() async {
    final newTitle = await context.toPage(SingleRename(
      appbarTitle: "update broadcast title",
      oldValue: settingsModel.title,
      subTitle: '',
    ));
    if (newTitle == null) return;
    if (newTitle != settingsModel.title) {
      await vSafeApiCall<String>(
        onLoading: () {
          VAppAlert.showLoading(context: context);
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

          update();
        },
      );
      context.pop();
    }
  }

  void onGoShowMembers() {
    context.toPage(BroadcastMembersView(
      roomId: roomId,
    ));
  }

  void addParticipantsToBroadcast() async {
    final users = await context.toPage(
      const ChooseMembersView(),
    ) as List<SBaseUser>?;
    if (users != null) {
      _addGroupMembers(users.map((e) => e.id).toList());
    }
  }

  void _addGroupMembers(List<String> list) async {
    await vSafeApiCall<void>(
      onLoading: () {
        VAppAlert.showLoading(context: context);
      },
      request: () async {
        await VChatController.I.roomApi
            .addParticipantsToBroadcast(roomId, list);
      },
      onSuccess: (response) {
        VAppAlert.showOverlaySupport(title: "Users added successfully");
      },
    );
    context.pop();
  }
}
