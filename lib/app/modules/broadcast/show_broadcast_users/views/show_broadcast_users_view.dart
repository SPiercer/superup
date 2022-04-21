import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/show_broadcast_users_controller.dart';

class ShowBroadcastUsersView extends GetView<ShowBroadcastUsersController> {
  const ShowBroadcastUsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShowBroadcastUsersView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ShowBroadcastUsersView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
