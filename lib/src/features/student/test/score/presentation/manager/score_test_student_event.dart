part of 'score_test_student_bloc.dart';

abstract class ScoreTestStudentEvent {}

class NewTestsEvent extends ScoreTestStudentEvent {
  final bool isPaging;

  NewTestsEvent({required this.isPaging});
}

class StartedTestsEvent extends ScoreTestStudentEvent {
  final bool isPaging;

  StartedTestsEvent({required this.isPaging});
}

class CompletedTestsEvent extends ScoreTestStudentEvent {
  final bool isPaging;

  CompletedTestsEvent({required this.isPaging});
}

class CreateTestEvent extends ScoreTestStudentEvent {
  final CreateSimpleTestStudentBody body;

  CreateTestEvent({required this.body});
}

class GetTestEvent extends ScoreTestStudentEvent {
  final int id;

  GetTestEvent({required this.id});
}

class GetCompleteTestEvent extends ScoreTestStudentEvent {
  final int id;

  GetCompleteTestEvent({required this.id});
}

class SubmitTestEvent extends ScoreTestStudentEvent {
  final int id;

  SubmitTestEvent({required this.id});
}

class AnswerTestEvent extends ScoreTestStudentEvent {
  final AnswerBody body;

  AnswerTestEvent({required this.body});
}

class ChangeSelectTest extends ScoreTestStudentEvent {
  final int id;
  final int index;

  ChangeSelectTest({required this.id, required this.index});
}
