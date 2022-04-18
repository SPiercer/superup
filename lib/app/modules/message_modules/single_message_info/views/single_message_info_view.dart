import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/single_message_info_controller.dart';

class SingleMessageInfoView extends GetView<SingleMessageInfoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SingleMessageInfoView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SingleMessageInfoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
