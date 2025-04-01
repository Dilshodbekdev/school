import 'package:flutter/material.dart';
import 'package:school/src/config/theme/app_colors.dart';

OutlineInputBorder appTextFiledBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(4),
    ),
    borderSide: BorderSide(color: AppColors.dividerColor),
  );
}

OutlineInputBorder appTextFiledErrorBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(4),
    ),
    borderSide: BorderSide(color: Colors.red),
  );
}

OutlineInputBorder appTextFiledTransparentBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(4),
    ),
    borderSide: BorderSide(color: Colors.transparent),
  );
}