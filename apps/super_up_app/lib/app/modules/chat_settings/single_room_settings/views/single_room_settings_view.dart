import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../controllers/single_room_settings_controller.dart';

class SingleRoomSettingsView extends GetView<SingleRoomSettingsController> {
  const SingleRoomSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: controller.settingsModel.title.text,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: controller.openFullImage,
                  child: VPlatformCacheImageWidget(
                    source: VPlatformFileSource.fromUrl(
                      url: controller.settingsModel.image,
                    ),
                    fit: BoxFit.cover,
                    size: Size(context.width, 400),
                  ),
                )
              ],
            ),
            GetBuilder<SingleRoomSettingsController>(
              builder: (logic) {
                return SettingsList(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  sections: [
                    SettingsSection(
                      title: const Text('User page'),
                      tiles: <SettingsTile>[
                        SettingsTile.switchTile(
                          initialValue: logic.isMuted,
                          onToggle: logic.changeRoomNotification,
                          leading: const Icon(
                            Icons.notifications_active,
                            color: Colors.green,
                          ),
                          title: const Text('Mute notifications'),
                        ),
                        SettingsTile.navigation(
                          onPressed: (context) => logic.starMessage(context),
                          leading: const Icon(Icons.star, color: Colors.green),
                          title: const Text('star message'),
                        ),
                        SettingsTile.navigation(
                          onPressed: (context) => logic.onShowMedia(context),
                          leading: const Icon(Icons.perm_media_outlined,
                              color: Colors.green),
                          title: const Text('Show media'),
                        ),
                        SettingsTile.navigation(
                          onPressed: (context) => logic.onBlockUser(context),
                          leading: const Icon(Icons.block, color: Colors.red),
                          title: const Text('Block user'),
                        ),
                        SettingsTile.navigation(
                          onPressed: (context) => logic.onReportUser(context),
                          leading: const Icon(
                              Icons.report_gmailerrorred_rounded,
                              color: Colors.red),
                          title: const Text('Report user'),
                        ),
                      ],
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
