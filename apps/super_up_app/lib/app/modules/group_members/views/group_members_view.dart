import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../controllers/group_members_controller.dart';

class GroupMembersView extends GetView<GroupMembersController> {
  const GroupMembersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group Members'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: GetBuilder<GroupMembersController>(
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
                  itemBuilder: (context, index) => SUserItem(
                    baseUser: SBaseUser.fromVChatBase(
                      controller.users[index].userData,
                    ),
                    subtitle:controller.users[index].role.name ,
                    onTap:() =>   controller.onUserTab(controller.users[index]),
                    onLongPress:() =>   controller.onUserTab(controller.users[index]),
                  ),
                  itemCount: controller.users.length,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
