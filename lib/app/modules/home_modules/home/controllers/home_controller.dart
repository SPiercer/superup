import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superup/app/core/constants/colors.dart';
import 'package:superup/app/models/room/room.dart';
import 'package:superup/app/modules/home_modules/calls_tab/views/calls_tab_view.dart';
import 'package:superup/app/modules/home_modules/camera_tab/views/camera_tab_view.dart';
import 'package:superup/app/modules/home_modules/rooms_tab/controllers/rooms_tab_controller.dart';
import 'package:superup/app/modules/home_modules/rooms_tab/views/rooms_tab_view.dart';
import 'package:superup/app/modules/home_modules/status_tab/views/status_tab_view.dart';

import '../../../../core/widgets/colored_circle_container.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;
  final double width = 50;
  final selectedRooms = <Room>[].obs;
  final pageController = PageController(
    initialPage: 1,
    keepPage: true,
  );

  @override
  void onInit() {
    super.onInit();
    controller = TabController(
        length: 4,
        initialIndex: 1,
        vsync: this,
        animationDuration: Duration.zero);
  }

  final tabs = <Widget>[
    // you can use har any widget not Tab forced ! <Tab>[] to <Widget>[]\
    const SizedBox(
      height: 35,
      child: Icon(
        Icons.camera_alt,
      ),
    ),
    Container(
      height: 35,
      alignment: Alignment.center,
      width: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text("CHATS"),
          SizedBox(
            width: 3,
          ),
          ColoredCircleContainer(
            backgroundColor: Colors.white,
            textColor: AppColors.primaryColor,
            padding: EdgeInsets.all(4),
            text: "1",
          )
        ],
      ),
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
  final tabsWidgets = const [
    CameraTabView(),
    RoomsTabView(),
    StatusTabView(),
    CallsTabView(),
  ];

  @override
  void onClose() {
    super.onClose();
    controller.dispose();
    pageController.dispose();
  }

  void changeTab(int id) {
    clearAllSelection();
    controller.animateTo(id);
    pageController.animateToPage(
      id,
      duration: Duration.zero,
      curve: Curves.ease,
    );

    // currentTab.value = id;
    // if (id == 0) {
    //   Get.find<RoomsTabController>().isThereUnReadMessages.value = false;
    // }
  }

  void selectRoom(Room room) {
    final isContains = selectedRooms.contains(room);
    if (isContains) {
      selectedRooms.remove(room);
    } else {
      selectedRooms.add(room);
    }
  }

  void clearAllSelection() {
    selectedRooms.clear();
    Get.find<RoomsTabController>().unSelectAllRoom();
  }
}
