part of 'directional_test_student_bloc.dart';

abstract class DirectionalTestStudentEvent {}

class NewTestsEvent extends DirectionalTestStudentEvent {
  final bool isPaging;

  NewTestsEvent({required this.isPaging});
}

class StartedTestsEvent extends DirectionalTestStudentEvent {
  final bool isPaging;

  StartedTestsEvent({required this.isPaging});
}

class CompletedTestsEvent extends DirectionalTestStudentEvent {
  final bool isPaging;

  CompletedTestsEvent({required this.isPaging});
}

class CreateTestEvent extends DirectionalTestStudentEvent {
  final CreateSimpleTestStudentBody body;

  CreateTestEvent({required this.body});
}

class GetTestEvent extends DirectionalTestStudentEvent {
  final int id;

  GetTestEvent({required this.id});
}

class GetCompleteTestEvent extends DirectionalTestStudentEvent {
  final int id;

  GetCompleteTestEvent({required this.id});
}

class SubmitTestEvent extends DirectionalTestStudentEvent {
  final int id;

  SubmitTestEvent({required this.id});
}

class AnswerTestEvent extends DirectionalTestStudentEvent {
  final AnswerBody body;

  AnswerTestEvent({required this.body});
}

class ChangeSelectTest extends DirectionalTestStudentEvent {
  final int id;
  final int index;

  ChangeSelectTest({required this.id, required this.index});
}
