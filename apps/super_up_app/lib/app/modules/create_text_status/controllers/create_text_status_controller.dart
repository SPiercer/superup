import 'package:flutter/material.dart';
import 'package:super_up/app/core/s_base_controller.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

class CreateTextStatusController extends ValueNotifier
    implements SBaseController {
  final txtController = TextEditingController();
  VChatLoadingState loadingState = VChatLoadingState.ideal;
  final _data = <dynamic>[];
  final BuildContext context;

  CreateTextStatusController(this.context) : super(null);
  List<dynamic> get data => _data;

  @override
  void onInit() {}

  @override
  void onClose() {
    txtController.dispose();
  }
}
