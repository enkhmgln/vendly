import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '/client/api/files_api.dart';
import '/client/api/user_api.dart';
import '/client/models/profile_update_model.dart';
import '/components/_.dart';
import '/core/utils/validator.dart';
import '/screens/_.dart';

class ProfileSetupController extends AppBaseController {
  ProfileSetupController() {
    firstNameModel = AppTextFieldModel(
      label: 'Нэр',
      hint: 'Жишээ: Бат',
      validators: [ValidatorType.notEmpty],
    );
    lastNameModel = AppTextFieldModel(
      label: 'Овог',
      hint: 'Жишээ: Дорж',
      validators: [ValidatorType.notEmpty],
    );
    phoneModel = AppTextFieldModel(
      label: 'Утас',
      hint: '9999 9999',
      keyboardType: TextInputType.phone,
      validators: [ValidatorType.notEmpty],
    );
    locationModel = AppTextFieldModel(
      label: 'Байршил',
      hint: 'Жишээ: Улаанбаатар',
    );
    birthdateModel = AppTextFieldModel(
      label: 'Төрсөн өдөр',
      hint: '1990-05-15',
      keyboardType: TextInputType.datetime,
    );
  }

  late final AppTextFieldModel firstNameModel;
  late final AppTextFieldModel lastNameModel;
  late final AppTextFieldModel phoneModel;
  late final AppTextFieldModel locationModel;
  late final AppTextFieldModel birthdateModel;

  final currentStep = 0.obs;
  static const int totalSteps = 3;

  final avatarFilePath = Rxn<String>();
  final avatarFileId = Rxn<String>();

  @override
  void onInit() {
    super.onInit();
    firstNameModel.errorText.addListener(_runStep0Validation);
    lastNameModel.errorText.addListener(_runStep0Validation);
    phoneModel.errorText.addListener(_runStep0Validation);
  }

  @override
  void onClose() {
    firstNameModel.errorText.removeListener(_runStep0Validation);
    lastNameModel.errorText.removeListener(_runStep0Validation);
    phoneModel.errorText.removeListener(_runStep0Validation);
    firstNameModel.dispose();
    lastNameModel.dispose();
    phoneModel.dispose();
    locationModel.dispose();
    birthdateModel.dispose();
    super.onClose();
  }

  void _runStep0Validation() {
    if (firstNameModel.validators != null &&
        firstNameModel.validators!.isNotEmpty) {
      final (_, error) = Validator(
        validations: firstNameModel.validators!,
      ).isValid(firstNameModel.value);
      firstNameModel.errorText.value = error;
    }
    if (lastNameModel.validators != null &&
        lastNameModel.validators!.isNotEmpty) {
      final (_, error) = Validator(
        validations: lastNameModel.validators!,
      ).isValid(lastNameModel.value);
      lastNameModel.errorText.value = error;
    }
    if (phoneModel.validators != null && phoneModel.validators!.isNotEmpty) {
      final (_, error) = Validator(
        validations: phoneModel.validators!,
      ).isValid(phoneModel.value);
      phoneModel.errorText.value = error;
    }
  }

  bool _validateStep0() {
    var valid = true;
    if (firstNameModel.validators != null &&
        firstNameModel.validators!.isNotEmpty) {
      final (fieldValid, error) = Validator(
        validations: firstNameModel.validators!,
      ).isValid(firstNameModel.value);
      firstNameModel.errorText.value = error;
      valid = valid && fieldValid;
    }
    if (lastNameModel.validators != null &&
        lastNameModel.validators!.isNotEmpty) {
      final (fieldValid, error) = Validator(
        validations: lastNameModel.validators!,
      ).isValid(lastNameModel.value);
      lastNameModel.errorText.value = error;
      valid = valid && fieldValid;
    }
    if (phoneModel.validators != null && phoneModel.validators!.isNotEmpty) {
      final (fieldValid, error) = Validator(
        validations: phoneModel.validators!,
      ).isValid(phoneModel.value);
      phoneModel.errorText.value = error;
      valid = valid && fieldValid;
    }
    return valid;
  }

  Future<void> pickAvatar() async {
    final picker = ImagePicker();
    final xFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      imageQuality: 85,
    );
    if (xFile == null) return;
    isLoading.value = true;
    final result = await FilesApi.upload(
      filePath: xFile.path,
      filename: xFile.name,
    );
    isLoading.value = false;
    if (result.isSuccess && result.dataOrNull != null) {
      avatarFilePath.value = xFile.path;
      avatarFileId.value = result.dataOrNull!.id;
    } else {
      await showError(text: result.message);
    }
  }

  void removeAvatar() {
    avatarFilePath.value = null;
    avatarFileId.value = null;
  }

  void onNext() {
    if (currentStep.value == 0) {
      showValidationErrors.value = true;
      if (!_validateStep0()) return;
      currentStep.value = 1;
    } else if (currentStep.value == 1) {
      currentStep.value = 2;
    } else {
      submitProfile();
    }
  }

  void onBack() {
    if (currentStep.value > 0) {
      currentStep.value--;
    } else {
      Get.back();
    }
  }

  Future<void> submitProfile() async {
    final payload = ProfileUpdatePayload(
      firstName: firstNameModel.value.trim().isEmpty
          ? null
          : firstNameModel.value.trim(),
      lastName: lastNameModel.value.trim().isEmpty
          ? null
          : lastNameModel.value.trim(),
      phone: phoneModel.value.trim().isEmpty ? null : phoneModel.value.trim(),
      avatarFileId: avatarFileId.value,
      location: locationModel.value.trim().isEmpty
          ? null
          : locationModel.value.trim(),
      birthdate: birthdateModel.value.trim().isEmpty
          ? null
          : birthdateModel.value.trim(),
    );

    isLoading.value = true;
    final result = await UserApi().updateProfile(payload);
    isLoading.value = false;

    if (result.isSuccess) {
      Get.offAllNamed(PermissionsView.routeName);
    } else {
      await showError(text: result.message);
    }
  }

  String get stepTitle {
    switch (currentStep.value) {
      case 0:
        return 'Үндсэн мэдээлэл';
      case 1:
        return 'Зургаа сонгох';
      case 2:
        return 'Нэмэлт мэдээлэл';
      default:
        return '';
    }
  }

  String get nextButtonLabel =>
      currentStep.value == totalSteps - 1 ? 'Дуусгах' : 'Дараах';
}
