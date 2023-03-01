import 'package:flutter/material.dart';
import 'package:super_up/app/core/s_base_controller.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

class GlobalSearchController extends ValueNotifier implements SBaseController {
  final txtController = TextEditingController();
  VChatLoadingState loadingState = VChatLoadingState.ideal;
  final _data = <dynamic>[];
  final BuildContext context;

  GlobalSearchController(this.context) : super(null);
  List<dynamic> get data => _data;

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
    //
    // );
  }

  @override
  void onClose() {
    txtController.dispose();
  }
}
