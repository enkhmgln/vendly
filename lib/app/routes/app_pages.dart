import 'package:get/get.dart';

import '/screens/_.dart';

class AppPages {
  AppPages._();
  static const String initial = WelcomeView.routeName;

  static final List<GetPage> routes = [
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
    // GetPage(
    //   name: VerifyOtpView.routeName,
    //   page: () => const VerifyOtpView(),
    //   binding: VerifyOtpBinding(),
    // ),
  ];

  static void goToCreateAccount() {
    Get.toNamed(CreateAccountView.routeName);
  }

  static void goToLogin() {
    // Get.toNamed(LoginView.routeName);
  }
}
