import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_group_select_users_controller.dart';

class NewGroupSelectUsersView extends GetView<NewGroupSelectUsersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NewGroupSelectUsersView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NewGroupSelectUsersView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
