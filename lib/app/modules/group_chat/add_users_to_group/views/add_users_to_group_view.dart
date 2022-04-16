import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_users_to_group_controller.dart';

class AddUsersToGroupView extends GetView<AddUsersToGroupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddUsersToGroupView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AddUsersToGroupView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
