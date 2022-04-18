import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/group_message_info_controller.dart';

class GroupMessageInfoView extends GetView<GroupMessageInfoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GroupMessageInfoView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'GroupMessageInfoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
