import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_users_to_broadcast_controller.dart';

class AddUsersToBroadcastView extends GetView<AddUsersToBroadcastController> {
  const AddUsersToBroadcastView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddUsersToBroadcastView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddUsersToBroadcastView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
