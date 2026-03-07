import 'package:get/get.dart';

import 'app_alert.dart';
import '/core/constants/config.dart';
import '/core/shared/store_manager.dart';
import 'app_toast.dart';

abstract class AppBaseController extends GetxController {
  final isInitialLoading = false.obs;
  final isLoading = false.obs;

  bool get isLogged => UserStoreManager.shared.hasData(kToken);

  Future<bool?> showSuccess({
    required String text,
    String? titleText,
    String? buttonText,
    bool dismissable = true,
  }) {
    return AppAlert(
      type: AppAlertType.success,
      titleText: titleText,
      bodyText: text,
      acceptText: buttonText ?? 'OK',
      dismissable: dismissable,
    ).show();
  }

  Future<bool?> showError({
    required String text,
    String? titleText,
    String? buttonText,
  }) {
    return AppAlert(
      type: AppAlertType.error,
      titleText: titleText,
      bodyText: text,
      acceptText: buttonText ?? 'OK',
      dismissable: true,
    ).show();
  }

  Future<bool?> showWarning({
    required String text,
    String? titleText,
    String? acceptText,
    String? cancelText,
  }) {
    return AppAlert(
      type: AppAlertType.warning,
      titleText: titleText,
      bodyText: text,
      acceptText: acceptText,
      cancelText: cancelText,
      dismissable: cancelText == null,
    ).show();
  }

  void toastSuccess(String message, {String? title}) {
    AppToast.showSuccess(message, title: title);
  }

  void toastError(String message, {String? title}) {
    AppToast.showError(message, title: title);
  }

  void toast(String message, {String? title, bool isError = false}) {
    AppToast.show(message, title: title, isError: isError);
  }
}
