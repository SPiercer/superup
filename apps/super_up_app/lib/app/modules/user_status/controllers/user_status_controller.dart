import 'package:flutter/material.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../../core/s_base_controller.dart';
import '../../../core/states/s_list_loading_state.dart';

class UserStatusController extends SLoadingController<Object> {
  final BuildContext context;

  UserStatusController(this.context) : super(SLoadingState(""));

  @override
  void onInit() {
    getData();
  }

  Future<void> getData() async {
    await vSafeApiCall<List<dynamic>>(
      onLoading: () async {
        setStateLoading();
        update();
      },
      onError: (exception, trace) {
        setStateError();
        update();
      },
      request: () async {
        await Future.delayed(const Duration(seconds: 4));
        return [];
      },
      onSuccess: (response) {
        setStateSuccess();

        update();
      },
      ignoreTimeoutAndNoInternet: false,
    );
  }

  @override
  void onClose() {}
}
