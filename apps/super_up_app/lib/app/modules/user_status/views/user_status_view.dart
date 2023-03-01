import 'package:flutter/material.dart';

import '../controllers/user_status_controller.dart';

class UserStatusView extends StatefulWidget {
  const UserStatusView({Key? key}) : super(key: key);

  @override
  State<UserStatusView> createState() => _UserStatusViewState();
}

class _UserStatusViewState extends State<UserStatusView> {
  late final UserStatusController controller;

  @override
  void initState() {
    super.initState();
    controller = UserStatusController(context);
    controller.onInit();
  }

  @override
  void dispose() {
    controller.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserStatusView'),
      ),
      // body: ValueListenableBuilder<UserStatusController>(
      //   assignId: true,
      //   builder: (logic) {
      //     return VAsyncWidgetsBuilder(
      //       loadingState: logic.loadingState,
      //       onRefresh: controller.getData,
      //       loadingWidget: () => const SLoadingWidget(),
      //       errorWidget: () => const SErrorWidget(),
      //       emptyWidget: () => const SEmptyWidget(),
      //       successWidget: () {
      //         return ListView.builder(
      //           itemBuilder: (context, index) {
      //             final item = logic.data[index];
      //             return ListTile(
      //               title: "test".text,
      //             );
      //           },
      //           itemCount: logic.data.length,
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }
}
