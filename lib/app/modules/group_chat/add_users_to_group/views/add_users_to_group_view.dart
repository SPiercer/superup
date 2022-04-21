import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_users_to_group_controller.dart';

class AddUsersToGroupView extends GetView<AddUsersToGroupController> {
  const AddUsersToGroupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddUsersToGroupView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddUsersToGroupView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
