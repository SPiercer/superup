import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:  FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
        actions: [
          Icon(Icons.more_horiz_rounded)
        ],
      ),
      body: Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
