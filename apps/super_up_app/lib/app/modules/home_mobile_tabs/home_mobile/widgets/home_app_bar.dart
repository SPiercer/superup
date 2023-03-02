import 'package:flutter/material.dart';
import 'package:super_up_core/super_up_core.dart';

import '../controllers/home_controller.dart';
import 'home_tab_bar.dart';

class HomeAppbar extends StatelessWidget {
  final HomeMobileController controller;

  const HomeAppbar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: const Text(SConstants.appName),
        centerTitle: false,
        elevation: 1,
        actions: [
          InkWell(
              onTap: controller.onSearchPress, child: const Icon(Icons.search)),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
          ),
          PopupMenuButton(
            onSelected: (value) {
              if (value == 'New group') {
                controller.onNewGroupClicked();
              } else if (value == 'New broadcast') {
                controller.onNewBroadcastClicked();
              } else if (value == 'web') {
                controller.onWhatsWebClicked();
              } else if (value == 'Starred messages') {
                controller.onStarredMessageClicked();
              } else if (value == 'Settings') {
                controller.onSettingsClicked();
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              const PopupMenuItem(
                value: "New group",
                child: Text("New group"),
              ),
              const PopupMenuItem(
                value: "New broadcast",
                child: Text("New broadcast"),
              ),
              const PopupMenuItem(
                value: "web",
                child: Text("${SConstants.appName} web"),
              ),
              const PopupMenuItem(
                value: "Starred messages",
                child: Text("Starred message"),
              ),
              const PopupMenuItem(
                value: "Settings",
                child: Text("Settings"),
              )
            ],
          )
        ],
        bottom: homeTabBar(controller, context));
  }
}
