import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_broadcast_select_users_controller.dart';

class NewBroadcastSelectUsersView
    extends GetView<NewBroadcastSelectUsersController> {
  const NewBroadcastSelectUsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewBroadcastSelectUsersView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NewBroadcastSelectUsersView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
