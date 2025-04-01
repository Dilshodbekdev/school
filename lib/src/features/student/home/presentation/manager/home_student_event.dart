part of 'home_student_bloc.dart';

abstract class HomeStudentEvent {}

class HomeStudentNewsEvent extends HomeStudentEvent {
  final bool isPaging;

  HomeStudentNewsEvent({required this.isPaging});
}

class CurrentDayMenuEvent extends HomeStudentEvent {
  final MenuWeekdayBody body;

  CurrentDayMenuEvent({required this.body});
}

class MenuEvent extends HomeStudentEvent {
  MenuEvent();
}

class SciencesEvent extends HomeStudentEvent {
  final ScienceBody body;

  SciencesEvent({required this.body});
}

class RatingEvent extends HomeStudentEvent {
  final RatingBody body;

  RatingEvent({required this.body});
}

class TimetableEvent extends HomeStudentEvent {
  TimetableEvent();
}

class TimesEvent extends HomeStudentEvent {
  TimesEvent();
}

class QuartersEvent extends HomeStudentEvent {
  QuartersEvent();
}

class CurrentQuarterEvent extends HomeStudentEvent {
  CurrentQuarterEvent();
}

class StatisticStudentAttendanceEvent extends HomeStudentEvent {
  final int quarter;

  StatisticStudentAttendanceEvent({required this.quarter});
}

class StatisticStudentAppropriationEvent extends HomeStudentEvent {
  final int quarter;

  StatisticStudentAppropriationEvent({required this.quarter});
}

class ChangeCurrentDateEvent extends HomeStudentEvent {
  final DateTime date;

  ChangeCurrentDateEvent({required this.date});
}

class NewDetailsEvent extends HomeStudentEvent {
  final int id;

  NewDetailsEvent({required this.id});
}