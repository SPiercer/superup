import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/camera_tab_controller.dart';

class CameraTabView extends GetView<CameraTabController> {
  const CameraTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text(
          'CameraTabView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
