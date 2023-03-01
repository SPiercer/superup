import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:super_up/app/core/states/s_list_loading_state.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../controllers/choose_members_controller.dart';

class ChooseMembersView extends StatefulWidget {
  const ChooseMembersView({Key? key}) : super(key: key);

  @override
  State<ChooseMembersView> createState() => _ChooseMembersViewState();
}

class _ChooseMembersViewState extends State<ChooseMembersView> {
  late final ChooseMembersController controller;

  @override
  void initState() {
    super.initState();
    controller =
        ChooseMembersController(GetIt.I.get<ProfileApiService>(), context);
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
      floatingActionButton: FloatingActionButton(
        onPressed: controller.onNext,
        child: const Icon(Icons.send),
      ),
      appBar: AppBar(
        title: const Text('ChooseMembersView'),
      ),
      body: ValueListenableBuilder<SLoadingState<List<SSelectableUser>>>(
        valueListenable: controller,
        builder: (_, value, ___) {
          return VAsyncWidgetsBuilder(
            loadingState: value.loadingState,
            onRefresh: controller.getData,
            loadingWidget: () => const SLoadingWidget(),
            errorWidget: () => const SErrorWidget(),
            emptyWidget: () => const SEmptyWidget(),
            successWidget: () {
              return ListView.builder(
                padding: const EdgeInsets.all(5),
                itemBuilder: (context, index) {
                  final item = value.data[index];
                  return CheckboxListTile(
                    onChanged: (value) =>
                        controller.onSelectUser(item, value ?? false),
                    value: item.isSelected,
                    title: Row(
                      children: [
                        VCircleAvatar(fullUrl: item.baseUser.userImage),
                        const SizedBox(
                          width: 15,
                        ),
                        item.baseUser.fullName.text,
                      ],
                    ),
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
