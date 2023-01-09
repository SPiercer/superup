import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_group_select_users_controller.dart';

class NewGroupSelectUsersView extends GetView<NewGroupSelectUsersController> {
  const NewGroupSelectUsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewGroupSelectUsersView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NewGroupSelectUsersView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}