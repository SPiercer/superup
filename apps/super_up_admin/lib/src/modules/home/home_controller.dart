import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class HomeController extends ValueNotifier<int> {
  SidebarXItem get currentTab {
    return tabs[sidebarXController.selectedIndex];
  }

  final tabs = <SidebarXItem>[
    const SidebarXItem(
      icon: Icons.home,
      label: 'Dashboard',
    ),
    const SidebarXItem(
      icon: Icons.people,
      label: 'Users',
    ),
    const SidebarXItem(
      icon: Icons.notification_add,
      label: 'Notifications',
    ),
    const SidebarXItem(
      icon: Icons.settings,
      label: 'Settings',
    ),
    // const SidebarXItem(
    //   icon: Icons.exit_to_app,
    //   label: 'Logout',
    // ),
  ];
  final sidebarXController = SidebarXController(
    selectedIndex: 0,
    extended: true,
  );

  HomeController(super._value) {
    sidebarXController.addListener(() {
      value = sidebarXController.selectedIndex;
    });
  }
}
