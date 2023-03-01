import 'package:flutter/material.dart';
import 'package:super_up/app/core/states/s_list_loading_state.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../../core/s_base_controller.dart';

class AppMembersController extends SLoadingController<List<SSearchUser>> {
  final txtController = TextEditingController();
  final ProfileApiService profileApiService;

  final _filterDto = UserFilterDto(
    limit: 30,
    page: 1,
  );

  AppMembersController(
    this.profileApiService,
  ) : super(SLoadingState([]));

  @override
  void onInit() {
    getData();
  }

  Future<void> getData() async {
    await vSafeApiCall<List<SSearchUser>>(
      onLoading: () async {
        setStateLoading();
      },
      onError: (exception, trace) {
        setStateError(exception);
      },
      request: () async {
        return await profileApiService.appUsers(_filterDto);
      },
      onSuccess: (response) {
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

  void onSearchPress() {}

  Future onItemPress(SSearchUser item) async {
    VChatController.I.roomApi.openChatWith(
      peerIdentifier: item.baseUser.id,
    );
  }
}
