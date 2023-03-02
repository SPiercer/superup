import 'package:flutter/cupertino.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

class VersionCheckerController extends ValueNotifier<CheckVersion?> {
  final ProfileApiService profileApiService;

  VersionCheckerController(this.profileApiService) : super(null);

  Future<CheckVersion?> check() async {
    final res = await vSafeApiCall<CheckVersion>(
      request: () async {
        final packageInfo = await PackageInfo.fromPlatform();
        String version = packageInfo.version;
        String buildNumber = packageInfo.buildNumber;
        final current = "$version+$buildNumber";
        return profileApiService.checkVersion(current);
      },
      onSuccess: (response) {
        return response;
      },
    );
    value = res;
    return res;
  }
}
