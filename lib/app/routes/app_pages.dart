import 'package:get/get.dart';

import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/privacy_policy/bindings/privacy_policy_binding.dart';
import '../modules/auth/privacy_policy/views/privacy_policy_view.dart';
import '../modules/auth/profile_info/bindings/profile_info_binding.dart';
import '../modules/auth/profile_info/views/profile_info_view.dart';
import '../modules/auth/verify_number/bindings/verify_number_binding.dart';
import '../modules/auth/verify_number/views/verify_number_view.dart';

import '../modules/home_modules/calls_tab/bindings/calls_tab_binding.dart';
import '../modules/home_modules/calls_tab/views/calls_tab_view.dart';
import '../modules/home_modules/home/bindings/home_binding.dart';
import '../modules/home_modules/home/views/home_view.dart';
import '../modules/home_modules/rooms_tab/bindings/rooms_tab_binding.dart';
import '../modules/home_modules/rooms_tab/views/rooms_tab_view.dart';
import '../modules/home_modules/status_tab/bindings/status_tab_binding.dart';
import '../modules/home_modules/status_tab/views/status_tab_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_POLICY,
      page: () => const PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_NUMBER,
      page: () => VerifyNumberView(),
      binding: VerifyNumberBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_INFO,
      page: () => ProfileInfoView(),
      binding: ProfileInfoBinding(),
    ),
    GetPage(
      name: _Paths.ROOMS_TAB,
      page: () => RoomsTabView(),
      binding: RoomsTabBinding(),
    ),
    GetPage(
      name: _Paths.STATUS_TAB,
      page: () => StatusTabView(),
      binding: StatusTabBinding(),
    ),
    GetPage(
      name: _Paths.CALLS_TAB,
      page: () => CallsTabView(),
      binding: CallsTabBinding(),
    ),
  ];
}
