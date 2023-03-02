import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:super_up_core/super_up_core.dart';

import '../controllers/home_controller.dart';
import '../widgets/home_app_bar.dart';

class HomeMobileView extends StatefulWidget {
  const HomeMobileView({Key? key}) : super(key: key);

  @override
  State<HomeMobileView> createState() => _HomeMobileViewState();
}

class _HomeMobileViewState extends State<HomeMobileView>
    with TickerProviderStateMixin {
  late final HomeMobileController controller;

  @override
  void initState() {
    super.initState();
    final tabController = TabController(
      length: 4,
      initialIndex: 1,
      vsync: this,
      animationDuration: Duration.zero,
    );
    controller = HomeMobileController(
      GetIt.I.get<ProfileApiService>(),
      context,
    );
    controller.tabController = tabController;
    controller.onInit();
  }

  @override
  void dispose() {
    controller.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // if (controller.selectedRooms.isNotEmpty) {
        //   controller.clearAllSelection();
        //   return false;
        // }
        if (controller.tabIndex == 0) {
          controller.changeTab(1);
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: HomeAppbar(
            controller: controller,
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            key: const PageStorageKey("df"),
            controller: controller.tabController,
            children: controller.tabsWidgets,
          ),
        ),
      ),
    );
  }
}
