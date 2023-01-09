import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/start_chat_controller.dart';

class StartChatView extends GetView<StartChatController> {
  const StartChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StartChatView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'StartChatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
