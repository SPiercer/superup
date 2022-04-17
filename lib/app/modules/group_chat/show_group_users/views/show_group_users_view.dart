import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/show_group_users_controller.dart';

class ShowGroupUsersView extends GetView<ShowGroupUsersController> {
  const ShowGroupUsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShowGroupUsersView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ShowGroupUsersView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
