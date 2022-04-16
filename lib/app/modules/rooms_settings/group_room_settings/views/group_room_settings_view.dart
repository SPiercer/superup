import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:textless/textless.dart';

import '../../../../core/constants/colors.dart';
import '../../common/chat_icon_with_text.dart';
import '../../common/settings_divider.dart';
import '../../common/sliver_header.dart';
import '../controllers/group_room_settings_controller.dart';

class GroupRoomSettingsView extends GetView<GroupRoomSettingsController> {
  const GroupRoomSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverHeader(
              peerImage: controller.room.thumbImage,
              onImagePress: () {},
              actions: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                ),
                PopupMenuButton(
                  onSelected: (value) {
                    if (value == 'Add participants') {
                      controller.addParticipants();
                    } else if (value == 'Change Subject') {
                      controller.onChangeSubjectClicked();
                    } else if (value == 'Group settings') {
                      controller.onGroupSettings();
                    }
                  },
                  icon: const Icon(
                    Icons.more_vert_outlined,
                    color: AppColors.accentColor,
                  ),
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuItem<String>>[
                    const PopupMenuItem(
                      value: "Add participants",
                      enabled: true,
                      child: Text("Add participants"),
                    ),
                    const PopupMenuItem(
                      value: "Change Subject",
                      enabled: true,
                      child: Text("Change Subject"),
                    ),
                    const PopupMenuItem(
                      value: "Group settings",
                      enabled: true,
                      child: Text("Group settings"),
                    ),
                  ],
                )
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Center(
                    child: Column(
                      children: [
                        controller.room.title.h5,
                        const SizedBox(
                          height: 7,
                        ),
                        "Group 2 participants"
                            .b1
                            .color(AppColors.buttonBackground),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.zero,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ChatIconWithText(
                              title: "Audio",
                              icon: Icons.call,
                              onPress: controller.onStartVoiceCallClicked,
                            ),
                            ChatIconWithText(
                              title: "Video",
                              icon: Icons.video_call,
                              onPress: controller.onStartVideoCallClicked,
                            ),
                            ChatIconWithText(
                              title: 'Add',
                              icon: Icons.group_add,
                              onPress: controller.onAddClicked,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                  const SettingsDivider(),
                  ListTile(
                    title: "Add group description".text,
                    subtitle: "Created by you at July 3,2020".text,
                    onTap: controller.onChangeGroupDescriptionClicked,
                  ),
                  const SettingsDivider(),
                  ListTile(
                    onTap: controller.onChangeNotificationsClicked,
                    leading: const Icon(Icons.notifications),
                    title: "Mute notifications".text,
                    trailing: Switch(
                      onChanged: (value) {},
                      value: false,
                    ),
                  ),
                  ListTile(
                    onTap: controller.onGroupSettings,
                    leading: const Icon(Icons.settings),
                    title: "Group settings".text,
                  ),
                  const SettingsDivider(),
                  ListTile(
                    onTap: controller.onShowMediaClicked,
                    title: "Media, links, and docs 📁".text,
                    subtitle: "Show all".text,
                    leading: const Icon(Icons.file_copy),
                  ),
                  const SettingsDivider(),
                  ListTile(
                    onTap: controller.addParticipants,
                    title: "Add participants".text,
                    leading: const Icon(Icons.group_add),
                  ),
                  ListTile(
                    onTap: controller.onLinkInviteClicked,
                    title: "Invite via link".text,
                    leading: const Icon(Icons.link),
                  ),
                  ListTile(
                    onTap: controller.onShowUsersClicked,
                    title: "Group participants (2)".text,
                    subtitle: "Show all".text,
                    leading: const Icon(Icons.supervised_user_circle_outlined),
                  ),
                  const SettingsDivider(),
                  ListTile(
                    onTap: controller.onExitClicked,
                    title: "Exit group".text.color(Colors.red),
                    leading: const Icon(
                      Icons.exit_to_app,
                      color: Colors.red,
                    ),
                  ),
                  ListTile(
                    onTap: controller.onReportUserClicked,
                    title: "Report group".text.color(Colors.red),
                    leading: const Icon(
                      Icons.thumb_down,
                      color: Colors.red,
                    ),
                  ),
                  const SettingsDivider(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
