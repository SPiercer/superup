import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/status_tab_controller.dart';

class StatusTabView extends GetView<StatusTabController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StatusTabView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'StatusTabView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
