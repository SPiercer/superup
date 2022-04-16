import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/start_chat_controller.dart';

class StartChatView extends GetView<StartChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StartChatView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'StartChatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
