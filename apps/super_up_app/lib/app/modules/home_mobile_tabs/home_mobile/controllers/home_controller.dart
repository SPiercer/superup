import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:super_up/app/core/states/s_list_loading_state.dart';
import 'package:super_up/app/modules/choose_members/views/choose_members_view.dart';
import 'package:super_up/app/modules/create_broadcast/views/create_broadcast_view.dart';
import 'package:super_up/app/modules/create_group/views/create_group_view.dart';
import 'package:super_up/app/modules/global_search/views/global_search_view.dart';
import 'package:super_up/app/modules/link_web/views/link_web_view.dart';
import 'package:super_up/app/modules/settings/views/settings_view.dart';
import 'package:super_up/app/modules/star_messages/views/star_messages_view.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_receive_share/v_chat_receive_share.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';
import 'package:v_chat_web_rtc/v_chat_web_rtc.dart';

import '../../../../core/controllers/version_checker_controller.dart';
import '../../../../core/s_base_controller.dart';
import '../../calls_tab/controllers/calls_tab_controller.dart';
import '../../calls_tab/views/calls_tab_view.dart';
import '../../camera_tab/views/camera_tab_view.dart';
import '../../rooms_tab/controllers/rooms_tab_controller.dart';
import '../../rooms_tab/views/rooms_tab_view.dart';
import '../../status_tab/controllers/status_tab_controller.dart';
import '../../status_tab/views/status_tab_view.dart';

class HomeMobileController extends SLoadingController<int> {
  late TabController tabController;

  int get tabIndex => data;
  final tabsWidgets = <Widget>[];
  final ProfileApiService profileApiService;
  final BuildContext context;

  HomeMobileController(this.profileApiService, this.context)
      : super(SLoadingState(1));

  void registerLazySingletons() {
    GetIt.I.registerLazySingleton<CallsTabController>(
      () => CallsTabController(),
    );

    GetIt.I.registerLazySingleton<StatusTabController>(
      () => StatusTabController(),
    );
    GetIt.I.registerLazySingleton<RoomsTabController>(
      () => RoomsTabController(),
    );
  }

  void unregister() {
    GetIt.I.get<RoomsTabController>().onClose();
    GetIt.I.get<CallsTabController>().onClose();
    GetIt.I.get<StatusTabController>().onClose();
    GetIt.I.unregister<CallsTabController>();
    GetIt.I.unregister<StatusTabController>();
    GetIt.I.unregister<RoomsTabController>();
  }

  @override
  void onInit() {
    registerLazySingletons();

    tabsWidgets.addAll([
      WillPopScope(
        onWillPop: () async {
          tabController.animateTo(1);
          return true;
        },
        child: const CameraTabView(),
      ),
      const RoomsTabView(),
      const StatusTabView(),
      const CallsTabView(),
    ]);
    _connectToVChatSdk();

    GetIt.I.get<VersionCheckerController>().check();
  }

  @override
  void onClose() {
    unregister();
    tabController.dispose();
  }

  void changeTab(int id) {
    tabController.index = id;
    tabController.animateTo(id);
    value.data = id;
    update();
  }

  void _connectToVChatSdk() async {
    final map = VAppPref.getMap(SStorageKeys.myProfile.name);
    await VChatController.I.profileApi.connect(
      //todo add device language
      identifier: SMyProfile.fromMap(map!).baseUser.id,
      fullName: SMyProfile.fromMap(map).baseUser.fullName,
    );
    vInitCallListener();
    vInitReceiveShareHandler();
    _setVisit();
  }

  void clearAllSelection() {
    // Get.find<RoomsTabController>().unSelectAllRoom();
  }

  void onNewGroupClicked() async {
    final users = await context.toPage(
      const ChooseMembersView(),
    ) as List<SBaseUser>?;
    if (users != null) {
      context.toPage(CreateGroupView(users: users));
    }
  }

  void onSettingsClicked() {
    context.toPage(const SettingsView());
  }

  void onStarredMessageClicked() {
    context.toPage(const StarMessagesView());
  }

  void onWhatsWebClicked() {
    context.toPage(const LinkWebView());
  }

  void onNewBroadcastClicked() async {
    final users = await context.toPage(
      const ChooseMembersView(),
    ) as List<SBaseUser>?;
    if (users != null) {
      context.toPage(CreateBroadcastView(users: users));
    }
  }

  void onSearchPress() {
    context.toPage(const GlobalSearchView());
  }

  void _setVisit() {
    vSafeApiCall(
      request: () async {
        return profileApiService.setVisit();
      },
      onSuccess: (response) {},
      ignoreTimeoutAndNoInternet: true,
    );
  }
}
