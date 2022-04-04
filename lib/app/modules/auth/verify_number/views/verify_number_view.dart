import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/verify_number_controller.dart';

class VerifyNumberView extends GetView<VerifyNumberController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VerifyNumberView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'VerifyNumberView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
