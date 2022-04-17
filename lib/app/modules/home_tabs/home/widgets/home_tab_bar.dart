import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/colored_circle_container.dart';
import '../controllers/home_controller.dart';

TabBar homeTabBar(HomeController controller, BuildContext context) {
  double orjWidth = MediaQuery.of(context).size.width;
  double cameraWidth = orjWidth / 20;
  double yourWidth = (orjWidth - cameraWidth) / 5;
  return TabBar(
    indicator: const UnderlineTabIndicator(
      borderSide: BorderSide(width: 3, color: Color(0xFFFFFFFF)),
    ),
    labelPadding: EdgeInsets.symmetric(
        horizontal: (orjWidth - (cameraWidth + yourWidth * 3)) / 8.5,
        vertical: 4),
    isScrollable: true,
    indicatorColor: Colors.white,
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
          children: const [
            Text(
              "CHATS",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 5,
            ),
            ColoredCircleContainer(
              backgroundColor: Colors.white,
              textColor: AppColors.primaryColor,
              padding: EdgeInsets.all(4),
              text: "1",
            )
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
