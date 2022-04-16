import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_group_controller.dart';

class EditGroupView extends GetView<EditGroupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditGroupView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EditGroupView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
