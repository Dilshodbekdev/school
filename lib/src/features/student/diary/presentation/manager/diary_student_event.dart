part of 'diary_student_bloc.dart';

abstract class DiaryStudentEvent {}

class DateDiariesEvent extends DiaryStudentEvent {
  final String? date;

  DateDiariesEvent({required this.date});
}

class QuarterlyDiariesEvent extends DiaryStudentEvent {
  final int quarter;

  QuarterlyDiariesEvent({required this.quarter});
}

class YearlyDiariesEvent extends DiaryStudentEvent {
  YearlyDiariesEvent();
}

class ChangeDateEvent extends DiaryStudentEvent {
  final DateTime date;

  ChangeDateEvent({required this.date});
}
