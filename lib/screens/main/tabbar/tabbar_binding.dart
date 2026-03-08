import 'package:get/get.dart';

import '/screens/_.dart';

class TabBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabBarController>(TabBarController.new);
    Get.lazyPut<HomeController>(HomeController.new);
    Get.lazyPut<TransactionsController>(TransactionsController.new);
    Get.lazyPut<SetupController>(SetupController.new);
    Get.lazyPut<NotificationsController>(NotificationsController.new);
    Get.lazyPut<MoreController>(MoreController.new);
  }
}
