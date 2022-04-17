import 'dart:io';
import 'package:camera_with_files/camera_with_files.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superup/app/models/room/room.dart';

import 'package:superup/app/routes/app_pages.dart';

import '../../calls_tab/views/calls_tab_view.dart';
import '../../camera_tab/views/camera_tab_view.dart';
import '../../rooms_tab/controllers/rooms_tab_controller.dart';
import '../../rooms_tab/views/rooms_tab_view.dart';
import '../../status_tab/views/status_tab_view.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final selectedRooms = <Room>[].obs;
  final tabIndex = 1.obs;

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
      tabIndex.value = id;
      clearAllSelection();
      tabController.animateTo(id);
    });
    tabsWidgets.addAll([
      WillPopScope(
        onWillPop: () async {
          tabController.animateTo(1);
          return true;
        },
        child: const CameraTabView(),
      ),
      const RoomsTabView(),
      const StatusTabView(),
      const CallsTabView(),
    ]);
  }

  final tabsWidgets = <Widget>[];

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }

  void changeTab(int id) {
    tabController.animateTo(id);
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

  void onSearchPress() {
    Get.toNamed(Routes.GLOBAL_SEARCH);
  }
}
