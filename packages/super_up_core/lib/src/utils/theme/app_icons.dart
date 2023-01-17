import 'package:flutter/material.dart';

import 'colors.dart';

abstract class AppIcons {
  ///message
  static const Widget muteIcon = Icon(
    Icons.volume_off_sharp,
    size: 22,
    color: AppColors.accentColor,
  );

  static const Widget archiveIcon = Icon(Icons.archive);

  static const Widget sendMessage = Icon(
    Icons.done,
    size: 16,
  );

  static const Widget pendingMessage = Icon(
    Icons.access_time,
    size: 16,
  );
  static const Widget deliverMessageStatus = Icon(
    Icons.done_all_outlined,
    color: Colors.green,
    size: 16,
  );
  static const Widget seenMessageStatus = Icon(
    Icons.done_all_outlined,
    color: AppColors.primaryColor,
    size: 16,
  );
}
