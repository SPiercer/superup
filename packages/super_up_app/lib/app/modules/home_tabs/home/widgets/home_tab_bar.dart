import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../controllers/home_controller.dart';

TabBar homeTabBar(HomeController controller, BuildContext context) {
  final orjWidth = MediaQuery.of(context).size.width;
  final cameraWidth = orjWidth / 20;
  final yourWidth = (orjWidth - cameraWidth) / 5;
  return TabBar(
    indicator: const UnderlineTabIndicator(
      borderSide: BorderSide(width: 3, color: Colors.green),
    ),
    labelPadding: EdgeInsets.symmetric(
      horizontal: (orjWidth - (cameraWidth + yourWidth * 3)) / 8.5,
      vertical: 4,
    ),
    isScrollable: true,
    onTap: (value) {
      controller.changeTab(value);
    },
    controller: controller.tabController,
    tabs: [
      Container(
        width: cameraWidth,
        alignment: Alignment.centerLeft,
        child: const Icon(
          Icons.camera_alt,
        ),
      ),
      Container(
        width: yourWidth,
        alignment: Alignment.center,
        child: Row(
          children: [
            const Text(
              "CHATS",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 4,
            ),
            Badge(
              elevation: 0,
              badgeContent: '3'.cap.color(
                    context.isDark ? Colors.black : Colors.white,
                  ),
              badgeColor: context.isDark ? Colors.green : Colors.grey,
            ),
          ],
        ),
      ),
      Container(
        width: yourWidth,
        alignment: Alignment.center,
        child: const Text(
          "STATUS",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        width: yourWidth,
        alignment: Alignment.center,
        child: const Text(
          "CALLS",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ],
    indicatorWeight: 4,
  );
}
