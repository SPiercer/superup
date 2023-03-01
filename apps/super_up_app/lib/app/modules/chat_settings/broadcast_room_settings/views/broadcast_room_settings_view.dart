import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:super_up/app/core/states/s_list_loading_state.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../controllers/broadcast_room_settings_controller.dart';

class BroadcastRoomSettingsView extends StatefulWidget {
  final VToChatSettingsModel settingsModel;

  const BroadcastRoomSettingsView({Key? key, required this.settingsModel})
      : super(key: key);

  @override
  State<BroadcastRoomSettingsView> createState() =>
      _BroadcastRoomSettingsViewState();
}

class _BroadcastRoomSettingsViewState extends State<BroadcastRoomSettingsView> {
  late final BroadcastRoomSettingsController controller;

  @override
  void initState() {
    super.initState();
    controller = BroadcastRoomSettingsController(widget.settingsModel, context);
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
              children: [
                ValueListenableBuilder<SLoadingState<VMyBroadcastInfo>>(
                  valueListenable: controller,
                  builder: (_, ___, __) {
                    return VPlatformCacheImageWidget(
                      source: VPlatformFileSource.fromUrl(
                        url: controller.settingsModel.image,
                      ),
                      fit: BoxFit.cover,
                      size: Size(context.mediaQuerySize.width, 400),
                    );
                  },
                ),
                PositionedDirectional(
                  end: 20,
                  bottom: 20,
                  child: InkWell(
                    onTap: controller.onChangeImage,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green.withOpacity(.5),
                      ),
                      child: const Icon(
                        PhosphorIcons.cameraFill,
                        size: 30,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ValueListenableBuilder<SLoadingState<VMyBroadcastInfo>>(
              valueListenable: controller,
              builder: (_, value, __) {
                return VAsyncWidgetsBuilder(
                  loadingState: value.loadingState,
                  onRefresh: controller.getData,
                  successWidget: () {
                    return SettingsList(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      sections: [
                        SettingsSection(
                          title: const Text('Broadcast settings'),
                          tiles: <SettingsTile>[
                            SettingsTile.navigation(
                              onPressed: (context) =>
                                  controller.onUpdateTitle(),
                              leading:
                                  const Icon(Icons.edit, color: Colors.green),
                              title: const Text('Title'),
                              value: controller.settingsModel.title.text,
                            ),
                            SettingsTile.navigation(
                              onPressed: (context) =>
                                  controller.addParticipantsToBroadcast(),
                              title: "Add Participants".text,
                              leading: const Icon(
                                Icons.group_add,
                                color: Colors.green,
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.green,
                              ),
                            ),
                            SettingsTile.navigation(
                              onPressed: (context) =>
                                  controller.onGoShowMembers(),
                              title: "Broadcast Participants".text,
                              description: "${controller.info.totalUsers}".text,
                              leading: const Icon(
                                PhosphorIcons.users,
                                color: Colors.green,
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
