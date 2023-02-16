import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../widgets/home_app_bar.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // if (controller.selectedRooms.isNotEmpty) {
        //   controller.clearAllSelection();
        //   return false;
        // }
        if (controller.tabIndex.value == 0) {
          controller.changeTab(1);
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: HomeAppbar(
            controller: controller,
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            key: const PageStorageKey("df"),
            controller: controller.tabController,
            children: controller.tabsWidgets,
          ),
        ),
      ),
    );
  }
}
