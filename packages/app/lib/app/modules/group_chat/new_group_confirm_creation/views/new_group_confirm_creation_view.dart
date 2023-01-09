import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_group_confirm_creation_controller.dart';

class NewGroupConfirmCreationView
    extends GetView<NewGroupConfirmCreationController> {
  const NewGroupConfirmCreationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewGroupConfirmCreationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NewGroupConfirmCreationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
