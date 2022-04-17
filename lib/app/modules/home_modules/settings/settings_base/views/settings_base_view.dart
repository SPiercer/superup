import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/settings_base_controller.dart';

class SettingsBaseView extends GetView<SettingsBaseController> {
  const SettingsBaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SettingsBaseView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SettingsBaseView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
