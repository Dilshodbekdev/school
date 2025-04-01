import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/features/student/home/data/bodies/paging_body.dart';
import 'package:school/src/features/student/test/simple/data/bodies/answer_body.dart';
import 'package:school/src/features/student/test/simple/data/bodies/create_simple_test_student_body.dart';
import 'package:school/src/features/student/test/simple/data/models/answer_simple_test_student_model.dart';
import 'package:school/src/features/student/test/simple/data/models/get_complete_simple_test_student_model.dart';
import 'package:school/src/features/student/test/simple/data/models/get_simple_test_student_model.dart';
import 'package:school/src/features/student/test/simple/data/models/new_simple_tests_student_model.dart';
import 'package:school/src/features/student/test/simple/data/models/started_simple_tests_student_model.dart';
import 'package:school/src/features/student/test/simple/domain/use_case/answer_simple_test_student_use_case.dart';
import 'package:school/src/features/student/test/simple/domain/use_case/completed_simple_tests_student_use_case.dart';
import 'package:school/src/features/student/test/simple/domain/use_case/create_simple_test_student_use_case.dart';
import 'package:school/src/features/student/test/simple/domain/use_case/get_completed_simple_test_student_use_case.dart';
import 'package:school/src/features/student/test/simple/domain/use_case/get_simple_test_student_use_case.dart';
import 'package:school/src/features/student/test/simple/domain/use_case/new_simple_tests_student_use_case.dart';
import 'package:school/src/features/student/test/simple/domain/use_case/started_simple_tests_student_use_case.dart';
import 'package:school/src/features/student/test/simple/domain/use_case/submit_simple_test_student_use_case.dart';

part 'simple_test_student_event.dart';

part 'simple_test_student_state.dart';

class SimpleTestStudentBloc extends Bloc<SimpleTestStudentEvent, SimpleTestStudentState> {
  final NewSimpleTestsStudentUseCase _newSimpleTestsStudentUseCase;
  final StartedSimpleTestsStudentUseCase _startedSimpleTestsStudentUseCase;
  final CompletedSimpleTestsStudentUseCase _completedSimpleTestsStudentUseCase;
  final CreateSimpleTestStudentUseCase _createSimpleTestStudentUseCase;
  final GetSimpleTestStudentUseCase _getSimpleTestStudentUseCase;
  final GetCompletedSimpleTestStudentUseCase _getCompletedSimpleTestStudentUseCase;
  final AnswerSimpleTestStudentUseCase _answerSimpleTestStudentUseCase;
  final SubmitSimpleTestStudentUseCase _submitSimpleTestStudentUseCase;

  SimpleTestStudentBloc(
    this._newSimpleTestsStudentUseCase,
    this._startedSimpleTestsStudentUseCase,
    this._completedSimpleTestsStudentUseCase,
    this._createSimpleTestStudentUseCase,
    this._getSimpleTestStudentUseCase,
    this._answerSimpleTestStudentUseCase,
    this._submitSimpleTestStudentUseCase,
    this._getCompletedSimpleTestStudentUseCase,
  ) : super(SimpleTestStudentState()) {
    on<NewTestsEvent>((event, emit) async {
      await emit.onEach(_onNewTests(event), onData: emit.call);
    });

    on<StartedTestsEvent>((event, emit) async {
      await emit.onEach(_onStartedTests(event), onData: emit.call);
    });

    on<CompletedTestsEvent>((event, emit) async {
      await emit.onEach(_onCompletedTests(event), onData: emit.call);
    });

    on<CreateTestEvent>((event, emit) async {
      await emit.onEach(_onCreateTest(event), onData: emit.call);
    });

    on<GetTestEvent>((event, emit) async {
      await emit.onEach(_onGetTest(event), onData: emit.call);
    });

    on<GetCompleteTestEvent>((event, emit) async {
      await emit.onEach(_onGetCompletedTest(event), onData: emit.call);
    });

    on<SubmitTestEvent>((event, emit) async {
      await emit.onEach(_onSubmitTest(event), onData: emit.call);
    });

    on<AnswerTestEvent>((event, emit) async {
      await emit.onEach(_onAnswerTest(event), onData: emit.call);
    });

    on<ChangeSelectTest>((event, emit) async {
      await emit.onEach(_onChangeTest(event), onData: emit.call);
    });
  }

  changeSelectTest(int index, int id) {
    add(ChangeSelectTest(id: id, index: index));
  }

  newTests() {
    add(NewTestsEvent(isPaging: false));
  }

  pagingNewTests() {
    add(NewTestsEvent(isPaging: true));
  }

  startedTests() {
    add(StartedTestsEvent(isPaging: false));
  }

  pagingStartedTests() {
    add(StartedTestsEvent(isPaging: true));
  }

  completedTests() {
    add(CompletedTestsEvent(isPaging: false));
  }

  pagingCompletedTests() {
    add(CompletedTestsEvent(isPaging: true));
  }

