import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:record/record.dart';
import 'package:superup/app/core/alerts_widgets/info/info_alert.dart';
import 'package:superup/app/core/enums/permission_type.dart';
import 'package:superup/app/core/manager/permission_manager.dart';

import '../../../../../core/alerts_widgets/permistion_alerts/permission_asker.dart';

class RecordController {
  final recorder = Record();

  Future<bool> _start() async {
    final perms = Get.find<PermissionManager>();
    if (await perms.isAllowRecord()) {
      /// start record
      InfoAlert().show(text: "start record !");
      return true;
    } else {
      /// ask
      final res =
          await PermissionAsker.askPermission(permission: PermissionType.mic);
      if (res == 1) {
        final isAllow = await perms.askForMic();
        if (isAllow) {
          unawaited(recorder.start());
          InfoAlert().show(text: "start record !");
          return true;
        } else {
          InfoAlert().show(text: "you must accept mic permission to continue");
          return false;
        }
      } else {
        return false;
      }
    }
  }

  Future<String?> stop() async {
    return await recorder.stop();
  }

  void pause() {}

  Future<bool> askForRecordPermissionsAndStart() async {
    /// permission handler ask for storage and record
    return await _start();
  }
}
