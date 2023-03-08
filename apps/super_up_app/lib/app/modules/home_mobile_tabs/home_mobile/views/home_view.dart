import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:super_up/app/modules/create_text_status/views/create_text_status_view.dart';
import 'package:super_up/app/modules/home_mobile_tabs/home_mobile/widgets/expandable_fab.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

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
        animationDuration: const Duration(milliseconds: 100));
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
        if (controller.tabIndex == 0) {
          controller.changeTab(1);
          return false;
        }
        return true;
      },
      child: Scaffold(
        floatingActionButton: ValueListenableBuilder(
          valueListenable: controller,
          builder: (_, __, ___) {
            if (controller.tabController.index == 0 || controller.tabController.index == 3) {
              return const SizedBox.shrink();
            }
            return ExpandableFab(
              key: controller.fabKey,
              backgroundColor: AppColors.buttonBackground,
              onPressed: controller.fabAction,
              smallButton: FloatingActionButton.small(
                onPressed: () => context.toPage(const CreateTextStatusView()),
                child: const Icon(Icons.edit),
              ),
              child: Icon(
                controller.fabIcon,
                color: Colors.white,
              ),
            );
          },
        ),
        appBar: HomeAppbar(controller: controller),
        body: SafeArea(
          child: TabBarView(
            controller: controller.tabController,
            children: controller.tabsWidgets,
          ),
        ),
      ),
    );
  }
}
