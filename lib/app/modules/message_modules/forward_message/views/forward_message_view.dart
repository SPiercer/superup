import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forward_message_controller.dart';

class ForwardMessageView extends GetView<ForwardMessageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ForwardMessageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ForwardMessageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
