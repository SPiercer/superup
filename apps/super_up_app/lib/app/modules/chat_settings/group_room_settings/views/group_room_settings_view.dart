import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:v_chat_utils/v_chat_utils.dart';
import '../../widgets/settings_divider.dart';
import '../controllers/group_room_settings_controller.dart';

class GroupRoomSettingsView extends GetView<GroupRoomSettingsController> {
  const GroupRoomSettingsView({Key? key}) : super(key: key);

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
                GetBuilder<GroupRoomSettingsController>(
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
            GetBuilder<GroupRoomSettingsController>(
              builder: (logic) {
                return VAsyncWidgetsBuilder(
                  loadingState: logic.loadingState,
                  onRefresh: logic.getData,
                  successWidget: () {
                    bool isMeAdminOrSuper = logic.isMeAdminOrSuper;
                    return SettingsList(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      sections: [
                        SettingsSection(
                          title: const Text('Group settings'),
                          tiles: <SettingsTile>[
                            SettingsTile.navigation(
                              onPressed: (context) => logic.onUpdateTitle(),
                              leading:
                                  const Icon(Icons.edit, color: Colors.green),
                              title: const Text('Title'),
                              value: controller.settingsModel.title.text,
                            ),
                            SettingsTile.navigation(
                              title: "Description".text,
                              description: controller.getGroupDesc == null
                                  ? null
                                  : controller.getGroupDesc!.text,
                              onPressed: (context) =>
                                  logic.onChangeGroupDescriptionClicked(),
                              leading: const Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                            ),
                            SettingsTile.switchTile(
                              initialValue: logic.isMuted,
                              onToggle: logic.changeRoomNotification,
                              leading: const Icon(
                                Icons.notifications_active,
                                color: Colors.green,
                              ),
                              title: const Text('Mute notifications'),
                            ),
                            if (isMeAdminOrSuper)
                              SettingsTile.navigation(
                                onPressed: (context) =>
                                    logic.addParticipantsToGroup(),
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
                              onPressed: (context) => logic.onGoShowMembers(),
                              title:
                                  "Group Participants"
                                      .text,
                              description: "${logic.groupInfo.membersCount}".text,
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
