import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_group_confirm_creation_controller.dart';

class NewGroupConfirmCreationView
    extends GetView<NewGroupConfirmCreationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NewGroupConfirmCreationView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NewGroupConfirmCreationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
