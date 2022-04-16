import 'dart:io';
import 'package:camera_with_files/camera_with_files.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superup/app/models/room/room.dart';
import 'package:superup/app/modules/home_modules/calls_tab/views/calls_tab_view.dart';
import 'package:superup/app/modules/home_modules/camera_tab/views/camera_tab_view.dart';
import 'package:superup/app/modules/home_modules/rooms_tab/controllers/rooms_tab_controller.dart';
import 'package:superup/app/modules/home_modules/rooms_tab/views/rooms_tab_view.dart';
import 'package:superup/app/modules/home_modules/status_tab/views/status_tab_view.dart';
import 'package:superup/app/routes/app_pages.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final selectedRooms = <Room>[].obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      length: 4,
      initialIndex: 1,
      vsync: this,
    );
    tabController.addListener(() async {
      final int id = tabController.index;
      clearAllSelection();
      if (id == 0) {
        await Navigator.of(Get.context!).push(
          MaterialPageRoute<List<File>>(
            builder: (BuildContext context) => const CameraApp(
              isMultiple: true,
            ),
          ),
        );
        tabController.animateTo(1);
      } else {
        tabController.animateTo(id);
      }
    });
  }

  final tabsWidgets = const [
    CameraTabView(),
    RoomsTabView(),
    StatusTabView(),
    CallsTabView(),
  ];

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }

  void changeTab(int id) {}

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

  void onNewGroupClicked() {
    Get.toNamed(Routes.NEW_GROUP_SELECT_USERS);
  }

  void onSettingsClicked() {
    Get.toNamed(Routes.SETTINGS_BASE);
  }

  void onStarredMessageClicked() {
    Get.toNamed(Routes.STARTED_MESSAGES);
  }

  void onWhatsWebClicked() {
    Get.toNamed(Routes.LINK_WEB);
  }

  void onNewBroadcastClicked() {
    Get.toNamed(Routes.NEW_BROADCAST_SELECT_USERS);
  }
}
