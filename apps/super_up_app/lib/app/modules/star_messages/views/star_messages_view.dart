import 'package:flutter/material.dart';

import '../controllers/star_messages_controller.dart';

class StarMessagesView extends StatefulWidget {
  const StarMessagesView({Key? key}) : super(key: key);

  @override
  State<StarMessagesView> createState() => _StarMessagesViewState();
}

class _StarMessagesViewState extends State<StarMessagesView> {
  late final StarMessagesController controller;

  @override
  void initState() {
    super.initState();
    controller = StarMessagesController(context);
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
        title: const Text('StarMessagesView'),
      ),
      // body: ValueListenableBuilder<StarMessagesController>(
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
