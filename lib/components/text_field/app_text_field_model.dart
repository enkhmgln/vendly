import 'package:flutter/material.dart';
import '/core/utils/validator.dart';

class AppTextFieldModel {
  AppTextFieldModel({
    this.label,
    this.hint,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLength,
    this.maxLines = 1,
    this.validators,
  })  : controller = TextEditingController(),
        focusNode = FocusNode(),
        errorText = ValueNotifier<String?>(null);

  final String? label;
  final String? hint;
  final TextInputType keyboardType;
  bool obscureText;
  bool enabled;
  final bool readOnly;
  final bool autofocus;
  final int? maxLength;
  final int maxLines;
  final List<ValidatorType>? validators;

  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueNotifier<String?> errorText;

  String get value => controller.text;
  bool get isValid => errorText.value == null;

  void setText(String text) {
    controller.text = text;
  }

  void dispose() {
    controller.dispose();
    focusNode.dispose();
    errorText.dispose();
  }
}
