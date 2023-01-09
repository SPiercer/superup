import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/single_message_info_controller.dart';

class SingleMessageInfoView extends GetView<SingleMessageInfoController> {
  const SingleMessageInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleMessageInfoView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SingleMessageInfoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
