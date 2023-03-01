import 'package:flutter/material.dart';
import 'package:super_up/app/core/states/s_list_loading_state.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../controllers/broadcast_members_controller.dart';

class BroadcastMembersView extends StatefulWidget {
  final String roomId;

  const BroadcastMembersView({Key? key, required this.roomId})
      : super(key: key);

  @override
  State<BroadcastMembersView> createState() => _BroadcastMembersViewState();
}

class _BroadcastMembersViewState extends State<BroadcastMembersView> {
  late final BroadcastMembersController controller;

  @override
  void initState() {
    super.initState();
    controller = BroadcastMembersController(widget.roomId, context);
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
        title: const Text('Broadcast Members'),
      ),
      body: ValueListenableBuilder<SLoadingState<List<VBroadcastMember>>>(
        valueListenable: controller,
        builder: (_, value, __) {
          return VAsyncWidgetsBuilder(
            loadingState: value.loadingState,
            onRefresh: controller.getData,
            loadingWidget: () => const SLoadingWidget(),
            errorWidget: () => const SErrorWidget(),
            emptyWidget: () => const SEmptyWidget(),
            successWidget: () {
              return ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                padding: const EdgeInsets.only(top: 15),
                itemBuilder: (context, index) {
                  return SUserItem(
                    onTap: () =>
                        controller.onUserTab(value.data[index].userData),
                    baseUser:
                        SBaseUser.fromVChatBase(value.data[index].userData),
                  );
                },
                itemCount: value.data.length,
              );
            },
          );
        },
      ),
    );
  }
}
