import 'package:flutter/material.dart';
import 'package:super_up/app/core/states/s_list_loading_state.dart';

import '../../../core/s_base_controller.dart';

class MyStatusDetailsController extends SLoadingController<Object> {
  final txtController = TextEditingController();
  final BuildContext context;

  MyStatusDetailsController(
    this.context,
  ) : super(SLoadingState(""));

  @override
  void onInit() {
    getData();
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
    //     data.addAll(response);
    //     update();
    //   },
    //   ignoreTimeoutAndNoInternet: false,
    // );
  }

  @override
  void onClose() {
    txtController.dispose();
  }
}
