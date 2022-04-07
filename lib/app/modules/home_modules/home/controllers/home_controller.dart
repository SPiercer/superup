import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;
  final double width = 50;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: 4, vsync: this);
  }

  final tabs = <Widget>[
    // you can use har any widget not Tab forced ! <Tab>[] to <Widget>[]\
    Container(
      height: 35,


      child: const Icon(
        Icons.camera_alt,
      ),
    ),
    Container(
      width: 100,
      height: 35,
      alignment: Alignment.center,
      child: const Text("CHATS"),
    ),
    Container(
      width: 100,
      height: 35,
      alignment: Alignment.center,
      child: const Text("STATUS"),
    ),
    Container(
      width: 100,
      height: 35,
      alignment: Alignment.center,
      child: const Text("CALL"),
    ),
  ];

  @override
  void onClose() {
    super.onClose();
    controller.dispose();
  }
}
