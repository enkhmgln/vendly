import 'package:flutter/material.dart';

class AppOtpModel {
  AppOtpModel({
    this.length = 6,
    this.size = 56,
    this.isSecure = false,
    this.isAutoFocus = true,
    this.keyboardType = TextInputType.number,
  })  : controller = TextEditingController(),
        focusNode = FocusNode();

  final int length;
  final double size;
  final bool isSecure;
  final bool isAutoFocus;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final FocusNode focusNode;

  String get value => controller.text;
  bool get isValid => value.length == length;

  void dispose() {
    controller.dispose();
    focusNode.dispose();
  }
}
