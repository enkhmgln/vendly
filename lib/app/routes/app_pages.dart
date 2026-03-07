import 'package:get/get.dart';

import '/screens/_.dart';

class AppPages {
  AppPages._();
  static const String initial = InitialView.routeName;

  static final List<GetPage> routes = [
    GetPage(name: InitialView.routeName, page: () => const InitialView()),
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
    //   name: CreateAccountView.routeName,
    //   page: () => const CreateAccountView(),
    //   binding: CreateAccountBinding(),
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
    // if (UserManager.isOnboardingCompleted) {
    //   Get.toNamed(CreateAccountView.routeName);
    // } else {
    // Get.toNamed(ProfileView.routeName);
    // }
  }

  static void goToLogin() {
    // Get.toNamed(LoginView.routeName);
  }
}
