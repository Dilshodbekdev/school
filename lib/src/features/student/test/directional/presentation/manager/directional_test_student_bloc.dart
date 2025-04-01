import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/features/student/home/data/bodies/paging_body.dart';
import 'package:school/src/features/student/test/directional/data/models/get_directional_test_student_model.dart';
import 'package:school/src/features/student/test/directional/domain/use_case/answer_directional_test_student_use_case.dart';
import 'package:school/src/features/student/test/directional/domain/use_case/completed_directional_tests_student_use_case.dart';
import 'package:school/src/features/student/test/directional/domain/use_case/create_directional_test_student_use_case.dart';
import 'package:school/src/features/student/test/directional/domain/use_case/get_completed_directional_test_student_use_case.dart';
import 'package:school/src/features/student/test/directional/domain/use_case/get_directional_test_student_use_case.dart';
import 'package:school/src/features/student/test/directional/domain/use_case/new_directional_tests_student_use_case.dart';
import 'package:school/src/features/student/test/directional/domain/use_case/started_directional_tests_student_use_case.dart';
import 'package:school/src/features/student/test/directional/domain/use_case/submit_directional_test_student_use_case.dart';
import 'package:school/src/features/student/test/iq/data/models/new_iq_tests_student_model.dart';
import 'package:school/src/features/student/test/simple/data/bodies/answer_body.dart';
import 'package:school/src/features/student/test/simple/data/bodies/create_simple_test_student_body.dart';
import 'package:school/src/features/student/test/simple/data/models/answer_simple_test_student_model.dart';
import 'package:school/src/features/student/test/simple/data/models/get_complete_simple_test_student_model.dart';
import 'package:school/src/features/student/test/simple/data/models/get_simple_test_student_model.dart';
import 'package:school/src/features/student/test/simple/data/models/started_simple_tests_student_model.dart';

part 'directional_test_student_event.dart';

part 'directional_test_student_state.dart';

class DirectionalTestStudentBloc
    extends Bloc<DirectionalTestStudentEvent, DirectionalTestStudentState> {
  final NewDirectionalTestsStudentUseCase _newDirectionalTestsStudentUseCase;
  final StartedDirectionalTestsStudentUseCase
      _startedDirectionalTestsStudentUseCase;
  final CompletedDirectionalTestsStudentUseCase
      _completedDirectionalTestsStudentUseCase;
  final CreateDirectionalTestStudentUseCase
      _createDirectionalTestStudentUseCase;
  final GetDirectionalTestStudentUseCase _getDirectionalTestStudentUseCase;
  final GetCompletedDirectionalTestStudentUseCase
      _getCompletedDirectionalTestStudentUseCase;
  final AnswerDirectionalTestStudentUseCase
      _answerDirectionalTestStudentUseCase;
  final SubmitDirectionalTestStudentUseCase
      _submitDirectionalTestStudentUseCase;

  DirectionalTestStudentBloc(
    this._newDirectionalTestsStudentUseCase,
    this._startedDirectionalTestsStudentUseCase,
    this._completedDirectionalTestsStudentUseCase,
    this._createDirectionalTestStudentUseCase,
    this._getDirectionalTestStudentUseCase,
    this._getCompletedDirectionalTestStudentUseCase,
    this._answerDirectionalTestStudentUseCase,
    this._submitDirectionalTestStudentUseCase,
  ) : super(DirectionalTestStudentState()) {
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

  Stream<DirectionalTestStudentState> _onNewTests(NewTestsEvent event) async* {
    if (!state.reachedMaxNewSimpleTest || !event.isPaging) {
      final page = event.isPaging ? (state.bodyNewSimpleTest?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging, isPagingNewSimpleTest: event.isPaging);
      final dataState =
          await _newDirectionalTestsStudentUseCase.call(params: PagingBody(page: page));

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

  Stream<DirectionalTestStudentState> _onStartedTests(
      StartedTestsEvent event) async* {
    if (!state.reachedMaxStartedSimpleTest || !event.isPaging) {
      final page =
          event.isPaging ? (state.bodyStartedSimpleTest?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging,
          isPagingStartedSimpleTest: event.isPaging);
      final dataState = await _startedDirectionalTestsStudentUseCase.call(
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

  Stream<DirectionalTestStudentState> _onCompletedTests(
      CompletedTestsEvent event) async* {
    if (!state.reachedMaxCompletedSimpleTest || !event.isPaging) {
      final page =
          event.isPaging ? (state.bodyCompletedSimpleTest?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging,
          isPagingCompletedSimpleTest: event.isPaging);
      final dataState = await _completedDirectionalTestsStudentUseCase.call(
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

  Stream<DirectionalTestStudentState> _onCreateTest(
      CreateTestEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _createDirectionalTestStudentUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(
          createSimpleTestStudentModel: dataState.data,
          isCreatedSimpleTest: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<DirectionalTestStudentState> _onGetTest(GetTestEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _getDirectionalTestStudentUseCase.call(params: event.id);

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

  Stream<DirectionalTestStudentState> _onGetCompletedTest(
      GetCompleteTestEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _getCompletedDirectionalTestStudentUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(
        getCompleteSimpleTestStudentModel: dataState.data,
      );
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<DirectionalTestStudentState> _onSubmitTest(
      SubmitTestEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _submitDirectionalTestStudentUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(
        isSubmitSimpleTest: true,
      );
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<DirectionalTestStudentState> _onAnswerTest(
      AnswerTestEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _answerDirectionalTestStudentUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(
        answerSimpleTestStudentModel: dataState.data,
      );
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<DirectionalTestStudentState> _onChangeTest(
      ChangeSelectTest event) async* {
    List<int?>? list = state.selectedTest;
    list?[event.index] = event.id;
    yield state.copyWith(selectedTest: list);
  }
}
