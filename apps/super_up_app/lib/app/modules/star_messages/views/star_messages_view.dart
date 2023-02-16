import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../controllers/star_messages_controller.dart';

class StarMessagesView extends GetView<StarMessagesController> {
  const StarMessagesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StarMessagesView'),
      ),
      body: GetBuilder<StarMessagesController>(
        assignId: true,
        builder: (logic) {
          return VAsyncWidgetsBuilder(
            loadingState: logic.loadingState,
            onRefresh: controller.getData,
            loadingWidget: () => const SLoadingWidget(),
            errorWidget: () => const SErrorWidget(),
            emptyWidget: () => const SEmptyWidget(),
            successWidget: () {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final item = logic.data[index];
                  return ListTile(
                    title: "test".text,
                  );
                },
                itemCount: logic.data.length,
              );
            },
          );
        },
      ),
    );
  }
}
