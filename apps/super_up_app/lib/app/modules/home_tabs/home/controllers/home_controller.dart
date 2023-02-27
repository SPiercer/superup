import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_up_core/super_up_core.dart';
 import 'package:v_chat_utils/v_chat_utils.dart';
import 'package:v_chat_web_rtc/v_chat_web_rtc.dart';

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
  final ProfileApiService profileApiService;

  HomeController(this.profileApiService);

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
    vInitCallListener();
    // vInitReceiveShareHandler();
    _setVisit();
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

  void onNewGroupClicked() async {
    final users = await Get.toNamed(
      Routes.CHOOSE_MEMBERS,
    ) as List<SBaseUser>?;
    if (users != null) {
      Get.toNamed(Routes.CREATE_GROUP, arguments: users);
    }
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

  void onNewBroadcastClicked() async {
    final users = await Get.toNamed(
      Routes.CHOOSE_MEMBERS,
    ) as List<SBaseUser>?;
    if (users != null) {
      Get.toNamed(Routes.CREATE_BROADCAST, arguments: users);
    }
  }

  void onSearchPress() {
    Get.toNamed(Routes.GLOBAL_SEARCH);
  }

  void _setVisit() {
    vSafeApiCall(
      request: () async {
        return profileApiService.setVisit();
      },
      onSuccess: (response) {},
      ignoreTimeoutAndNoInternet: true,
    );
  }
}
