part of 'score_test_teacher_bloc.dart';

abstract class ScoreTestTeacherEvent {}

class ActiveTestsEvent extends ScoreTestTeacherEvent {
  final bool isPaging;

  ActiveTestsEvent({required this.isPaging});
}

class TemplateTestsEvent extends ScoreTestTeacherEvent {
  final bool isPaging;

  TemplateTestsEvent({required this.isPaging});
}

class CompletedTestsEvent extends ScoreTestTeacherEvent {
  final bool isPaging;

  CompletedTestsEvent({required this.isPaging});
}

class GetTestEvent extends ScoreTestTeacherEvent {
  final int id;

  GetTestEvent({required this.id});
}

class DeleteTestEvent extends ScoreTestTeacherEvent {
  final int id;

  DeleteTestEvent({required this.id});
}

class GetStudentsTestEvent extends ScoreTestTeacherEvent {
  final GetStudentsSimpleTestBody body;

  GetStudentsTestEvent({required this.body});
}

class StudentResultsTestEvent extends ScoreTestTeacherEvent {
  final GetStudentsSimpleTestBody body;

  StudentResultsTestEvent({required this.body});
}

class CreateTestEvent extends ScoreTestTeacherEvent {
  final CreateScoreTestTeacherBody body;

  CreateTestEvent({required this.body});
}

class UpdateTestEvent extends ScoreTestTeacherEvent {
  final CreateScoreTestTeacherBody body;

  UpdateTestEvent({required this.body});
}

class ClassesSelectTestEvent extends ScoreTestTeacherEvent {
  ClassesSelectTestEvent();
}
