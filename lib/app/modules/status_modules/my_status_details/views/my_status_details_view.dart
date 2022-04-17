import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_status_details_controller.dart';

class MyStatusDetailsView extends GetView<MyStatusDetailsController> {
  const MyStatusDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyStatusDetailsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MyStatusDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
