import 'package:get_it/get_it.dart';
import 'package:super_up_core/super_up_core.dart';

void registerSingletons() {
  GetIt.I.registerSingleton<AuthApiService>(AuthApiService.init());
  GetIt.I.registerSingleton<ProfileApiService>(ProfileApiService.init());
}
