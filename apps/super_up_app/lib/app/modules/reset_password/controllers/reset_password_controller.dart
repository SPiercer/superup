import 'package:flutter/material.dart';
import 'package:super_up/app/core/s_base_controller.dart';

class ResetPasswordController implements SBaseController {
  final txtController = TextEditingController();

  ResetPasswordController(this.context);

  final BuildContext context;

  @override
  void onInit() {}

  @override
  void onClose() {
    txtController.dispose();
  }
}
