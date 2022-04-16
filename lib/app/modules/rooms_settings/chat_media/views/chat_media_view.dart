import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_media_controller.dart';

class ChatMediaView extends GetView<ChatMediaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatMediaView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ChatMediaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
