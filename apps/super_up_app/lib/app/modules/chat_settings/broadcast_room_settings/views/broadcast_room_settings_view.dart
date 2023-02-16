import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../widgets/settings_divider.dart';
import '../controllers/broadcast_room_settings_controller.dart';

class BroadcastRoomSettingsView
    extends GetView<BroadcastRoomSettingsController> {
  const BroadcastRoomSettingsView({Key? key}) : super(key: key);

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
                GetBuilder<BroadcastRoomSettingsController>(
                  assignId: true,
                  builder: (logic) {
                    return VPlatformCacheImageWidget(
                      source: VPlatformFileSource.fromUrl(
                        url: controller.settingsModel.image,
                      ),
                      fit: BoxFit.cover,
                      size: Size(context.width, 400),
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
            GetBuilder<BroadcastRoomSettingsController>(
              builder: (logic) {
                return VAsyncWidgetsBuilder(
                  loadingState: logic.loadingState,
                  onRefresh: logic.getData,
                  successWidget: () {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        ListTile(
                          title: "Title".text,
                          subtitle: controller.settingsModel.title.text,
                          onTap: logic.onUpdateTitle,
                          leading: const Icon(Icons.edit, color: Colors.green),
                        ),
                        const SettingsDivider(),
                        ListTile(
                          onTap: logic.onGoShowMembers,
                          title:
                              "Broadcast Participants ${logic.info.totalUsers}"
                                  .text,
                          leading: const Icon(
                            PhosphorIcons.users,
                            color: Colors.green,
                          ),
                          trailing: const Icon(
                            PhosphorIcons.dotsNine,
                            color: Colors.green,
                          ),
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
