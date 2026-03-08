import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/client/api/auth_api.dart';
import '/screens/_.dart';
import '/components/main/app_base_controller.dart';
import '/components/text_field/app_text_field_model.dart';
import '/core/utils/validator.dart';

class CreateAccountController extends AppBaseController {
  CreateAccountController() {
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

  final termsAgreed = false.obs;

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

  void toggleTerms() {
    termsAgreed.value = !termsAgreed.value;
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
    if (!termsAgreed.value) return;

    isLoading.value = true;
    final result = await AuthApi.signup(
      email: emailModel.value.trim(),
      password: passwordModel.value,
    );
    isLoading.value = false;

    if (result.isSuccess) {
      toastSuccess(result.message);
      Get.toNamed(VerifyOtpView.routeName, arguments: emailModel.value.trim());
    } else {
      await showError(text: result.message);
    }
  }
}
