import 'package:flutter/material.dart';
import 'package:super_up/app/core/states/s_list_loading_state.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../../core/s_base_controller.dart';

class GroupMembersController extends SLoadingController<List<VGroupMember>> {
  final txtController = TextEditingController();
  final String roomId;
  final VMyGroupInfo myGroupInfo;

  GroupMembersController(this.roomId, this.myGroupInfo, this.context)
      : super(SLoadingState(<VGroupMember>[]));
  final BuildContext context;

  @override
  void onInit() {
    getData();
  }

  Future<void> getData() async {
    await vSafeApiCall<List<VGroupMember>>(
      onLoading: () async {
        setStateLoading();
      },
      onError: (exception, trace) {
        setStateError();
      },
      request: () async {
        return VChatController.I.roomApi.getGroupMembers(roomId);
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

  Future onUserTab(VGroupMember user) async {
    if (user.userData.isMe) {
      return;
    }

    final data = <ModelSheetItem<int>>[];
    data.add(ModelSheetItem(
      title: "Send message",
      id: 1,
      iconData: const Icon(PhosphorIcons.chat),
    ));
    if (myGroupInfo.isMeAdminOrSuperAdmin &&
        !user.userData.isMe &&
        user.role != VGroupMemberRole.superAdmin) {
      if (user.role == VGroupMemberRole.admin) {
        data.add(ModelSheetItem(
          title: "Dismisses to member",
          id: 2,
          iconData: const Icon(PhosphorIcons.arrowDown),
        ));
      } else {
        data.add(ModelSheetItem(
          title: "Set to admin",
          id: 3,
          iconData: const Icon(PhosphorIcons.arrowUp),
        ));
      }
      data.add(ModelSheetItem(
        title: "Kick member",
        id: 4,
        iconData: const Icon(PhosphorIcons.trash),
      ));
    }

    final res = await VAppAlert.showModalSheet(
      content: data,
      title: "${user.userData.baseUser.fullName} Actions",
      context: context,
    ) as ModelSheetItem<int>?;
    if (res == null) {
      return;
    }
    if (res.id == 1) {
      if (user.userData.isMe) {
        return;
      }
      await VChatController.I.roomApi.openChatWith(
        peerIdentifier: user.userData.identifier,
      );
      return;
    }
    final yesOkRes = await VAppAlert.showAskYesNoDialog(
      context: context,
      title: "Are you sure?",
      content: getContent(res.id, user.userData.baseUser.fullName),
    );
    if (yesOkRes != 1) return;
    if (res.id == 2) {
      //to member
      _setToMember(user.userData.identifier);
    }
    if (res.id == 3) {
      //to admin
      _setToAdmin(user.userData.identifier);
    }
    if (res.id == 4) {
      //to kick

      _kickMember(user.userData.identifier);
    }
  }

  void _setToAdmin(String identifier) async {
    await vSafeApiCall(
      request: () async {
        await VChatController.I.roomApi.changeGroupMemberRole(
          roomId: roomId,
          peerIdentifier: identifier,
          role: VGroupMemberRole.admin,
        );
      },
      onSuccess: (response) {},
      onError: (exception, trace) {
        VAppAlert.showErrorSnackBar(msg: exception, context: context);
      },
    );
    await getData();
  }

  void _setToMember(String identifier) async {
    await vSafeApiCall(
      request: () async {
        await VChatController.I.roomApi.changeGroupMemberRole(
          roomId: roomId,
          peerIdentifier: identifier,
          role: VGroupMemberRole.member,
        );
      },
      onSuccess: (response) {},
      onError: (exception, trace) {
        VAppAlert.showErrorSnackBar(msg: exception, context: context);
      },
    );
    await getData();
  }

  void _kickMember(String identifier) async {
    await vSafeApiCall(
      request: () async {
        await VChatController.I.roomApi.kickGroupUser(
          roomId: roomId,
          peerIdentifier: identifier,
        );
      },
      onSuccess: (response) {},
      onError: (exception, trace) {
        VAppAlert.showErrorSnackBar(msg: exception, context: context);
      },
    );
    await getData();
  }

  String getContent(int id, String userName) {
    if (id == 2) {
      //to member
      return "You are about to dismisses $userName to member";
    }
    if (id == 3) {
      return "You are about to upgrade $userName to admin";
      //to admin
    }
    if (id == 4) {
      return "You are about to kick $userName";
      //to kick
    }
    return "";
  }
}
