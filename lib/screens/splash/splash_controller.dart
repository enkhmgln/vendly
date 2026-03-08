import 'package:get/get.dart';

import '/app/routes/app_pages.dart';
import '/components/_.dart';

class SplashController extends AppBaseController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(milliseconds: 700), _goToInitial);
  }

  void _goToInitial() {
    Get.offAllNamed(AppPages.initial);
  }
}
