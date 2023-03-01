import 'package:flutter/material.dart';
import 'package:super_up/app/core/states/s_list_loading_state.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../controllers/group_members_controller.dart';

class GroupMembersView extends StatefulWidget {
  const GroupMembersView(
      {Key? key, required this.roomId, required this.myGroupInfo})
      : super(key: key);
  final String roomId;
  final VMyGroupInfo myGroupInfo;

  @override
  State<GroupMembersView> createState() => _GroupMembersViewState();
}

class _GroupMembersViewState extends State<GroupMembersView> {
  late final GroupMembersController controller;

  @override
  void initState() {
    super.initState();
    controller =
        GroupMembersController(widget.roomId, widget.myGroupInfo, context);
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
        title: const Text('Group Members'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: ValueListenableBuilder<SLoadingState<List<VGroupMember>>>(
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
                  itemBuilder: (context, index) => SUserItem(
                    baseUser: SBaseUser.fromVChatBase(
                      value.data[index].userData,
                    ),
                    subtitle: value.data[index].role.name,
                    onTap: () => controller.onUserTab(value.data[index]),
                    onLongPress: () => controller.onUserTab(value.data[index]),
                  ),
                  itemCount: value.data.length,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
