import 'package:flutter/material.dart';

import '../../../core/s_base_controller.dart';
import '../../../core/states/s_list_loading_state.dart';

class LinkWebController extends SLoadingController<Object> {
  final txtController = TextEditingController();
  final BuildContext context;

  LinkWebController(this.context) : super(SLoadingState(""));

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