  createTest(CreateSimpleTestStudentBody body) {
    add(CreateTestEvent(body: body));
  }

  getTest(int id) {
    add(GetTestEvent(id: id));
  }

  getCompletedTest(int id) {
    add(GetCompleteTestEvent(id: id));
  }

  submitTest(int id) {
    add(SubmitTestEvent(id: id));
  }

  answerTest(AnswerBody body) {
    add(AnswerTestEvent(body: body));
  }

  Stream<SimpleTestStudentState> _onNewTests(NewTestsEvent event) async* {
    if (!state.reachedMaxNewSimpleTest || !event.isPaging) {
      final page = event.isPaging ? (state.bodyNewSimpleTest?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging, isPagingNewSimpleTest: event.isPaging);
      final dataState = await _newSimpleTestsStudentUseCase.call(
          params: PagingBody(page: page));

      if (dataState is DataSuccess) {
        final newList = dataState.data?.results ?? [];
        yield state.copyWith(
          newSimpleTests: state.isPagingNewSimpleTest
              ? [...state.newSimpleTests, ...newList]
              : newList,
          reachedMaxNewSimpleTest: newList.length < 10,
          bodyNewSimpleTest: (state.bodyNewSimpleTest ?? PagingBody())
              .copyWith(page: page + 1),
        );
      } else if (dataState is DataFailed) {
        yield state.copyWith(hasError: true, errorMessage: dataState.message);
      }
    }
  }

  Stream<SimpleTestStudentState> _onStartedTests(
      StartedTestsEvent event) async* {
    if (!state.reachedMaxStartedSimpleTest || !event.isPaging) {
      final page =
          event.isPaging ? (state.bodyStartedSimpleTest?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging,
          isPagingStartedSimpleTest: event.isPaging);
      final dataState = await _startedSimpleTestsStudentUseCase.call(
          params: PagingBody(page: page));

      if (dataState is DataSuccess) {
        final newList = dataState.data?.results ?? [];
        yield state.copyWith(
          startedSimpleTests: state.isPagingStartedSimpleTest
              ? [...state.startedSimpleTests, ...newList]
              : newList,
          reachedMaxStartedSimpleTest: newList.length < 10,
          bodyStartedSimpleTest: (state.bodyStartedSimpleTest ?? PagingBody())
              .copyWith(page: page + 1),
        );
      } else if (dataState is DataFailed) {
        yield state.copyWith(hasError: true, errorMessage: dataState.message);
      }
    }
  }

  Stream<SimpleTestStudentState> _onCompletedTests(
      CompletedTestsEvent event) async* {
    if (!state.reachedMaxCompletedSimpleTest || !event.isPaging) {
      final page =
          event.isPaging ? (state.bodyCompletedSimpleTest?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging,
          isPagingCompletedSimpleTest: event.isPaging);
      final dataState = await _completedSimpleTestsStudentUseCase.call(
          params: PagingBody(page: page));

      if (dataState is DataSuccess) {
        final newList = dataState.data?.results ?? [];
        yield state.copyWith(
          completedSimpleTests: state.isPagingCompletedSimpleTest
              ? [...state.completedSimpleTests, ...newList]
              : newList,
          reachedMaxCompletedSimpleTest: newList.length < 10,
          bodyCompletedSimpleTest:
              (state.bodyCompletedSimpleTest ?? PagingBody())
                  .copyWith(page: page + 1),
        );
      } else if (dataState is DataFailed) {
        yield state.copyWith(hasError: true, errorMessage: dataState.message);
      }
    }
  }

  Stream<SimpleTestStudentState> _onCreateTest(
      CreateTestEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _createSimpleTestStudentUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(
          createSimpleTestStudentModel: dataState.data,
          isCreatedSimpleTest: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<SimpleTestStudentState> _onGetTest(GetTestEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _getSimpleTestStudentUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(
        getSimpleTestStudentModel: dataState.data,
        selectedTest: List.generate(
            dataState.data?.questions?.length ?? 0,
            (index) => (dataState.data?.questions?[index].answer != null)
                ? (dataState.data?.questions?[index].answer?.id ?? 0)
                : null),
        isGetSimpleTest: true,
      );
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<SimpleTestStudentState> _onGetCompletedTest(
      GetCompleteTestEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _getCompletedSimpleTestStudentUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(
        getCompleteSimpleTestStudentModel: dataState.data,
      );
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<SimpleTestStudentState> _onSubmitTest(
      SubmitTestEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _submitSimpleTestStudentUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(
        isSubmitSimpleTest: true,
      );
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<SimpleTestStudentState> _onAnswerTest(
      AnswerTestEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _answerSimpleTestStudentUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(
        answerSimpleTestStudentModel: dataState.data,
      );
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<SimpleTestStudentState> _onChangeTest(ChangeSelectTest event) async* {
    List<int?>? list = state.selectedTest;
    list?[event.index] = event.id;
    yield state.copyWith(selectedTest: list);
  }
}
