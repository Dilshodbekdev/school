part of 'iq_test_student_bloc.dart';

abstract class IqTestStudentEvent {}

class NewTestsEvent extends IqTestStudentEvent {
  final bool isPaging;

  NewTestsEvent({required this.isPaging});
}

class StartedTestsEvent extends IqTestStudentEvent {
  final bool isPaging;

  StartedTestsEvent({required this.isPaging});
}

class CompletedTestsEvent extends IqTestStudentEvent {
  final bool isPaging;

  CompletedTestsEvent({required this.isPaging});
}

class CreateTestEvent extends IqTestStudentEvent {
  final CreateSimpleTestStudentBody body;

  CreateTestEvent({required this.body});
}

class GetTestEvent extends IqTestStudentEvent {
  final int id;

  GetTestEvent({required this.id});
}

class GetCompleteTestEvent extends IqTestStudentEvent {
  final int id;

  GetCompleteTestEvent({required this.id});
}

class SubmitTestEvent extends IqTestStudentEvent {
  final int id;

  SubmitTestEvent({required this.id});
}

class AnswerTestEvent extends IqTestStudentEvent {
  final AnswerBody body;

  AnswerTestEvent({required this.body});
}

class ChangeSelectTest extends IqTestStudentEvent {
  final int id;
  final int index;

  ChangeSelectTest({required this.id, required this.index});
}
