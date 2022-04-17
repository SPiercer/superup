import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_text_status_controller.dart';

class CreateTextStatusView extends GetView<CreateTextStatusController> {
  const CreateTextStatusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CreateTextStatusView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CreateTextStatusView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
