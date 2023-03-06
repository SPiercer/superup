import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../controllers/single_room_settings_controller.dart';

class SingleRoomSettingsView extends StatefulWidget {
  const SingleRoomSettingsView({Key? key, required this.settingsModel})
      : super(key: key);
  final VToChatSettingsModel settingsModel;
  @override
  State<SingleRoomSettingsView> createState() => _SingleRoomSettingsViewState();
}

class _SingleRoomSettingsViewState extends State<SingleRoomSettingsView> {
  late final SingleRoomSettingsController controller;

  @override
  void initState() {
    super.initState();
    controller = SingleRoomSettingsController(widget.settingsModel, context);
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
      appBar: AppBar(
        title: controller.settingsModel.title.text,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                InkWell(
                  onTap: controller.openFullImage,
                  child: VPlatformCacheImageWidget(
                    source: VPlatformFileSource.fromUrl(
                      url: controller.settingsModel.image,
                    ),
                    fit: BoxFit.cover,
                    size: const Size(700, 400),
                  ),
                )
              ],
            ),
            ValueListenableBuilder(
              valueListenable: controller,
              builder: (_, __, ___) {
                return SettingsList(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  sections: [
                    SettingsSection(
                      title: const Text('User page'),
                      tiles: <SettingsTile>[
                        SettingsTile.switchTile(
                          initialValue: controller.isMuted,
                          onToggle: controller.changeRoomNotification,
                          leading: const Icon(
                            Icons.notifications_active,
                            color: Colors.green,
                          ),
                          title: const Text('Mute notifications'),
                        ),
                        SettingsTile.navigation(
                          onPressed: (context) =>
                              controller.starMessage(context),
                          leading: const Icon(Icons.star, color: Colors.green),
                          title: const Text('star message'),
                        ),
                        SettingsTile.navigation(
                          onPressed: (context) =>
                              controller.onShowMedia(context),
                          leading: const Icon(Icons.perm_media_outlined,
                              color: Colors.green),
                          title: const Text('Show media'),
                        ),
                        SettingsTile.navigation(
                          onPressed: (context) =>
                              controller.onBlockUser(context),
                          leading: const Icon(Icons.block, color: Colors.red),
                          title: const Text('Block user'),
                        ),
                        SettingsTile.navigation(
                          onPressed: (context) =>
                              controller.onReportUser(context),
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
