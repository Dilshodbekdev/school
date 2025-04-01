import 'package:flutter/material.dart';
import 'package:school/src/config/components/app_divider.dart';
import 'package:school/src/config/theme/app_colors.dart';

class ProfileTextWidget extends StatelessWidget {
  final String text1;
  final String text2;

  const ProfileTextWidget({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppDivider(),
        SizedBox(
          height: 42,
          child: Row(
            children: [
              Expanded(
                  child: Text(
                    text1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.secondaryTextColor,
                    ),
                  )),
              Expanded(
                  child: Text(
                    text2,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  )),
            ],
          ),
        )
      ],
    );
  }
}
