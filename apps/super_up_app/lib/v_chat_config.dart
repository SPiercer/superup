import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_firebase_fcm/v_chat_firebase_fcm.dart';
import 'package:v_chat_message_page/v_chat_message_page.dart';
import 'package:v_chat_one_signal/v_chat_one_signal.dart';
import 'package:v_chat_room_page/v_chat_room_page.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';
import 'package:v_chat_web_rtc/v_chat_web_rtc.dart';

import 'app/routes/app_pages.dart';

Future initVChat(GlobalKey<NavigatorState> navigatorKey) async {
  await VChatController.init(
    navigatorKey: navigatorKey,
    vChatConfig: VChatConfig(
      encryptHashKey: kDebugMode
          ? "V_CHAT_SDK_V2_VERY_STRONG_KEY"
          : dotenv.env['encryptHashKey']!,
      baseUrl: SConstants.vChatBaseUrl,
      vPush: VPush(
        enableVForegroundNotification: true,
        vPushConfig: const VLocalNotificationPushConfig(),
        fcmProvider: VPlatforms.isWeb ? null : VChatFcmProver(),
        oneSignalProvider: VPlatforms.isWeb
            ? null
            : VChatOneSignalProver(
                appId: dotenv.env['oneSignalKey']!,
              ),
      ),
    ),
    vMessagePageConfig: VMessagePageConfig(
      googleMapsApiKey: dotenv.env['googleMapsApiKey'],
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
          Get.toNamed(Routes.GROUP_ROOM_SETTINGS, arguments: data);
        },
        toSingleSettings: (context, identifier) {},
        toBroadcastSettings: (context, data) {
          Get.toNamed(Routes.BROADCAST_ROOM_SETTINGS, arguments: data);
        },
        toUserProfilePage: (context, identifier) {},
      ),
    ),
  );
}
