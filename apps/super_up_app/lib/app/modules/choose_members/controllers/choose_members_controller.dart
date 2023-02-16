import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

class ChooseMembersController extends GetxController {
  final txtController = TextEditingController();
  VChatLoadingState loadingState = VChatLoadingState.ideal;
  final _data = <SSelectableUser>[];
  final ProfileApiService profileApiService;

  ChooseMembersController(this.profileApiService);

  List<SSelectableUser> get data => _data;
  final _filterDto = UserFilterDto(
    limit: 30,
    page: 1,
  );

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    await vSafeApiCall<List<SSelectableUser>>(
      onLoading: () async {
        loadingState = VChatLoadingState.loading;
        update();
      },
      onError: (exception, trace) {
        loadingState = VChatLoadingState.error;
        update();
      },
      request: () async {
        final users = await profileApiService.appUsers(_filterDto);
        return users.map((e) => SSelectableUser(baseUser: e.baseUser)).toList();
      },
      onSuccess: (response) {
        loadingState = VChatLoadingState.success;
        data.addAll(response);
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

  void onSelectUser(SSelectableUser user, bool value) {
    _data.firstWhereOrNull((e) => e == user)?.isSelected = value;
    update();
  }

  void onNext() {
    if (_data.firstWhereOrNull((e) => e.isSelected) == null) {
      VAppAlert.showErrorSnackBar(
        msg: "Choose at lest member",
        context: Get.context!,
      );
      return;
    }
    Get.back(result: _data.where((e) => e.isSelected).map((e) => e.baseUser).toList());
  }
}
