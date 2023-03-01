import 'package:flutter/material.dart';

import '../controllers/link_web_controller.dart';

class LinkWebView extends StatefulWidget {
  const LinkWebView({Key? key}) : super(key: key);

  @override
  State<LinkWebView> createState() => _LinkWebViewState();
}

class _LinkWebViewState extends State<LinkWebView> {
  late final LinkWebController controller;

  @override
  void initState() {
    super.initState();
    controller = LinkWebController(context);
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
        title: const Text('LinkWebView'),
      ),
      // body: ValueListenableBuilder<LinkWebController>(
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
