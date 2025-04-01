import 'package:flutter/material.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/theme/text_styles.dart';

class NoInfoText extends StatelessWidget {
  const NoInfoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).noInfoFound,
      style: CustomTextStyle.h16R,
    );
  }
}
