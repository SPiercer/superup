import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../calls_tab/views/calls_tab_view.dart';
import '../../camera_tab/views/camera_tab_view.dart';
import '../../rooms_tab/views/rooms_tab_view.dart';
import '../../status_tab/views/status_tab_view.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final tabIndex = 1.obs;
  final tabsWidgets = <Widget>[];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      length: 4,
      initialIndex: 1,
      vsync: this,
      animationDuration: Duration.zero,
    );

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

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }

  void changeTab(int id) {
    tabController.index = id;
    tabController.animateTo(id);
    tabIndex.value = id;
  }

  void clearAllSelection() {
    // Get.find<RoomsTabController>().unSelectAllRoom();
  }

  void onNewGroupClicked() {
    Get.toNamed(Routes.CREATE_GROUP);
  }

  void onSettingsClicked() {
    Get.toNamed(Routes.SETTINGS);
  }

  void onStarredMessageClicked() {
    Get.toNamed(Routes.STAR_MESSAGES);
  }

  void onWhatsWebClicked() {
    Get.toNamed(Routes.LINK_WEB);
  }

  void onNewBroadcastClicked() {
    Get.toNamed(Routes.CREATE_GROUP);
  }

  void onSearchPress() {
    Get.toNamed(Routes.GLOBAL_SEARCH);
  }
}
