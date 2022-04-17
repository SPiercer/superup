import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_users_to_broadcast_controller.dart';

class AddUsersToBroadcastView extends GetView<AddUsersToBroadcastController> {
  const AddUsersToBroadcastView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddUsersToBroadcastView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AddUsersToBroadcastView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
