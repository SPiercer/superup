import 'package:get_it/get_it.dart';
import 'package:super_up_core/super_up_core.dart';

import 'controllers/version_checker_controller.dart';

void registerSingletons() {
  GetIt.I.registerSingleton<AuthApiService>(AuthApiService.init());
  final ProfileApiService profileApiService = ProfileApiService.init();
  GetIt.I.registerSingleton<ProfileApiService>(profileApiService);

  GetIt.I.registerSingleton<VersionCheckerController>(
      VersionCheckerController(profileApiService));
}
