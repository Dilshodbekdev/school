import 'package:flutter/material.dart';
import 'package:school/src/config/theme/app_colors.dart';

class AppElevatedButton1 extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? bgColor;
  final VoidCallback? onClick;

  const AppElevatedButton1({
    super.key,
    required this.text,
    required this.onClick,
    this.textColor,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: bgColor ?? AppColors.mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(0)),
        onPressed: onClick != null ? () => onClick!() : null,
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
