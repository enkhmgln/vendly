import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_text_styles.dart';

import 'transactions_controller.dart';

class TransactionsView extends GetView<TransactionsController> {
  const TransactionsView({super.key});

  static const String routeName = '/transactions';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          'Transactions',
          style: AppTextStyles.titleLargeBold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
