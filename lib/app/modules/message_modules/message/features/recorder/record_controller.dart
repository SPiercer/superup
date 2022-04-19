import 'dart:async';
import 'package:get/get.dart';
import 'package:record/record.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:superup/app/core/alerts_widgets/info/info_alert.dart';
import 'package:superup/app/core/enums/permission_type.dart';
import 'package:superup/app/core/manager/permission_manager.dart';

import '../../../../../core/alerts_widgets/permistion_alerts/permission_asker.dart';

class RecordController {
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
  final recorder = Record();
  final currentTime = "00:00".obs;
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );

  RecordController() {
    _stopWatchTimer.rawTime.listen((value) {
      currentTime.value = StopWatchTimer.getDisplayTime(
        value,
        hours: false,
        milliSecond: false,
      );
    });
  }



  Future close() async {
    await _stopWatchTimer.dispose();
  }

  void startCounterUp() {
    if(_stopWatchTimer.isRunning){
      stopCounter();
    }
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
  }

  Future stopCounter() async {
    _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
  }




  Future<bool> _start() async {
    final perms = Get.find<PermissionManager>();
    if (await perms.isAllowRecord()) {
      /// start record
      unawaited(recorder.start());
      return true;
    } else {
      /// ask
      final res =
          await PermissionAsker.askPermission(permission: PermissionType.mic);
      if (res == 1) {
        final isAllow = await perms.askForMic();
        if (isAllow) {
          unawaited(recorder.start());

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
