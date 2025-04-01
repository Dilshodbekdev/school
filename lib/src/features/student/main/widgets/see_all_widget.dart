import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/config/theme/text_styles.dart';

class SeeAllWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  const SeeAllWidget({super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Gap(16),
        Text(
          text,
          style: CustomTextStyle.h18SB,
        ),
        const Spacer(),
        TextButton(
            onPressed: () {
              onClick.call();
            },
            child: Text(
              S.of(context).seeAll,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColors.cardColor),
            )),
        const Gap(16),
      ],
    );
  }
}
