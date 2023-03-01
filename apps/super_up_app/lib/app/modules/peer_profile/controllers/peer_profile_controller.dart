import 'package:flutter/material.dart';
import 'package:super_up/app/core/states/s_list_loading_state.dart';

import '../../../core/s_base_controller.dart';

class PeerProfileController extends SLoadingController<Object> {
  final String identifier;
  final BuildContext context;

  PeerProfileController(this.identifier, this.context)
      : super(SLoadingState("data"));

  @override
  void onClose() {
    // TODO: implement onClose
  }

  @override
  void onInit() {
    // TODO: implement onInit
  }
}
