import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:textless/textless.dart';

import '../../../../core/constants/colors.dart';
import '../../common/settings_divider.dart';
import '../../common/sliver_header.dart';
import '../controllers/broadcast_room_settings_controller.dart';

class BroadcastRoomSettingsView
    extends GetView<BroadcastRoomSettingsController> {
  const BroadcastRoomSettingsView({Key? key}) : super(key: key);

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
                    } else if (value == 'Change broadcast list name') {
                      controller.onChangeNameClicked();
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
                      value: "Change broadcast list name",
                      enabled: true,
                      child: Text("Change broadcast list name"),
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
                        "Broadcast List 2 recipients"
                            .b1
                            .color(AppColors.buttonBackground),
                        const SizedBox(
                          height: 5,
                        ),
                        "Created today at 10:00 PM"
                            .b2
                            .color(AppColors.buttonBackground),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  const SettingsDivider(),
                  ListTile(
                    onTap: controller.addParticipants,
                    title: "Add participants".text,
                    leading: const Icon(Icons.group_add),
                  ),
                  const SettingsDivider(),
                  ListTile(
                    onTap: controller.editParticipants,
                    title: "Edit participants".text,
                    leading: const Icon(Icons.edit),
                  ),
                  const SettingsDivider(),
                  ListTile(
                    onTap: controller.editParticipants,
                    title: "Delete broadcast list".text,
                    leading: const Icon(Icons.delete),
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
