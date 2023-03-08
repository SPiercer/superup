import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:v_chat_utils/v_chat_utils.dart';

import '../controllers/home_controller.dart';

TabBar homeTabBar(HomeMobileController controller, BuildContext context) {
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
    onTap: controller.changeTab,
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "CHATS",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            if (true) // TODO: add unread messages
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Badge(
                badgeStyle: BadgeStyle(
                  elevation: 0,
                  badgeColor: context.isDark ? Colors.green : Colors.grey,
                ),
                badgeContent: '3'.cap.color(
                      context.isDark ? Colors.black : Colors.white,
                    ),
              ),
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
