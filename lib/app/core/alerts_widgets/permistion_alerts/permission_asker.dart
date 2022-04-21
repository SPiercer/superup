import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superup/app/core/alerts_widgets/permistion_alerts/mic_alert.dart';
import '../../enums/permission_type.dart';
import 'camera_alert.dart';
import 'contacts_alert.dart';

class PermissionAsker {
  static Future askPermission({required PermissionType permission}) async {
    return await showDialog(
      context: Get.context!,
      builder: (x) {
        if (permission == PermissionType.contacts) {
          return const AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: ContactsDialog(),
          );
        }
        if (permission == PermissionType.mic) {
          return const AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: MicDialog(),
          );
        }
        if (permission == PermissionType.camera) {
          return const AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: CameraDialog(),
          );
        }
        return SizedBox();
      },
    );
  }
}
