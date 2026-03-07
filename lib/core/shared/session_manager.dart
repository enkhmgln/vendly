import 'package:get/get.dart';

import '/app/routes/app_pages.dart';
import '/client/api/user_api.dart';
import '/core/constants/config.dart';
import '/core/shared/store_manager.dart';

class SessionManager {
  SessionManager._();
  static final SessionManager shared = SessionManager._();

  Future<void> getUser() async {
    final response = await UserApi().getMe();
    if (response.isSuccess) {
      final user = response.dataOrNull;
      if (user != null) {
        await UserStoreManager.shared.write(kUser, user.toJson());
      }
    }
  }

  Future<void> logout() async {
    await UserStoreManager.shared.deleteStore();
    Get.offAllNamed(AppPages.initial);
  }
}
