part of 'simple_test_student_bloc.dart';

abstract class SimpleTestStudentEvent {}

class NewTestsEvent extends SimpleTestStudentEvent {
  final bool isPaging;

  NewTestsEvent({required this.isPaging});
}

class StartedTestsEvent extends SimpleTestStudentEvent {
  final bool isPaging;

  StartedTestsEvent({required this.isPaging});
}

class CompletedTestsEvent extends SimpleTestStudentEvent {
  final bool isPaging;

  CompletedTestsEvent({required this.isPaging});
}

class CreateTestEvent extends SimpleTestStudentEvent {
  final CreateSimpleTestStudentBody body;

  CreateTestEvent({required this.body});
}

class GetTestEvent extends SimpleTestStudentEvent {
  final int id;

  GetTestEvent({required this.id});
}

class GetCompleteTestEvent extends SimpleTestStudentEvent {
  final int id;

  GetCompleteTestEvent({required this.id});
}

class SubmitTestEvent extends SimpleTestStudentEvent {
  final int id;

  SubmitTestEvent({required this.id});
}

class AnswerTestEvent extends SimpleTestStudentEvent {
  final AnswerBody body;

  AnswerTestEvent({required this.body});
}

class ChangeSelectTest extends SimpleTestStudentEvent {
  final int id;
  final int index;

  ChangeSelectTest({required this.id, required this.index});
}
