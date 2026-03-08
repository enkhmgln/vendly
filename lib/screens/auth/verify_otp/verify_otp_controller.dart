import 'package:get/get.dart';
import '/app/routes/app_pages.dart';

import '/client/api/auth_api.dart';
import '/components/_.dart';
import '/core/constants/config.dart';
import '/core/shared/store_manager.dart';

class VerifyOtpController extends AppBaseController {
  VerifyOtpController() {
    otpModel = AppOtpModel(length: 4, size: 56, isAutoFocus: true);
  }

  late final AppOtpModel otpModel;

  String get email => _email;
  late String _email;

  @override
  void onInit() {
    super.onInit();
    _email = (Get.arguments is String) ? (Get.arguments as String) : '';
  }

  @override
  void onClose() {
    otpModel.dispose();
    super.onClose();
  }

  Future<void> onSubmit() async {
    final otp = otpModel.value.trim();
    if (otp.length != otpModel.length) return;

    isLoading.value = true;
    final result = await AuthApi.verifyOtp(email: _email, otp: otp);
    isLoading.value = false;

    if (result.isSuccess) {
      final data = result.dataOrNull!;
      await UserStoreManager.shared.write(kToken, data.accessToken);
      await UserStoreManager.shared.write(kUser, data.user.toJson());
      AppPages.goToPermissions();
    } else {
      await showError(text: result.message);
    }
  }
}
