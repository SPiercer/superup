import 'package:flutter/material.dart';
import 'package:super_up_core/src/models/model.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

class SUserItem extends StatelessWidget {
  final SBaseUser baseUser;
  final String? subtitle;
  final Widget? trailing;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;

  const SUserItem({
    Key? key,
    required this.baseUser,
    this.onLongPress,
    this.trailing,
    this.onTap,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      trailing: trailing,
      subtitle: subtitle == null ? null : subtitle!.text,
      onLongPress: onLongPress,
      title: baseUser.fullName.text,
      contentPadding: EdgeInsets.zero,
      leading: VCircleAvatar(
        fullUrl: baseUser.userImage,
        radius: 40,
      ),
    );
  }
}
