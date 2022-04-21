import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/link_web_controller.dart';

class LinkWebView extends GetView<LinkWebController> {
  const LinkWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LinkWebView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LinkWebView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
