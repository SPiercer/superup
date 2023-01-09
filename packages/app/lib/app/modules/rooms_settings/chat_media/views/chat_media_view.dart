import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_media_controller.dart';

class ChatMediaView extends GetView<ChatMediaController> {
  const ChatMediaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatMediaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ChatMediaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
