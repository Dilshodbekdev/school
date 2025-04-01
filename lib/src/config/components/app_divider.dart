import 'package:flutter/material.dart';
import 'package:school/src/config/theme/app_colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      color: AppColors.dividerColor,
    );
  }
}
