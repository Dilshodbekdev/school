part of 'simple_test_teacher_bloc.dart';

abstract class SimpleTestTeacherEvent {}

class ActiveSimpleTestsEvent extends SimpleTestTeacherEvent {
  final bool isPaging;

  ActiveSimpleTestsEvent({required this.isPaging});
}

class TemplateSimpleTestsEvent extends SimpleTestTeacherEvent {
  final bool isPaging;

  TemplateSimpleTestsEvent({required this.isPaging});
}

class CompletedSimpleTestsEvent extends SimpleTestTeacherEvent {
  final bool isPaging;

  CompletedSimpleTestsEvent({required this.isPaging});
}

class GetSimpleTestEvent extends SimpleTestTeacherEvent {
  final int id;

  GetSimpleTestEvent({required this.id});
}

class DeleteSimpleTestEvent extends SimpleTestTeacherEvent {
  final int id;

  DeleteSimpleTestEvent({required this.id});
}

class GetStudentsSimpleTestEvent extends SimpleTestTeacherEvent {
  final GetStudentsSimpleTestBody body;

  GetStudentsSimpleTestEvent({required this.body});
}

class StudentResultsSimpleTestEvent extends SimpleTestTeacherEvent {
  final GetStudentsSimpleTestBody body;

  StudentResultsSimpleTestEvent({required this.body});
}

class CreateSimpleTestEvent extends SimpleTestTeacherEvent {
  final CreateSimpleTestBody body;

  CreateSimpleTestEvent({required this.body});
}

class UpdateSimpleTestEvent extends SimpleTestTeacherEvent {
  final CreateSimpleTestBody body;

  UpdateSimpleTestEvent({required this.body});
}

class ClassesSelectTestEvent extends SimpleTestTeacherEvent {
  ClassesSelectTestEvent();
}
