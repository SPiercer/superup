import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_up/app/modules/chat_settings/widgets/single_rename.dart';


enum SelectedPopUpMenuItem { addParticipant, changeSubject }

class RoomSettingPopUpMenu extends StatelessWidget {
  const RoomSettingPopUpMenu(
      {super.key,
      required this.onAddParticipant,
      required this.onChangeSubject,
      required this.oldValue});
  final VoidCallback onAddParticipant;
  final Function(String subject) onChangeSubject;
  final String? oldValue;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SelectedPopUpMenuItem>(
      onSelected: (value) async {
        switch(value) {
          case SelectedPopUpMenuItem.addParticipant:
            onAddParticipant();
            break;
          case SelectedPopUpMenuItem.changeSubject:
            final text = await Get.to(
                  () => SingleRename(

                appbarTitle:  "group name",
                oldValue: oldValue,
              ),
            ) as String?;
            if (text != null) {
              onChangeSubject(text);
            }
            break;
        }
      },
      icon: const Icon(
        Icons.more_vert_outlined,
      ),
      itemBuilder: (BuildContext context) {
        final l = [
          const PopupMenuItem(
            value: SelectedPopUpMenuItem.changeSubject,
            child: Text("Change subject"),
          ),
          const PopupMenuItem(
            value: SelectedPopUpMenuItem.addParticipant,
            child: Text("Add participants"),
          ),
        ];

        return l;
      },
    );
  }
}
