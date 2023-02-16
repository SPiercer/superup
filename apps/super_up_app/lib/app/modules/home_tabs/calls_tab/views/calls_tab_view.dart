import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_up_core/super_up_core.dart';

import '../controllers/calls_tab_controller.dart';

class CallsTabView extends GetView<CallsTabController> {
  const CallsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.buttonBackground,
          onPressed: () {},
          child: Icon(
            Icons.add_call,
            color: Colors.white,
          ),
        ),
        body: Text("call tab"));
  }
}
