import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/link_web_controller.dart';

class LinkWebView extends GetView<LinkWebController> {
  const LinkWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LinkWebView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LinkWebView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
