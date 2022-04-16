import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_broadcast_select_users_controller.dart';

class NewBroadcastSelectUsersView
    extends GetView<NewBroadcastSelectUsersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NewBroadcastSelectUsersView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NewBroadcastSelectUsersView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
