import 'package:flutter/material.dart';

import 'package:super_up_admin/src/modules/home/widgets/home_slider.dart';
import 'package:super_up_admin/src/modules/home_tabs/notifications/notifications_page.dart';

import '../home_tabs/dashboard/dashboard_page.dart';
import '../home_tabs/settings/settings_page.dart';
import '../home_tabs/users/users_nested_navigator.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController(0);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final sidebarXController = controller.sidebarXController;
    return Builder(
      builder: (context) {
        final isSmallScreen = MediaQuery.of(context).size.width < 600;
        return Scaffold(
          key: _key,
          appBar: isSmallScreen
              ? AppBar(
                  title: Text(
                    controller.currentTab.label!,
                  ),
                  leading: IconButton(
                    onPressed: () {
                      _key.currentState?.openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  ),
                )
              : null,
          drawer: HomeSlider(
            controller: sidebarXController,
            items: controller.tabs,
          ),
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (!isSmallScreen)
                HomeSlider(
                  controller: sidebarXController,
                  items: controller.tabs,
                ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: controller,
                  builder: (_, value, __) {
                    if (value == 0) {
                      return const DashboardPage();
                    }
                    if (value == 1) {
                      return const UsersNestedNavigator();
                    }
                    if (value == 2) {
                      return const NotificationsPage();
                    }
                    if (value == 3) {
                      return const SettingsPage();
                    }
                    return const Scaffold();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
