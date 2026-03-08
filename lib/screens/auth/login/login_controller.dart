import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/client/api/auth_api.dart';
import '/components/main/app_base_controller.dart';
import '/components/text_field/app_text_field_model.dart';
import '/core/constants/config.dart';
import '/core/shared/store_manager.dart';
import '/core/utils/validator.dart';
import '/screens/_.dart';

class LoginController extends AppBaseController {
  LoginController() {
    emailModel = AppTextFieldModel(
      label: 'И-мэйл хаяг',
      hint: 'И-мэйл хаяг',
      keyboardType: TextInputType.emailAddress,
      validators: [ValidatorType.email],
    );
    passwordModel = AppTextFieldModel(
      label: 'Нууц үг',
      hint: 'Нууц үг',
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      validators: [ValidatorType.password],
    );
  }

  late final AppTextFieldModel emailModel;
  late final AppTextFieldModel passwordModel;

  @override
  void onInit() {
    super.onInit();
    emailModel.errorText.addListener(runValidation);
    passwordModel.errorText.addListener(runValidation);
  }

  @override
  void onClose() {
    emailModel.errorText.removeListener(runValidation);
    passwordModel.errorText.removeListener(runValidation);
    emailModel.dispose();
    passwordModel.dispose();
    super.onClose();
  }

  bool runValidation() {
    var valid = true;
    if (emailModel.validators != null && emailModel.validators!.isNotEmpty) {
      final (fieldValid, error) = Validator(
        validations: emailModel.validators!,
      ).isValid(emailModel.value);
      emailModel.errorText.value = error;
      valid = valid && fieldValid;
    }
    if (passwordModel.validators != null &&
        passwordModel.validators!.isNotEmpty) {
      final (fieldValid, error) = Validator(
        validations: passwordModel.validators!,
      ).isValid(passwordModel.value);
      passwordModel.errorText.value = error;
      valid = valid && fieldValid;
    }
    return valid;
  }

  Future<void> onSubmit() async {
    showValidationErrors.value = true;
    if (!runValidation()) return;

    isLoading.value = true;
    final result = await AuthApi.login(
      email: emailModel.value.trim(),
      password: passwordModel.value,
    );
    isLoading.value = false;

    if (result.isSuccess) {
      final data = result.dataOrNull!;
      await UserStoreManager.shared.write(kToken, data.accessToken);
      await UserStoreManager.shared.write(kUser, data.user.toJson());
      final completed =
          DeviceStoreManager.shared.data<bool>(kPermissionsCompleted) ?? false;
      if (completed) {
        Get.offAllNamed(HomeView.routeName);
      } else {
        Get.offAllNamed(PermissionsView.routeName);
      }
    } else {
      await showError(text: result.message);
    }
  }
}
