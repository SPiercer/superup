import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

class CreateGroupController extends GetxController {
  final txtController = TextEditingController();
  VChatLoadingState loadingState = VChatLoadingState.ideal;
  final _data = <dynamic>[];

  List<dynamic> get data => _data;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    await vSafeApiCall<List<dynamic>>(
      onLoading: () async {
        loadingState = VChatLoadingState.loading;
        update();
      },
      onError: (exception, trace) {
        loadingState = VChatLoadingState.error;
        update();
      },
      request: () async {
        await Future.delayed(const Duration(seconds: 4));
        return [];
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
}
