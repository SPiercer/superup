import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forward_message_controller.dart';

class ForwardMessageView extends GetView<ForwardMessageController> {
  const ForwardMessageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ForwardMessageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ForwardMessageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
