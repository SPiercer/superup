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

import '../modules/home_modules/global_search/bindings/global_search_binding.dart';
import '../modules/home_modules/global_search/views/global_search_view.dart';
import '../modules/home_modules/link_web/bindings/link_web_binding.dart';
import '../modules/home_modules/link_web/views/link_web_view.dart';
import '../modules/home_modules/settings/settings_base/bindings/settings_base_binding.dart';
import '../modules/home_modules/settings/settings_base/views/settings_base_view.dart';
import '../modules/home_modules/start_chat/bindings/start_chat_binding.dart';
import '../modules/home_modules/start_chat/views/start_chat_view.dart';
import '../modules/home_modules/started_messages/bindings/started_messages_binding.dart';
import '../modules/home_modules/started_messages/views/started_messages_view.dart';
import '../modules/home_tabs/calls_tab/views/calls_tab_view.dart';
import '../modules/home_tabs/camera_tab/views/camera_tab_view.dart';
import '../modules/home_tabs/home/bindings/home_binding.dart';
import '../modules/home_tabs/home/views/home_view.dart';
import '../modules/home_tabs/rooms_tab/views/rooms_tab_view.dart';
import '../modules/home_tabs/status_tab/views/status_tab_view.dart';
import '../modules/media_modules/get_camera_image/bindings/get_camera_image_binding.dart';
import '../modules/media_modules/get_camera_image/views/get_camera_image_view.dart';
import '../modules/media_modules/photo_viewer/bindings/photo_viewer_binding.dart';
import '../modules/media_modules/photo_viewer/views/photo_viewer_view.dart';
import '../modules/media_modules/photos_editor/bindings/photos_editor_binding.dart';
import '../modules/media_modules/photos_editor/views/photos_editor_view.dart';
import '../modules/media_modules/video_editor/bindings/video_editor_binding.dart';
import '../modules/media_modules/video_editor/views/video_editor_view.dart';
import '../modules/media_modules/video_viewer/bindings/video_viewer_binding.dart';
import '../modules/media_modules/video_viewer/views/video_viewer_view.dart';
import '../modules/message_modules/forward_message/bindings/forward_message_binding.dart';
import '../modules/message_modules/forward_message/views/forward_message_view.dart';
import '../modules/message_modules/group_message_info/bindings/group_message_info_binding.dart';
import '../modules/message_modules/group_message_info/views/group_message_info_view.dart';
import '../modules/message_modules/message/bindings/message_binding.dart';

import '../modules/message_modules/message/views/broadcast_message_screen_view.dart';
import '../modules/message_modules/message/views/group_message_screen_view.dart';
import '../modules/message_modules/message/views/one_to_one_message_view.dart';
import '../modules/message_modules/message_search/bindings/message_search_binding.dart';
import '../modules/message_modules/message_search/views/message_search_view.dart';

import '../modules/message_modules/single_message_info/bindings/single_message_info_binding.dart';
import '../modules/message_modules/single_message_info/views/single_message_info_view.dart';
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

