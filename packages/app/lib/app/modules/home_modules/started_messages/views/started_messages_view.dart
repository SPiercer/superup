import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/started_messages_controller.dart';

class StartedMessagesView extends GetView<StartedMessagesController> {
  const StartedMessagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StartedMessagesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'StartedMessagesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
