import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_info_controller.dart';

class ProfileInfoView extends GetView<ProfileInfoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfileInfoView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ProfileInfoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
