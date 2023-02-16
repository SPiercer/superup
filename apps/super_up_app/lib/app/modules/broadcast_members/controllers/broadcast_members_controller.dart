import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

class BroadcastMembersController extends GetxController {
  final txtController = TextEditingController();
  VChatLoadingState loadingState = VChatLoadingState.ideal;
  final _data = <VBroadcastMember>[];
  final String roomId;

  BroadcastMembersController(this.roomId);

  List<VBroadcastMember> get data => _data;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    await vSafeApiCall<List<VBroadcastMember>>(
      onLoading: () async {
        loadingState = VChatLoadingState.loading;
        update();
      },
      onError: (exception, trace) {
        loadingState = VChatLoadingState.error;
        update();
      },
      request: () async {
        return VChatController.I.roomApi.getBroadcastMembers(roomId);
      },
      onSuccess: (response) {
        loadingState = VChatLoadingState.success;
        _data.clear();
        _data.addAll(response);
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

  Future onUserTab(VIdentifierUser user) async {
    if (user.isMe) {
      return;
    }

    final data = <ModelSheetItem<int>>[];
    data.add(ModelSheetItem(
      title: "Send message",
      id: 1,
      iconData: const Icon(PhosphorIcons.chat),
    ));
    data.add(ModelSheetItem(
      title: "Delete user",
      id: 2,
      iconData: const Icon(PhosphorIcons.trash),
    ));

    final res = await VAppAlert.showModalSheet(
      content: data,
      title: "${user.baseUser.fullName} Actions",
      context: Get.context!,
    ) as ModelSheetItem<int>?;
    if (res == null) {
      return;
    }
    if (res.id == 1) {
      if (user.isMe) {
        return;
      }
      await VChatController.I.roomApi.openChatWith(
        peerIdentifier: user.identifier,
      );
      return;
    }
    final yesOkRes = await VAppAlert.showAskYesNoDialog(
      context: Get.context!,
      title: "Are you sure?",
      content: getContent(res.id, user.baseUser.fullName),
    );
    if (yesOkRes != 1) return;
    if (res.id == 2) {
      //to member
      _kickMember(user.identifier);
    }
  }

  String getContent(int id, String fullName) {
    return "You are about to delete $fullName from your list";
  }

  void _kickMember(String identifier) async {
    await vSafeApiCall(
      onLoading: () {
        VAppAlert.showLoading(context: Get.context!, isDismissible: true);
      },
      request: () async {
        await VChatController.I.roomApi.kickBroadcastUser(
          roomId: roomId,
          peerIdentifier: identifier,
        );
      },
      onSuccess: (response) {},
      onError: (exception, trace) {
        VAppAlert.showErrorSnackBar(msg: exception, context: Get.context!);
      },
    );
    Get.back();
    await getData();
  }
}
