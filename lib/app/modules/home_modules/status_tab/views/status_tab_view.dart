import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/status_tab_controller.dart';

class StatusTabView extends GetView<StatusTabController> {
  const StatusTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'StatusTabView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
