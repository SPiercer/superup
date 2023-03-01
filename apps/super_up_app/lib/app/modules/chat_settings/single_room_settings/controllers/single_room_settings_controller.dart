import 'package:flutter/material.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../../../core/s_base_controller.dart';

class SingleRoomSettingsController extends ValueNotifier
    implements SBaseController {
  final VToChatSettingsModel settingsModel;
  final BuildContext context;

  SingleRoomSettingsController(this.settingsModel, this.context) : super(null);

  bool isMuted = true;

  String get roomId => settingsModel.roomId;

  @override
  void onInit() {
    isMuted = settingsModel.room.isMuted;
    getData();
  }

  void changeRoomNotification(bool value) {
    vSafeApiCall<bool>(
      onLoading: () {
        VAppAlert.showLoading(context: context);
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
        context.pop();
        notifyListeners();
      },
    );
  }

  Future<void> getData() async {
    // await vSafeApiCall<List<dynamic>>(
    //   onLoading: () async {
    //     setStateLoading();
    //     update();
    //   },
    //   onError: (exception, trace) {
    //     setStateError();
    //     update();
    //   },
    //   request: () async {
    //     await Future.delayed(const Duration(seconds: 4));
    //     return [];
    //   },
    //   onSuccess: (response) {
    //     setStateSuccess();
    //     update();
    //   },
    //   ignoreTimeoutAndNoInternet: false,
    // );
  }

  @override
  void onClose() {}

  void openFullImage() {
    context.toPage(VImageViewer(
      platformFileSource: VPlatformFileSource.fromUrl(url: settingsModel.image),
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
