import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../../../core/states/s_list_loading_state.dart';
import '../controllers/group_room_settings_controller.dart';

class GroupRoomSettingsView extends StatefulWidget {
  final VToChatSettingsModel settingsModel;
  const GroupRoomSettingsView({Key? key, required this.settingsModel})
      : super(key: key);

  @override
  State<GroupRoomSettingsView> createState() => _GroupRoomSettingsViewState();
}

class _GroupRoomSettingsViewState extends State<GroupRoomSettingsView> {
  late final GroupRoomSettingsController controller;

  @override
  void initState() {
    super.initState();
    controller = GroupRoomSettingsController(widget.settingsModel, context);
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
                ValueListenableBuilder<SLoadingState<VMyGroupInfo>>(
                  valueListenable: controller,
                  builder: (_, value, __) {
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
            ValueListenableBuilder<SLoadingState<VMyGroupInfo>>(
              valueListenable: controller,
              builder: (_, value, __) {
                return VAsyncWidgetsBuilder(
                  loadingState: value.loadingState,
                  onRefresh: controller.getData,
                  successWidget: () {
                    bool isMeAdminOrSuper = controller.isMeAdminOrSuper;
                    return SettingsList(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      sections: [
                        SettingsSection(
                          title: const Text('Group settings'),
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
                              title: "Description".text,
                              description: controller.getGroupDesc == null
                                  ? null
                                  : controller.getGroupDesc!.text,
                              onPressed: (context) =>
                                  controller.onChangeGroupDescriptionClicked(),
                              leading: const Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                            ),
                            SettingsTile.switchTile(
                              initialValue: controller.isMuted,
                              onToggle: controller.changeRoomNotification,
                              leading: const Icon(
                                Icons.notifications_active,
                                color: Colors.green,
                              ),
                              title: const Text('Mute notifications'),
                            ),
                            if (isMeAdminOrSuper)
                              SettingsTile.navigation(
                                onPressed: (context) =>
                                    controller.addParticipantsToGroup(),
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
                              title: "Group Participants".text,
                              description:
                                  "${controller.groupInfo.membersCount}".text,
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
