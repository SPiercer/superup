import 'package:flutter/material.dart';
import 'package:superup/app/core/constants/size.dart';

import 'colors.dart';

class AppIcons {
  AppIcons._();

  ///message
  static const Widget muteIcon = Icon(
    Icons.volume_off_sharp,
    size: 22,
    color: AppColors.accentColor,
  );

  static const Widget archiveIcon = Icon(Icons.archive);

  static const Widget sendMessage = Icon(
    Icons.done,
    size: AppSizes.messageIconSize,
  );

  static const Widget pendingMessage = Icon(
    Icons.access_time,
    size: AppSizes.messageIconSize,
  );
  static const Widget deliverMessageStatus = Icon(
    Icons.done_all_outlined,
    color: Colors.green,
    size: AppSizes.messageIconSize,
  );
  static const Widget seenMessageStatus = Icon(
    Icons.done_all_outlined,
    color: AppColors.primaryColor,
    size: AppSizes.messageIconSize,
  );

}
