import 'package:flutter/material.dart';

import '../controllers/my_status_details_controller.dart';

class MyStatusDetailsView extends StatefulWidget {
  const MyStatusDetailsView({Key? key}) : super(key: key);

  @override
  State<MyStatusDetailsView> createState() => _MyStatusDetailsViewState();
}

class _MyStatusDetailsViewState extends State<MyStatusDetailsView> {
  late final MyStatusDetailsController controller;

  @override
  void initState() {
    super.initState();
    controller = MyStatusDetailsController(context);
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
        title: const Text('MyStatusDetailsView'),
      ),
      // body: ValueListenableBuilder<MyStatusDetailsController>(
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
