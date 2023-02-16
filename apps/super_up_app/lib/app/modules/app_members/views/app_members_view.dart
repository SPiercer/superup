import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../controllers/app_members_controller.dart';

class AppMembersView extends GetView<AppMembersController> {
  const AppMembersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Members'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: controller.onSearchPress,
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: GetBuilder<AppMembersController>(
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
                padding: const EdgeInsets.all(3),
                itemBuilder: (context, index) {
                  final item = logic.data[index];
                  return SUserItem(
                    onTap: () => logic.onItemPress(item),
                    baseUser: item.baseUser,
                    subtitle: item.bio,
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
