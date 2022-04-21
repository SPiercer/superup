import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/global_search_controller.dart';

class GlobalSearchView extends GetView<GlobalSearchController> {
  const GlobalSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GlobalSearchView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GlobalSearchView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
