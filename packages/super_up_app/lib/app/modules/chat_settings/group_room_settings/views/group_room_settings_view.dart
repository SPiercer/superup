import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        actions: [
          // PopupMenuButton(
          //   itemBuilder: (context) {
          //     return [
          //       PopupMenuItem(
          //         onTap: controller.onUpdateTitle,
          //         child: "Change title".text,
          //       )
          //     ];
          //   },
          // )
        ],
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
            const SizedBox(
              height: 10,
            ),
            GetBuilder<GroupRoomSettingsController>(
              builder: (logic) {
                return VAsyncWidgetsBuilder(
                  loadingState: logic.loadingState,
                  onRefresh: logic.getData,
                  successWidget: () {
                    bool isMeAdminOrSuper = logic.isMeAdminOrSuper;
                    return Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        ListTile(
                          leading: const Icon(
                            PhosphorIcons.notificationFill,
                            color: Colors.green,
                          ),
                          title: "Mute notifications".text,
                          trailing: Switch.adaptive(
                            value: logic.isMuted,
                            onChanged: logic.changeRoomNotification,
                          ),
                        ),
                        const SettingsDivider(),
                        ListTile(
                          title: "Title".text,
                          subtitle: controller.settingsModel.title.text,
                          onTap: logic.onUpdateTitle,
                          leading: const Icon(Icons.edit, color: Colors.green),
                        ),
                        const SettingsDivider(),
                        ListTile(
                          title: "Description".text,
                          subtitle: controller.getGroupDesc == null
                              ? null
                              : controller.getGroupDesc!.text,
                          onTap: logic.onChangeGroupDescriptionClicked,
                          leading: const Icon(
                            Icons.edit,
                            color: Colors.green,
                          ),
                        ),
                        if (isMeAdminOrSuper)
                          Column(
                            children: [
                              const SettingsDivider(),
                              ListTile(
                                onTap: logic.addParticipantsToGroup,
                                title: "Add Participants".text,
                                leading: const Icon(
                                  Icons.group_add,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        const SettingsDivider(),
                        ListTile(
                          onTap: logic.onGoShowMembers,
                          title:
                              "Group Participants ${logic.groupInfo.membersCount}"
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
                        const SettingsDivider(),
                        ListTile(
                          onTap: controller.onExitClicked,
                          title: "Exit Group".text.color(Colors.red),
                          leading: const Icon(
                            Icons.transit_enterexit_sharp,
                            color: Colors.red,
                          ),
                          subtitle: "Leave and delete the group".text,
                        ),
                        const SettingsDivider(),
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
