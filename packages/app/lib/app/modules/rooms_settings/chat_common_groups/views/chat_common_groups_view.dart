import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_common_groups_controller.dart';

class ChatCommonGroupsView extends GetView<ChatCommonGroupsController> {
  const ChatCommonGroupsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatCommonGroupsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ChatCommonGroupsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
