import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_message_page/v_chat_message_page.dart';
import 'package:v_chat_room_page/v_chat_room_page.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

class AppMembersController extends GetxController {
  final txtController = TextEditingController();
  final ProfileApiService profileApiService;
  VChatLoadingState loadingState = VChatLoadingState.ideal;
  final _data = <SSearchUser>[];

  final _filterDto = UserFilterDto(
    limit: 30,
    page: 1,
  );
  final _roomsController = VRoomController();

  AppMembersController(this.profileApiService);

  List<SSearchUser> get data => _data;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    await vSafeApiCall<List<SSearchUser>>(
      onLoading: () async {
        loadingState = VChatLoadingState.loading;
        update();
      },
      onError: (exception, trace) {
        loadingState = VChatLoadingState.error;
        update();
      },
      request: () async {
        return await profileApiService.appUsers(_filterDto);
      },
      onSuccess: (response) {
        loadingState = VChatLoadingState.success;
        data.addAll(response);
        update();
      },
      ignoreTimeoutAndNoInternet: false,
      showToastError: true,
    );
  }

  @override
  void onClose() {
    txtController.dispose();
    super.onClose();
  }

  void onSearchPress() {}

  Future onItemPress(SSearchUser item) async {
    VChatController.I.roomApi.openChatWith(
      Get.context!,
      item.baseUser.id,
    );
  }
}
