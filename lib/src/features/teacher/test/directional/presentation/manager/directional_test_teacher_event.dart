part of 'directional_test_teacher_bloc.dart';

abstract class DirectionalTestTeacherEvent {}

class ActiveTestsEvent extends DirectionalTestTeacherEvent {
  final bool isPaging;

  ActiveTestsEvent({required this.isPaging});
}

class TemplateTestsEvent extends DirectionalTestTeacherEvent {
  final bool isPaging;

  TemplateTestsEvent({required this.isPaging});
}

class CompletedTestsEvent extends DirectionalTestTeacherEvent {
  final bool isPaging;

  CompletedTestsEvent({required this.isPaging});
}

class GetTestEvent extends DirectionalTestTeacherEvent {
  final int id;

  GetTestEvent({required this.id});
}

class DeleteTestEvent extends DirectionalTestTeacherEvent {
  final int id;

  DeleteTestEvent({required this.id});
}

class GetStudentsTestEvent extends DirectionalTestTeacherEvent {
  final GetStudentsSimpleTestBody body;

  GetStudentsTestEvent({required this.body});
}

class StudentResultsTestEvent extends DirectionalTestTeacherEvent {
  final GetStudentsSimpleTestBody body;

  StudentResultsTestEvent({required this.body});
}

class CreateTestEvent extends DirectionalTestTeacherEvent {
  final CreateIqTestBody body;

  CreateTestEvent({required this.body});
}

class UpdateTestEvent extends DirectionalTestTeacherEvent {
  final CreateIqTestBody body;

  UpdateTestEvent({required this.body});
}

class ClassesSelectTestEvent extends DirectionalTestTeacherEvent {
  ClassesSelectTestEvent();
}
