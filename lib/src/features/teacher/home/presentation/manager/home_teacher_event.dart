part of 'home_teacher_bloc.dart';

abstract class HomeTeacherEvent {}

class NewsEvent extends HomeTeacherEvent {
  final bool isPaging;

  NewsEvent({required this.isPaging});
}

class MyRecordsEvent extends HomeTeacherEvent {
  MyRecordsEvent();
}

class RecordEvent extends HomeTeacherEvent {
  final RecordBody body;

  RecordEvent({required this.body});
}

class TimetableEvent extends HomeTeacherEvent {
  TimetableEvent();
}

class TimesEvent extends HomeTeacherEvent {
  TimesEvent();
}

class QuartersEvent extends HomeTeacherEvent {
  QuartersEvent();
}

class CurrentQuarterEvent extends HomeTeacherEvent {
  CurrentQuarterEvent();
}

class ChangeCurrentDateEvent extends HomeTeacherEvent {
  final DateTime date;

  ChangeCurrentDateEvent({required this.date});
}

class NewDetailsEvent extends HomeTeacherEvent {
  final int id;

  NewDetailsEvent({required this.id});
}
