import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_up_core/super_up_core.dart';

import '../controllers/home_controller.dart';
import 'home_tab_bar.dart';

class HomeCountAppbar extends GetView<HomeController> {
  const HomeCountAppbar({Key? key}) : super(key: key);

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
          Text("0"),
        ],
      ),
      centerTitle: false,
      automaticallyImplyLeading: false,
      elevation: 1,
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
      bottom: homeTabBar(controller, context),
    );
  }
}
