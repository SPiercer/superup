import 'package:flutter/material.dart';
import 'package:super_up/app/core/states/s_list_loading_state.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../../core/s_base_controller.dart';

class ChooseMembersController
    extends SLoadingController<List<SSelectableUser>> {
  final txtController = TextEditingController();
  final ProfileApiService profileApiService;
  final BuildContext context;

  ChooseMembersController(this.profileApiService, this.context)
      : super(SLoadingState(<SSelectableUser>[]));

  final _filterDto = UserFilterDto(
    limit: 30,
    page: 1,
  );

  @override
  void onInit() {
    getData();
  }

  Future<void> getData() async {
    await vSafeApiCall<List<SSelectableUser>>(
      onLoading: () async {
        setStateLoading();
        update();
      },
      onError: (exception, trace) {
        setStateError();
        update();
      },
      request: () async {
        final users = await profileApiService.appUsers(_filterDto);
        return users.map((e) => SSelectableUser(baseUser: e.baseUser)).toList();
      },
      onSuccess: (response) {
        setStateSuccess();
        data.addAll(response);
        update();
      },
      ignoreTimeoutAndNoInternet: false,
    );
  }

  @override
  void onClose() {
    txtController.dispose();
  }

  void onSelectUser(SSelectableUser user, bool value) {
    data.firstWhereOrNull((e) => e == user)?.isSelected = value;
    update();
  }

  void onNext() {
    if (data.firstWhereOrNull((e) => e.isSelected) == null) {
      VAppAlert.showErrorSnackBar(
        msg: "Choose at lest member",
        context: context,
      );
      return;
    }
    context
        .pop(data.where((e) => e.isSelected).map((e) => e.baseUser).toList());
  }
}