import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/status_modules/create_text_status/bindings/create_text_status_binding.dart';
import '../modules/status_modules/create_text_status/views/create_text_status_view.dart';
import '../modules/status_modules/my_status_details/bindings/my_status_details_binding.dart';
import '../modules/status_modules/my_status_details/views/my_status_details_view.dart';
import '../modules/status_modules/user_status/bindings/user_status_binding.dart';
import '../modules/status_modules/user_status/views/user_status_view.dart';


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
      page: () => const ChatMediaView(),
      binding: ChatMediaBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_COMMON_GROUPS,
      page: () => const ChatCommonGroupsView(),
      binding: ChatCommonGroupsBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGE_SEARCH,
      page: () => const MessageSearchView(),
      binding: MessageSearchBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_GROUP,
      page: () => const EditGroupView(),
      binding: EditGroupBinding(),
    ),
    GetPage(
      name: _Paths.GROUP_INVITE_LINK,
      page: () => const GroupInviteLinkView(),
      binding: GroupInviteLinkBinding(),
    ),
    GetPage(
      name: _Paths.START_CHAT,
      page: () => const StartChatView(),
      binding: StartChatBinding(),
    ),
    GetPage(
      name: _Paths.NEW_GROUP_SELECT_USERS,
      page: () => const NewGroupSelectUsersView(),
      binding: NewGroupSelectUsersBinding(),
    ),
    GetPage(
      name: _Paths.NEW_GROUP_CONFIRM_CREATION,
      page: () => const NewGroupConfirmCreationView(),
      binding: NewGroupConfirmCreationBinding(),
    ),
    GetPage(
      name: _Paths.NEW_BROADCAST_CONFIRM_CREATION,
      page: () => const NewBroadcastConfirmCreationView(),
      binding: NewBroadcastConfirmCreationBinding(),
    ),
    GetPage(
      name: _Paths.NEW_BROADCAST_SELECT_USERS,
      page: () => const NewBroadcastSelectUsersView(),
      binding: NewBroadcastSelectUsersBinding(),
    ),
    GetPage(
      name: _Paths.SHOW_GROUP_USERS,
      page: () => const ShowGroupUsersView(),
      binding: ShowGroupUsersBinding(),
    ),
    GetPage(
      name: _Paths.ADD_USERS_TO_GROUP,
      page: () => const AddUsersToGroupView(),
      binding: AddUsersToGroupBinding(),
    ),
    GetPage(
      name: _Paths.ADD_USERS_TO_BROADCAST,
      page: () => const AddUsersToBroadcastView(),
      binding: AddUsersToBroadcastBinding(),
    ),
    GetPage(
      name: _Paths.SHOW_BROADCAST_USERS,
      page: () => const ShowBroadcastUsersView(),
      binding: ShowBroadcastUsersBinding(),
    ),
    GetPage(
      name: _Paths.STARTED_MESSAGES,
      page: () => const StartedMessagesView(),
      binding: StartedMessagesBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS_BASE,
      page: () => const SettingsBaseView(),
      binding: SettingsBaseBinding(),
    ),
    GetPage(
      name: _Paths.LINK_WEB,
      page: () => const LinkWebView(),
      binding: LinkWebBinding(),
    ),
    GetPage(
      name: _Paths.USER_STATUS,
      page: () => const UserStatusView(),
      binding: UserStatusBinding(),
    ),
    GetPage(
      name: _Paths.GLOBAL_SEARCH,
      page: () => const GlobalSearchView(),
      binding: GlobalSearchBinding(),
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
      name: _Paths.GET_CAMERA_IMAGE,
      page: () => const GetCameraImageView(),
      binding: GetCameraImageBinding(),
    ),
    GetPage(
      name: _Paths.FORWARD_MESSAGE,
      page: () => ForwardMessageView(),
      binding: ForwardMessageBinding(),
    ),
    GetPage(
      name: _Paths.SINGLE_MESSAGE_INFO,
      page: () => SingleMessageInfoView(),
      binding: SingleMessageInfoBinding(),
    ),
    GetPage(
      name: _Paths.GROUP_MESSAGE_INFO,
      page: () => GroupMessageInfoView(),
      binding: GroupMessageInfoBinding(),
    ),
    GetPage(
      name: _Paths.PHOTO_VIEWER,
      page: () => PhotoViewerView(),
      binding: PhotoViewerBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO_VIEWER,
      page: () => VideoViewerView(),
      binding: VideoViewerBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO_EDITOR,
      page: () => VideoEditorView(),
      binding: VideoEditorBinding(),
    ),
    GetPage(
      name: _Paths.PHOTOS_EDITOR,
      page: () => PhotosEditorView(),
      binding: PhotosEditorBinding(),
    ),
    GetPage(
      name: _Paths.ONE_TO_ONE_MESSAGE,
      page: () => const OneToOneMessageView(),
      binding: MessageBinding(),
    ),
    GetPage(
      name: _Paths.GROUP_MESSAGE_SCREEN,
      page: () => const GroupMessageScreenView(),
      binding: MessageBinding(),
    ),
    GetPage(
      name: _Paths.BROADCAST_MESSAGE_SCREEN,
      page: () => const BroadcastMessageScreenView(),
      binding: MessageBinding(),
    ),
  ];
}
