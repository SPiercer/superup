import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../controllers/broadcast_members_controller.dart';

class BroadcastMembersView extends GetView<BroadcastMembersController> {
  const BroadcastMembersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Broadcast Members'),
      ),
      body: GetBuilder<BroadcastMembersController>(
        assignId: true,
        builder: (logic) {
          return VAsyncWidgetsBuilder(
            loadingState: logic.loadingState,
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
                    onTap: () => controller.onUserTab(controller.data[index].userData),
                    baseUser: SBaseUser.fromVChatBase(
                        controller.data[index].userData),
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
