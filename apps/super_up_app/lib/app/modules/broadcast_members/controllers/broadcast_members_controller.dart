import 'package:flutter/material.dart';
import 'package:super_up/app/core/states/s_list_loading_state.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../../core/s_base_controller.dart';

class BroadcastMembersController
    extends SLoadingController<List<VBroadcastMember>> {
  final txtController = TextEditingController();
  final String roomId;
  final BuildContext context;

  BroadcastMembersController(
    this.roomId,
    this.context,
  ) : super(SLoadingState(<VBroadcastMember>[]));

  @override
  void onInit() {
    getData();
  }

  Future<void> getData() async {
    await vSafeApiCall<List<VBroadcastMember>>(
      onLoading: () async {
        setStateLoading();
      },
      onError: (exception, trace) {
        setStateError(exception);
      },
      request: () async {
        return VChatController.I.roomApi.getBroadcastMembers(roomId);
      },
      onSuccess: (response) {
        data.clear();
        data.addAll(response);
        setStateSuccess();
      },
      ignoreTimeoutAndNoInternet: false,
    );
  }

  @override
  void onClose() {
    txtController.dispose();
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
      context: context,
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
      context: context,
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
        VAppAlert.showLoading(context: context, isDismissible: true);
      },
      request: () async {
        await VChatController.I.roomApi.kickBroadcastUser(
          roomId: roomId,
          peerIdentifier: identifier,
        );
      },
      onSuccess: (response) {},
      onError: (exception, trace) {
        VAppAlert.showErrorSnackBar(msg: exception, context: context);
      },
    );
    context.pop();
    await getData();
  }
}
