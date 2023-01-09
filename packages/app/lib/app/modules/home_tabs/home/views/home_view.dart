import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superup/app/modules/home_tabs/home/widgets/home_count_bar.dart';

import '../controllers/home_controller.dart';
import '../widgets/home_app_bar.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.selectedRooms.isNotEmpty) {
          controller.clearAllSelection();
          return false;
        }
        if (controller.tabIndex.value == 0) {
          controller.changeTab(1);
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Obx(() {
            final lisCount = controller.selectedRooms.length;
            // final index = controller.tabIndex.value;
            // if (index == 0) {
            //   return const SizedBox();
            // }
            if (lisCount == 0) {
              return const HomeAppbar();
            } else {
              return const HomeCountAppbar();
            }
          }),
        ),
        body: SafeArea(
          child: TabBarView(
            controller: controller.tabController,
            physics: const BouncingScrollPhysics(),
            children: controller.tabsWidgets,
          ),
        ),
      ),
    );
  }
}