import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:superup/app/core/constants/app_constants.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        centerTitle: false,
        elevation: 2,
        actions: const [
          Icon(Icons.search),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
          ),
          Icon(Icons.more_vert)
        ],
        bottom: TabBar(
          isScrollable: false,
          indicatorPadding: EdgeInsets.zero,
          indicatorColor: Colors.white,
          controller: controller.controller,
          tabs: controller.tabs,
          padding: EdgeInsets.zero,
          indicatorWeight: 4,
        ),
      ),
      body: const Center(
        child: Text(
          'HomeView is working',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
