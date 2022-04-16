import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:textless/textless.dart';

import '../../../../core/constants/colors.dart';
import '../../common/chat_icon_with_text.dart';
import '../../common/settings_divider.dart';
import '../../common/sliver_header.dart';
import '../controllers/single_room_settings_controller.dart';

class SingleRoomSettingsView extends GetView<SingleRoomSettingsController> {
  const SingleRoomSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverHeader(
              peerImage: controller.room.thumbImage,
              onImagePress: () {
                print("xx");
              },
              actions: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                ),
                PopupMenuButton(
                  icon: const Icon(
                    Icons.more_vert_outlined,
                    color: AppColors.accentColor,
                  ),
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuItem<String>>[
                    PopupMenuItem(
                      value: "Share",
                      child: const Text("Share"),
                      onTap: () {
                        controller.onShareClicked();
                      },
                    ),
                    PopupMenuItem(
                      value: "Edit",
                      onTap: () {
                        controller.onEditClicked();
                      },
                      child: const Text("Edit"),
                    ),
                    PopupMenuItem(
                      value: "View in address book",
                      onTap: () {
                        controller.onViewInAddressBookClicked();
                      },
                      child: const Text("View in address book"),
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
                        "+201012309598".h5.color(AppColors.buttonBackground),
                        const SizedBox(
                          height: 7,
                        ),
                        "online".text,
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
                              title: 'Search',
                              icon: Icons.search,
                              onPress: controller.onSearchClicked,
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
                    title: "Flutter and Node js developer".text,
                    subtitle: "July 3,2020".text,
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
                    onTap: controller.onChangeNotificationsClicked,
                    leading: const Icon(Icons.notifications),
                    title: "Mute notifications".text,
                    trailing: Switch(
                      onChanged: (value) {},
                      value: false,
                    ),
                  ),
                  const SettingsDivider(),
                  ListTile(
                    onTap: controller.onShowGroupsClicked,
                    title: "Show common Groups".text,
                    subtitle: "Show all".text,
                    leading: const Icon(Icons.group),
                  ),
                  const SettingsDivider(),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    onTap: controller.onBlockUserClicked,
                    trailing: const Icon(
                      Icons.block,
                      size: 27,
                      color: Colors.red,
                    ),
                    title: "Block ${controller.room.title}".text,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    onTap: controller.onReportUserClicked,
                    trailing: const Icon(
                      Icons.thumb_down,
                      color: Colors.red,
                      size: 25,
                    ),
                    title: "Report ${controller.room.title}".text,
                  ),
                  const SettingsDivider(),
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
