import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/message_search_controller.dart';

class MessageSearchView extends GetView<MessageSearchController> {
  const MessageSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MessageSearchView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MessageSearchView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
