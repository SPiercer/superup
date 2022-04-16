import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/show_broadcast_users_controller.dart';

class ShowBroadcastUsersView extends GetView<ShowBroadcastUsersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShowBroadcastUsersView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ShowBroadcastUsersView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
