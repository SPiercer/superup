import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/calls_tab_controller.dart';

class CallsTabView extends GetView<CallsTabController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CallsTabView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CallsTabView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
