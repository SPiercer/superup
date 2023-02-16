import 'package:get/get.dart';

import '../modules/app_members/bindings/app_members_binding.dart';
import '../modules/app_members/views/app_members_view.dart';
import '../modules/broadcast_members/bindings/broadcast_members_binding.dart';
import '../modules/broadcast_members/views/broadcast_members_view.dart';
import '../modules/chat_settings/broadcast_room_settings/bindings/broadcast_room_settings_binding.dart';
import '../modules/chat_settings/broadcast_room_settings/views/broadcast_room_settings_view.dart';
import '../modules/chat_settings/group_room_settings/views/group_room_settings_view.dart';
import '../modules/chat_settings/single_room_settings/views/single_room_settings_view.dart';
import '../modules/choose_members/bindings/choose_members_binding.dart';
import '../modules/choose_members/views/choose_members_view.dart';
import '../modules/create_broadcast/bindings/create_broadcast_binding.dart';
import '../modules/create_broadcast/views/create_broadcast_view.dart';
import '../modules/create_group/bindings/create_group_binding.dart';
import '../modules/create_group/views/create_group_view.dart';
import '../modules/create_text_status/bindings/create_text_status_binding.dart';
import '../modules/create_text_status/views/create_text_status_view.dart';
import '../modules/forget_password/bindings/forget_password_binding.dart';
import '../modules/forget_password/views/forget_password_view.dart';
import '../modules/global_search/bindings/global_search_binding.dart';
import '../modules/global_search/views/global_search_view.dart';
import '../modules/group_members/bindings/group_members_binding.dart';
import '../modules/group_members/views/group_members_view.dart';
import '../modules/chat_settings/group_room_settings/bindings/group_room_settings_binding.dart';
 import '../modules/home_tabs/home/bindings/home_binding.dart';
import '../modules/home_tabs/home/views/home_view.dart';
import '../modules/link_web/bindings/link_web_binding.dart';
import '../modules/link_web/views/link_web_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/my_status_details/bindings/my_status_details_binding.dart';
import '../modules/my_status_details/views/my_status_details_view.dart';
import '../modules/privacy_policy/bindings/privacy_policy_binding.dart';
import '../modules/privacy_policy/views/privacy_policy_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/chat_settings/single_room_settings/bindings/single_room_settings_binding.dart';
 import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/star_messages/bindings/star_messages_binding.dart';
import '../modules/star_messages/views/star_messages_view.dart';
import '../modules/user_status/bindings/user_status_binding.dart';
import '../modules/user_status/views/user_status_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
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
      name: _Paths.FORGET_PASSWORD,
      page: () => const ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHOOSE_MEMBERS,
      page: () => const ChooseMembersView(),
      binding: ChooseMembersBinding(),
    ),
    GetPage(
      name: _Paths.GROUP_MEMBERS,
      page: () => const GroupMembersView(),
      binding: GroupMembersBinding(),
    ),
    GetPage(
      name: _Paths.BROADCAST_MEMBERS,
      page: () => const BroadcastMembersView(),
      binding: BroadcastMembersBinding(),
    ),
    GetPage(
      name: _Paths.APP_MEMBERS,
      page: () => const AppMembersView(),
      binding: AppMembersBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_GROUP,
      page: () => const CreateGroupView(),
      binding: CreateGroupBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_BROADCAST,
      page: () => const CreateBroadcastView(),
      binding: CreateBroadcastBinding(),
    ),
    GetPage(
      name: _Paths.GLOBAL_SEARCH,
      page: () => const GlobalSearchView(),
      binding: GlobalSearchBinding(),
    ),
    GetPage(
      name: _Paths.LINK_WEB,
      page: () => const LinkWebView(),
      binding: LinkWebBinding(),
    ),
    GetPage(
      name: _Paths.STAR_MESSAGES,
      page: () => const StarMessagesView(),
      binding: StarMessagesBinding(),
    ),
    GetPage(
      name: _Paths.BROADCAST_ROOM_SETTINGS,
      page: () => const BroadcastRoomSettingsView(),
      binding: BroadcastRoomSettingsBinding(),
    ),
    GetPage(
      name: _Paths.GROUP_ROOM_SETTINGS,
      page: () => const GroupRoomSettingsView(),
      binding: GroupRoomSettingsBinding(),
    ),
    GetPage(
      name: _Paths.SINGLE_ROOM_SETTINGS,
      page: () => const SingleRoomSettingsView(),
      binding: SingleRoomSettingsBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_TEXT_STATUS,
      page: () => const CreateTextStatusView(),
      binding: CreateTextStatusBinding(),
    ),
    GetPage(
      name: _Paths.MY_STATUS_DETAILS,
      page: () => const MyStatusDetailsView(),
      binding: MyStatusDetailsBinding(),
    ),
    GetPage(
      name: _Paths.USER_STATUS,
      page: () => const UserStatusView(),
      binding: UserStatusBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
