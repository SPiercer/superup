import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_common_groups_controller.dart';

class ChatCommonGroupsView extends GetView<ChatCommonGroupsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatCommonGroupsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ChatCommonGroupsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
