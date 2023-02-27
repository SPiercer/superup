import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../controllers/calls_tab_controller.dart';
import 'call_item.dart';

class CallsTabView extends GetView<CallsTabController> {
  const CallsTabView({Key? key}) : super(key: key);

  @override
  StatelessElement createElement() {
    controller.getCalls();
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child: GetBuilder<CallsTabController>(builder: (logic) {
          return VAsyncWidgetsBuilder(
            loadingState: logic.state,
            onRefresh: logic.getCalls,
            successWidget: () {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return CallItem(
                    callHistory: logic.calls[index],
                    onPress: () {
                      VChatController.I.roomApi.openChatWith(
                        peerIdentifier: logic.calls[index].peerUser.identifier,
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 0,
                ),
                itemCount: logic.calls.length,
              );
            },
          );
        }),
      ),
    );
  }
}
