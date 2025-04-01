part of 'iq_test_teacher_bloc.dart';

abstract class IqTestTeacherEvent {}

class ActiveTestsEvent extends IqTestTeacherEvent {
  final bool isPaging;

  ActiveTestsEvent({required this.isPaging});
}

class TemplateTestsEvent extends IqTestTeacherEvent {
  final bool isPaging;

  TemplateTestsEvent({required this.isPaging});
}

class CompletedTestsEvent extends IqTestTeacherEvent {
  final bool isPaging;

  CompletedTestsEvent({required this.isPaging});
}

class GetTestEvent extends IqTestTeacherEvent {
  final int id;

  GetTestEvent({required this.id});
}

class DeleteTestEvent extends IqTestTeacherEvent {
  final int id;

  DeleteTestEvent({required this.id});
}

class GetStudentsTestEvent extends IqTestTeacherEvent {
  final GetStudentsSimpleTestBody body;

  GetStudentsTestEvent({required this.body});
}

class StudentResultsTestEvent extends IqTestTeacherEvent {
  final GetStudentsSimpleTestBody body;

  StudentResultsTestEvent({required this.body});
}

class CreateTestEvent extends IqTestTeacherEvent {
  final CreateIqTestBody body;

  CreateTestEvent({required this.body});
}

class UpdateTestEvent extends IqTestTeacherEvent {
  final CreateIqTestBody body;

  UpdateTestEvent({required this.body});
}

class ClassesSelectTestEvent extends IqTestTeacherEvent {
  ClassesSelectTestEvent();
}
