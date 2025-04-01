import 'dart:io';

class ImportBody {
  int quarter;
  int record;
  int title;
  int number;
  int homework;
  File? file;

  ImportBody({
    required this.quarter,
    required this.record,
    required this.title,
    required this.number,
    required this.homework,
    required this.file,
  });
}
