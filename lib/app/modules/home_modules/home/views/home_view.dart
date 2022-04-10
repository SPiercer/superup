import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:superup/app/core/constants/app_constants.dart';
import 'package:superup/app/modules/home_modules/home/widgets/home_count_bar.dart';

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
        return true;
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Obx(() {
            final lisCount = controller.selectedRooms.length;
            if (lisCount == 0) {
              return const HomeAppbar();
            } else {
              return HomeCountAppbar();
            }
          }),
        ),
        body: SafeArea(
          child: PageView(
            onPageChanged: (i) {
              controller.changeTab(i);
            },
            controller: controller.pageController,
            children: controller.tabsWidgets,
          ),
        ),
      ),
    );
  }
}
