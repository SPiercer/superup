import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

class PermissionManager {
  Future<bool> isAllowRecord() async {
    return await Permission.microphone.isGranted;
  }

  Future<bool> askForMic() async {
    final res = await Permission.microphone.request();
    return res.isGranted;
  }
}
