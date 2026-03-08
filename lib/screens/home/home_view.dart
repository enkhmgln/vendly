import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_text_styles.dart';
import '/components/main/app_app_bar.dart';
import '/components/main/app_scaffold.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final user = controller.user;
    return AppScaffold(
      appBar: AppAppBar(titleText: 'Нүүр'),
      body: SafeArea(
        child: user == null
            ? Center(
                child: Text(
                  'Хэрэглэгчийн мэдээлэл олдсонгүй',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _InfoRow(label: 'ID', value: user.id),
                    const SizedBox(height: 16),
                    _InfoRow(label: 'И-мэйл', value: user.email),
                  ],
                ),
              ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTextStyles.bodyLargeMedium.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
