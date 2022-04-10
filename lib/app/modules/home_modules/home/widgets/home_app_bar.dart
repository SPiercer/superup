import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superup/app/modules/home_modules/home/controllers/home_controller.dart';

import '../../../../core/constants/app_constants.dart';

class HomeAppbar extends GetWidget<HomeController> {
  const HomeAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(AppConstants.appName),
      centerTitle: false,
      elevation: 2,
      actions: const [
        Icon(Icons.search),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
        ),
        Icon(Icons.more_vert)
      ],
      bottom: TabBar(
        isScrollable: false,
        indicatorPadding: EdgeInsets.zero,
        labelPadding: EdgeInsets.zero,
        indicatorColor: Colors.white,
        controller: controller.controller,
        tabs: controller.tabs,
        padding: EdgeInsets.zero,
        indicatorWeight: 4,
        onTap: (i) {
          controller.changeTab(i);
        },
      ),
    );
  }
}
