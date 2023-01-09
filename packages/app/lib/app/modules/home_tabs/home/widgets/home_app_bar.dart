import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superup/app/modules/home_tabs/home/controllers/home_controller.dart';


import '../../../../core/constants/app_constants.dart';
import 'home_tab_bar.dart';

class HomeAppbar extends GetWidget<HomeController> {
  const HomeAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: const Text(AppConstants.appName),
        centerTitle: false,
        elevation: 1,
        actions: [
          InkWell(onTap: controller.onSearchPress,child: const Icon(Icons.search)),
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
                child: Text("${AppConstants.appName} web"),
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
