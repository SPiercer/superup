import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:super_up/app/core/states/s_list_loading_state.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../controllers/calls_tab_controller.dart';
import 'call_item.dart';

class CallsTabView extends StatefulWidget {
  const CallsTabView({Key? key}) : super(key: key);

  @override
  State<CallsTabView> createState() => _CallsTabViewState();
}

class _CallsTabViewState extends State<CallsTabView> {
  late final CallsTabController controller;

  @override
  void initState() {
    super.initState();
    controller = GetIt.I.get<CallsTabController>();
    controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child: ValueListenableBuilder<SLoadingState<List<VCallHistory>>>(
            valueListenable: controller,
            builder: (_, value, __) {
              return VAsyncWidgetsBuilder(
                loadingState: value.loadingState,
                onRefresh: controller.getCalls,
                successWidget: () {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return CallItem(
                        callHistory: value.data[index],
                        onPress: () {
                          VChatController.I.roomApi.openChatWith(
                            peerIdentifier:
                                value.data[index].peerUser.identifier,
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 0,
                    ),
                    itemCount: value.data.length,
                  );
                },
              );
            }),
      ),
    );
  }
}
