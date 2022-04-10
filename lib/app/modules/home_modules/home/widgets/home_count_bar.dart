import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superup/app/core/constants/app_icons.dart';
import 'package:superup/app/modules/home_modules/home/controllers/home_controller.dart';

class HomeCountAppbar extends GetView<HomeController> {


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          InkWell(
            onTap: controller.clearAllSelection,
            child: Platform.isIOS
                ? const Icon(Icons.arrow_back_ios)
                : const Icon(Icons.arrow_back),
          ),
          const SizedBox(
            width: 20,
          ),
          Text("${controller.selectedRooms.length}"),
        ],
      ),
      centerTitle: false,
      automaticallyImplyLeading: false,
      elevation: 2,
      actions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
        ),
        Icon(Icons.push_pin_sharp),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
        ),
        Icon(Icons.delete),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
        ),
        Icon(Icons.volume_off_sharp),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
        ),
        AppIcons.archiveIcon,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
        ),
        Icon(Icons.more_vert),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
        ),
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
