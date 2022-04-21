import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_broadcast_confirm_creation_controller.dart';

class NewBroadcastConfirmCreationView
    extends GetView<NewBroadcastConfirmCreationController> {
  const NewBroadcastConfirmCreationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewBroadcastConfirmCreationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NewBroadcastConfirmCreationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
