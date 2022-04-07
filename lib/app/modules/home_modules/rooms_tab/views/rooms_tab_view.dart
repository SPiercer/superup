import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rooms_tab_controller.dart';

class RoomsTabView extends GetView<RoomsTabController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RoomsTabView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RoomsTabView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
