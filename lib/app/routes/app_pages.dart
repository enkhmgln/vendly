import 'package:get/get.dart';

import '/core/constants/config.dart';
import '/core/shared/store_manager.dart';
import '/core/shared/user_manager.dart';
import '/screens/_.dart';

class AppPages {
  AppPages._();

  static String get splash => SplashView.routeName;

  static String get initial => !UserManager.isLogged
      ? WelcomeView.routeName
      : (DeviceStoreManager.shared.data<bool>(kPermissionsCompleted) ?? false)
      ? TabBarScreen.routeName
      : PermissionsView.routeName;

  static final List<GetPage> routes = [
    GetPage(
      name: SplashView.routeName,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: WelcomeView.routeName,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: CreateAccountView.routeName,
      page: () => const CreateAccountView(),
      binding: CreateAccountBinding(),
    ),
    GetPage(
      name: VerifyOtpView.routeName,
      page: () => const VerifyOtpView(),
      binding: VerifyOtpBinding(),
    ),
    GetPage(
      name: LoginView.routeName,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: HomeView.routeName,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: TabBarScreen.routeName,
      page: () => const TabBarScreen(),
      binding: TabBarBinding(),
    ),
    GetPage(
      name: ProfileSetupView.routeName,
      page: () => const ProfileSetupView(),
      binding: ProfileSetupBinding(),
    ),
    GetPage(
      name: PermissionsView.routeName,
      page: () => const PermissionsView(),
      binding: PermissionsBinding(),
    ),
    // GetPage(
    //   name: WelcomeView.routeName,
    //   page: () => const WelcomeView(),
    //   binding: WelcomeBinding(),
    // ),
    // GetPage(
    //   name: ProfileView.routeName,
    //   page: () => const ProfileView(),
    //   binding: ProfileBinding(),
    // ),
    // GetPage(
    //   name: TellUsMoreView.routeName,
    //   page: () => const TellUsMoreView(),
    //   binding: TellUsMoreBinding(),
    // ),
    // GetPage(
    //   name: LoginView.routeName,
    //   page: () => const LoginView(),
    //   binding: LoginBinding(),
    // ),
  ];

  static void goToCreateAccount() {
    Get.toNamed(CreateAccountView.routeName);
  }

  static void goToProfileSetup() => Get.offAllNamed(ProfileSetupView.routeName);

  static void goToPermissions() => Get.toNamed(PermissionsView.routeName);

  static void goToLogin() {
    Get.toNamed(LoginView.routeName);
  }
}
