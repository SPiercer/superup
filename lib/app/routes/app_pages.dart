import 'package:get/get.dart';

import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/privacy_policy/bindings/privacy_policy_binding.dart';
import '../modules/auth/privacy_policy/views/privacy_policy_view.dart';
import '../modules/auth/profile_info/bindings/profile_info_binding.dart';
import '../modules/auth/profile_info/views/profile_info_view.dart';
import '../modules/auth/verify_number/bindings/verify_number_binding.dart';
import '../modules/auth/verify_number/views/verify_number_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_POLICY,
      page: () => PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
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
  ];
}
