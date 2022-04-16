import 'package:get/get.dart';

import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/privacy_policy/bindings/privacy_policy_binding.dart';
import '../modules/auth/privacy_policy/views/privacy_policy_view.dart';
import '../modules/auth/profile_info/bindings/profile_info_binding.dart';
import '../modules/auth/profile_info/views/profile_info_view.dart';
import '../modules/auth/verify_number/bindings/verify_number_binding.dart';
import '../modules/auth/verify_number/views/verify_number_view.dart';
import '../modules/broadcast/add_users_to_broadcast/bindings/add_users_to_broadcast_binding.dart';
import '../modules/broadcast/add_users_to_broadcast/views/add_users_to_broadcast_view.dart';
import '../modules/broadcast/new_broadcast_confirm_creation/bindings/new_broadcast_confirm_creation_binding.dart';
import '../modules/broadcast/new_broadcast_confirm_creation/views/new_broadcast_confirm_creation_view.dart';
import '../modules/broadcast/new_broadcast_select_users/bindings/new_broadcast_select_users_binding.dart';
import '../modules/broadcast/new_broadcast_select_users/views/new_broadcast_select_users_view.dart';
import '../modules/broadcast/show_broadcast_users/bindings/show_broadcast_users_binding.dart';
import '../modules/broadcast/show_broadcast_users/views/show_broadcast_users_view.dart';
import '../modules/group_chat/add_users_to_group/bindings/add_users_to_group_binding.dart';
import '../modules/group_chat/add_users_to_group/views/add_users_to_group_view.dart';
import '../modules/group_chat/edit_group/bindings/edit_group_binding.dart';
import '../modules/group_chat/edit_group/views/edit_group_view.dart';
import '../modules/group_chat/group_invite_link/bindings/group_invite_link_binding.dart';
import '../modules/group_chat/group_invite_link/views/group_invite_link_view.dart';
import '../modules/group_chat/new_group_confirm_creation/bindings/new_group_confirm_creation_binding.dart';
import '../modules/group_chat/new_group_confirm_creation/views/new_group_confirm_creation_view.dart';
import '../modules/group_chat/new_group_select_users/bindings/new_group_select_users_binding.dart';
import '../modules/group_chat/new_group_select_users/views/new_group_select_users_view.dart';
import '../modules/group_chat/show_group_users/bindings/show_group_users_binding.dart';
import '../modules/group_chat/show_group_users/views/show_group_users_view.dart';
import '../modules/home_modules/calls_tab/views/calls_tab_view.dart';
import '../modules/home_modules/camera_tab/views/camera_tab_view.dart';
import '../modules/home_modules/home/bindings/home_binding.dart';
import '../modules/home_modules/home/views/home_view.dart';
import '../modules/home_modules/rooms_tab/views/rooms_tab_view.dart';
import '../modules/home_modules/status_tab/views/status_tab_view.dart';
import '../modules/link_web/bindings/link_web_binding.dart';
import '../modules/link_web/views/link_web_view.dart';
import '../modules/message_modules/message/bindings/message_binding.dart';
import '../modules/message_modules/message/views/message_view.dart';
import '../modules/message_modules/message_search/bindings/message_search_binding.dart';
import '../modules/message_modules/message_search/views/message_search_view.dart';
import '../modules/message_modules/started_messages/bindings/started_messages_binding.dart';
import '../modules/message_modules/started_messages/views/started_messages_view.dart';
import '../modules/rooms_settings/broadcast_room_settings/bindings/broadcast_room_settings_binding.dart';
import '../modules/rooms_settings/broadcast_room_settings/views/broadcast_room_settings_view.dart';
import '../modules/rooms_settings/chat_common_groups/bindings/chat_common_groups_binding.dart';
import '../modules/rooms_settings/chat_common_groups/views/chat_common_groups_view.dart';
import '../modules/rooms_settings/chat_media/bindings/chat_media_binding.dart';
import '../modules/rooms_settings/chat_media/views/chat_media_view.dart';
import '../modules/rooms_settings/group_room_settings/bindings/group_room_settings_binding.dart';
import '../modules/rooms_settings/group_room_settings/views/group_room_settings_view.dart';
import '../modules/rooms_settings/single_room_settings/bindings/single_room_settings_binding.dart';
import '../modules/rooms_settings/single_room_settings/views/single_room_settings_view.dart';
import '../modules/settings/settings_base/bindings/settings_base_binding.dart';
import '../modules/settings/settings_base/views/settings_base_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/start_chat/bindings/start_chat_binding.dart';
import '../modules/start_chat/views/start_chat_view.dart';
import '../modules/user_status/bindings/user_status_binding.dart';
import '../modules/user_status/views/user_status_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_POLICY,
      page: () => const PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_NUMBER,
      page: () => const VerifyNumberView(),
      binding: VerifyNumberBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_INFO,
      page: () => const ProfileInfoView(),
      binding: ProfileInfoBinding(),
    ),
    GetPage(
      name: _Paths.ROOMS_TAB,
      page: () => const RoomsTabView(),
    ),
    GetPage(
      name: _Paths.STATUS_TAB,
      page: () => const StatusTabView(),
    ),
    GetPage(
      name: _Paths.CALLS_TAB,
      page: () => const CallsTabView(),
    ),
    GetPage(
      name: _Paths.CAMERA_TAB,
      page: () => const CameraTabView(),
    ),
    GetPage(
      name: _Paths.MESSAGE,
      page: () => MessageView(),
      binding: MessageBinding(),
    ),
    GetPage(
      name: _Paths.SINGLE_ROOM_SETTINGS,
      page: () => const SingleRoomSettingsView(),
      binding: SingleRoomSettingsBinding(),
    ),
    GetPage(
      name: _Paths.GROUP_ROOM_SETTINGS,
      page: () => const GroupRoomSettingsView(),
      binding: GroupRoomSettingsBinding(),
    ),
    GetPage(
      name: _Paths.BROADCAST_ROOM_SETTINGS,
      page: () => const BroadcastRoomSettingsView(),
      binding: BroadcastRoomSettingsBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_MEDIA,
      page: () => ChatMediaView(),
      binding: ChatMediaBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_COMMON_GROUPS,
      page: () => ChatCommonGroupsView(),
      binding: ChatCommonGroupsBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGE_SEARCH,
      page: () => MessageSearchView(),
      binding: MessageSearchBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_GROUP,
      page: () => EditGroupView(),
      binding: EditGroupBinding(),
    ),
    GetPage(
      name: _Paths.GROUP_INVITE_LINK,
      page: () => GroupInviteLinkView(),
      binding: GroupInviteLinkBinding(),
    ),
    GetPage(
      name: _Paths.START_CHAT,
      page: () => StartChatView(),
      binding: StartChatBinding(),
    ),
    GetPage(
      name: _Paths.NEW_GROUP_SELECT_USERS,
      page: () => NewGroupSelectUsersView(),
      binding: NewGroupSelectUsersBinding(),
    ),
    GetPage(
      name: _Paths.NEW_GROUP_CONFIRM_CREATION,
      page: () => NewGroupConfirmCreationView(),
      binding: NewGroupConfirmCreationBinding(),
    ),
    GetPage(
      name: _Paths.NEW_BROADCAST_CONFIRM_CREATION,
      page: () => NewBroadcastConfirmCreationView(),
      binding: NewBroadcastConfirmCreationBinding(),
    ),
    GetPage(
      name: _Paths.NEW_BROADCAST_SELECT_USERS,
      page: () => NewBroadcastSelectUsersView(),
      binding: NewBroadcastSelectUsersBinding(),
    ),
    GetPage(
      name: _Paths.SHOW_GROUP_USERS,
      page: () => ShowGroupUsersView(),
      binding: ShowGroupUsersBinding(),
    ),
    GetPage(
      name: _Paths.ADD_USERS_TO_GROUP,
      page: () => AddUsersToGroupView(),
      binding: AddUsersToGroupBinding(),
    ),
    GetPage(
      name: _Paths.ADD_USERS_TO_BROADCAST,
      page: () => AddUsersToBroadcastView(),
      binding: AddUsersToBroadcastBinding(),
    ),
    GetPage(
      name: _Paths.SHOW_BROADCAST_USERS,
      page: () => ShowBroadcastUsersView(),
      binding: ShowBroadcastUsersBinding(),
    ),
    GetPage(
      name: _Paths.STARTED_MESSAGES,
      page: () => StartedMessagesView(),
      binding: StartedMessagesBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS_BASE,
      page: () => SettingsBaseView(),
      binding: SettingsBaseBinding(),
    ),
    GetPage(
      name: _Paths.LINK_WEB,
      page: () => LinkWebView(),
      binding: LinkWebBinding(),
    ),
    GetPage(
      name: _Paths.USER_STATUS,
      page: () => UserStatusView(),
      binding: UserStatusBinding(),
    ),
  ];
}
