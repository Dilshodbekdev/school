import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school/src/config/theme/text_styles.dart';

String convertDateTime(String? date) {
  var outputDate = "";
  if (date != null) {
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm');
    outputDate = outputFormat.format(inputDate);
  }
  return outputDate;
}

String getCurrencySymbol(double value) {
  String valueString = value.toStringAsFixed(0);
  String pattern = r'(\d)(?=(\d{3})+(?!\d))';
  RegExp regex = RegExp(pattern);
  String formattedValue = valueString.replaceAllMapped(
      regex, (Match match) => '${match.group(1)} ');
  return '$formattedValue so\'m';
}

DataColumn appDataColumn(String text) {
  return DataColumn(
    label: Expanded(
      child: Text(
        text,
        style: CustomTextStyle.h14SB,
        textAlign: TextAlign.center,
      ),
    ),
  );
}

DataColumn appDataColumnVertical(String text) {
  return DataColumn(
    label: RotatedBox(
      quarterTurns: 1,
      child: Text(
        text,
        style: CustomTextStyle.h14SB,
      ),
    ),
  );
}
