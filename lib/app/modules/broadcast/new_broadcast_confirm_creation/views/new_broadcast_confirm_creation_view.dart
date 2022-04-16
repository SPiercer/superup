import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_broadcast_confirm_creation_controller.dart';

class NewBroadcastConfirmCreationView
    extends GetView<NewBroadcastConfirmCreationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NewBroadcastConfirmCreationView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NewBroadcastConfirmCreationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
