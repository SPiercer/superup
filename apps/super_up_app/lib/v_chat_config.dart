import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:super_up/app/modules/chat_settings/broadcast_room_settings/views/broadcast_room_settings_view.dart';
import 'package:super_up/app/modules/chat_settings/group_room_settings/views/group_room_settings_view.dart';
import 'package:super_up/app/modules/chat_settings/single_room_settings/views/single_room_settings_view.dart';
import 'package:super_up/app/modules/peer_profile/views/peer_profile_view.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_firebase_fcm/v_chat_firebase_fcm.dart';
import 'package:v_chat_message_page/v_chat_message_page.dart';
import 'package:v_chat_one_signal/v_chat_one_signal.dart';
import 'package:v_chat_room_page/v_chat_room_page.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';
import 'package:v_chat_web_rtc/v_chat_web_rtc.dart';

Future initVChat(GlobalKey<NavigatorState> navigatorKey) async {
  await VChatController.init(
    navigatorKey: navigatorKey,
    vChatConfig: VChatConfig(
      googleMapsApiKey: dotenv.env['googleMapsApiKey'],
      encryptHashKey: !kDebugMode
          ? "V_CHAT_SDK_V2_VERY_STRONG_KEY"
          : dotenv.env['encryptHashKey']!,
      baseUrl: SConstants.vChatBaseUrl,
      vPush: VPush(
        enableVForegroundNotification: true,
        vPushConfig: const VLocalNotificationPushConfig(),
        fcmProvider: VChatFcmProver(),
        oneSignalProvider: VChatOneSignalProver(
          appId: dotenv.env['oneSignalKey']!,
        ),
      ),
    ),
    vNavigator: VNavigator(
      roomNavigator: vDefaultRoomNavigator,
      callNavigator: vDefaultCallNavigator,
      messageNavigator: VMessageNavigator(
        toImageViewer: vDefaultMessageNavigator.toImageViewer,
        toViewChatMedia: vDefaultMessageNavigator.toViewChatMedia,
        toVideoPlayer: vDefaultMessageNavigator.toVideoPlayer,
        toSingleChatMessageInfo:
            vDefaultMessageNavigator.toSingleChatMessageInfo,
        toMessagePage: vDefaultMessageNavigator.toMessagePage,
        toBroadcastChatMessageInfo:
            vDefaultMessageNavigator.toBroadcastChatMessageInfo,
        toGroupChatMessageInfo: vDefaultMessageNavigator.toGroupChatMessageInfo,
        toGroupSettings: (context, data) {
          context.toPage(GroupRoomSettingsView(settingsModel: data));
        },
        toSingleSettings: (context, data, identifier) {
          context.toPage(SingleRoomSettingsView(settingsModel: data));
        },
        toBroadcastSettings: (context, data) {
          context.toPage(BroadcastRoomSettingsView(settingsModel: data));
        },
        toUserProfilePage: (context, identifier) {
          context.toPage(PeerProfileView(identifier: identifier));
        },
      ),
    ),
  );
}
