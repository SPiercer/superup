import 'package:flutter/material.dart';

import '../controllers/global_search_controller.dart';

class GlobalSearchView extends StatefulWidget {
  const GlobalSearchView({Key? key}) : super(key: key);

  @override
  State<GlobalSearchView> createState() => _GlobalSearchViewState();
}

class _GlobalSearchViewState extends State<GlobalSearchView> {
  late final GlobalSearchController controller;

  @override
  void initState() {
    super.initState();
    controller = GlobalSearchController(context);
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
        title: const Text('GlobalSearchView'),
      ),
      // body: ValueListenableBuilder<GlobalSearchController>(
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
