import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../enums/permission_type.dart';
import 'contacts_alert.dart';

class PermissionAsker {
  static Future askPermission({required PermissionType permission}) async {
    return await showDialog(
      context: Get.context!,
      builder: (x) {
        if (permission == PermissionType.contacts) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            content:  ContactsDialog(),
          );
        }
        return SizedBox();
      },
    );
  }
}
