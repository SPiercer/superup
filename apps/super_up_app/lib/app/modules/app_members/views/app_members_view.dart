import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../../core/states/s_list_loading_state.dart';
import '../controllers/app_members_controller.dart';

class AppMembersView extends StatefulWidget {
  const AppMembersView({Key? key}) : super(key: key);

  @override
  State<AppMembersView> createState() => _AppMembersViewState();
}

class _AppMembersViewState extends State<AppMembersView> {
  final controller = AppMembersController(GetIt.I.get<ProfileApiService>());

  @override
  void initState() {
    controller.onInit();
    super.initState();
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
        title: const Text('App Members'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: controller.onSearchPress,
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ValueListenableBuilder<SLoadingState<List<SSearchUser>>>(
        valueListenable: controller,
        builder: (_, value, __) {
          return VAsyncWidgetsBuilder(
            loadingState: value.loadingState,
            onRefresh: controller.getData,
            loadingWidget: () => const SLoadingWidget(),
            errorWidget: () => SErrorWidget(
              err: value.stateError,
            ),
            emptyWidget: () => const SEmptyWidget(),
            successWidget: () {
              return ListView.builder(
                padding: const EdgeInsets.all(3),
                itemBuilder: (context, index) {
                  final item = controller.data[index];
                  return SUserItem(
                    onTap: () => controller.onItemPress(item),
                    baseUser: item.baseUser,
                    subtitle: item.bio,
                  );
                },
                itemCount: controller.data.length,
              );
            },
          );
        },
      ),
    );
  }
}
