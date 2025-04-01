import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/features/student/home/data/bodies/paging_body.dart';
import 'package:school/src/features/teacher/test/iq/data/models/active_iq_tests_teacher_model.dart';
import 'package:school/src/features/teacher/test/iq/data/models/get_iq_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/score/data/bodies/create_score_test_teacher_body.dart';
import 'package:school/src/features/teacher/test/score/data/models/get_score_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/score/domain/use_case/active_score_tests_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/score/domain/use_case/classes_select_score_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/score/domain/use_case/completed_score_tests_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/score/domain/use_case/create_score_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/score/domain/use_case/delete_score_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/score/domain/use_case/get_score_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/score/domain/use_case/get_students_score_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/score/domain/use_case/student_results_score_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/score/domain/use_case/template_score_tests_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/score/domain/use_case/update_score_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/simple/data/bodies/get_students_simple_test_body.dart';
import 'package:school/src/features/teacher/test/simple/data/models/class_select_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/get_students_simple_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/student_results_simple_test_teacher_model.dart';

part 'score_test_teacher_event.dart';

part 'score_test_teacher_state.dart';

class ScoreTestTeacherBloc
    extends Bloc<ScoreTestTeacherEvent, ScoreTestTeacherState> {
  final ActiveScoreTestsTeacherUseCase _activeScoreTestsTeacherUseCase;
  final TemplateScoreTestsTeacherUseCase _templateScoreTestsTeacherUseCase;
  final CompletedScoreTestsTeacherUseCase _completedScoreTestsTeacherUseCase;
  final GetScoreTestTeacherUseCase _getScoreTestTeacherUseCase;
  final GetStudentsScoreTestTeacherUseCase _getStudentsScoreTestTeacherUseCase;
  final StudentResultsScoreTestTeacherUseCase
      _studentResultsScoreTestTeacherUseCase;
  final CreateScoreTestTeacherUseCase _createScoreTestTeacherUseCase;
  final ClassesSelectScoreTestTeacherUseCase
      _classesSelectScoreTestTeacherUseCase;
  final UpdateScoreTestTeacherUseCase _updateScoreTestTeacherUseCase;
  final DeleteScoreTestTeacherUseCase _deleteScoreTestTeacherUseCase;

  ScoreTestTeacherBloc(
    this._activeScoreTestsTeacherUseCase,
    this._templateScoreTestsTeacherUseCase,
    this._completedScoreTestsTeacherUseCase,
    this._getScoreTestTeacherUseCase,
    this._getStudentsScoreTestTeacherUseCase,
    this._studentResultsScoreTestTeacherUseCase,
    this._createScoreTestTeacherUseCase,
    this._classesSelectScoreTestTeacherUseCase,
    this._updateScoreTestTeacherUseCase,
    this._deleteScoreTestTeacherUseCase,
  ) : super(ScoreTestTeacherState()) {
    on<ActiveTestsEvent>((event, emit) async {
      await emit.onEach(_onActiveTests(event), onData: emit.call);
    });

    on<TemplateTestsEvent>((event, emit) async {
      await emit.onEach(_onTemplateTests(event), onData: emit.call);
    });

    on<CompletedTestsEvent>((event, emit) async {
      await emit.onEach(_onCompletedTests(event), onData: emit.call);
    });

    on<GetTestEvent>((event, emit) async {
      await emit.onEach(_onGetTest(event), onData: emit.call);
    });

    on<DeleteTestEvent>((event, emit) async {
      await emit.onEach(_onDeleteTest(event), onData: emit.call);
    });

    on<GetStudentsTestEvent>((event, emit) async {
      await emit.onEach(_onGetStudentsTest(event), onData: emit.call);
    });

    on<StudentResultsTestEvent>((event, emit) async {
      await emit.onEach(_onStudentResultsTest(event), onData: emit.call);
    });

    on<CreateTestEvent>((event, emit) async {
      await emit.onEach(_onCreateTest(event), onData: emit.call);
    });

    on<UpdateTestEvent>((event, emit) async {
      await emit.onEach(_onUpdateTest(event), onData: emit.call);
    });

    on<ClassesSelectTestEvent>((event, emit) async {
      await emit.onEach(_onClassesSelect(event), onData: emit.call);
    });
  }

  activeTests() {
    add(ActiveTestsEvent(isPaging: false));
  }

  pagingActiveTests() {
    add(ActiveTestsEvent(isPaging: true));
  }

  templateTests() {
    add(TemplateTestsEvent(isPaging: false));
  }

  pagingTemplateTests() {
    add(TemplateTestsEvent(isPaging: true));
  }

  completedTests() {
    add(CompletedTestsEvent(isPaging: false));
  }

  pagingCompletedTests() {
    add(CompletedTestsEvent(isPaging: true));
  }

  getTest(int id) {
    add(GetTestEvent(id: id));
  }

  deleteTest(int id) {
    add(DeleteTestEvent(id: id));
  }

  getStudentsTest(GetStudentsSimpleTestBody body) {
    add(GetStudentsTestEvent(body: body));
  }

  studentResultsTest(GetStudentsSimpleTestBody body) {
    add(StudentResultsTestEvent(body: body));
  }

  createTest(CreateScoreTestTeacherBody body) {
    add(CreateTestEvent(body: body));
  }

  updateTest(CreateScoreTestTeacherBody body) {
    add(UpdateTestEvent(body: body));
  }

  classesSelect() {
    add(ClassesSelectTestEvent());
  }

  Stream<ScoreTestTeacherState> _onActiveTests(ActiveTestsEvent event) async* {
    if (!state.reachedMaxActiveTest || !event.isPaging) {
      final page = event.isPaging ? (state.bodyActiveTest?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging, isPagingActiveTest: event.isPaging);
      final dataState = await _activeScoreTestsTeacherUseCase.call(
          params: PagingBody(page: page));

      if (dataState is DataSuccess) {
        final newList = dataState.data?.results ?? [];
        yield state.copyWith(
          activeTests: state.isPagingActiveTest
              ? [...state.activeTests, ...newList]
              : newList,
          reachedMaxActiveTest: newList.length < 10,
          bodyActiveTest:
              (state.bodyActiveTest ?? PagingBody()).copyWith(page: page + 1),
        );
      } else if (dataState is DataFailed) {
        yield state.copyWith(hasError: true, errorMessage: dataState.message);
      }
    }
  }

  Stream<ScoreTestTeacherState> _onTemplateTests(
      TemplateTestsEvent event) async* {
    if (!state.reachedMaxTemplateTest || !event.isPaging) {
      final page = event.isPaging ? (state.bodyTemplateTest?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging, isPagingTemplateTest: event.isPaging);
      final dataState = await _templateScoreTestsTeacherUseCase.call(
          params: PagingBody(page: page));

      if (dataState is DataSuccess) {
        final newList = dataState.data?.results ?? [];
        yield state.copyWith(
          templateTests: state.isPagingTemplateTest
              ? [...state.templateTests, ...newList]
              : newList,
          reachedMaxTemplateTest: newList.length < 10,
          bodyTemplateTest:
              (state.bodyTemplateTest ?? PagingBody()).copyWith(page: page + 1),
        );
      } else if (dataState is DataFailed) {
        yield state.copyWith(hasError: true, errorMessage: dataState.message);
      }
    }
  }

  Stream<ScoreTestTeacherState> _onCompletedTests(
      CompletedTestsEvent event) async* {
    if (!state.reachedMaxCompletedTest || !event.isPaging) {
      final page = event.isPaging ? (state.bodyCompletedTest?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging, isPagingCompletedTest: event.isPaging);
      final dataState = await _completedScoreTestsTeacherUseCase.call(
          params: PagingBody(page: page));

      if (dataState is DataSuccess) {
        final newList = dataState.data?.results ?? [];
        yield state.copyWith(
          completedTests: state.isPagingCompletedTest
              ? [...state.completedTests, ...newList]
              : newList,
          reachedMaxCompletedTest: newList.length < 10,
          bodyCompletedTest: (state.bodyCompletedTest ?? PagingBody())
              .copyWith(page: page + 1),
        );
      } else if (dataState is DataFailed) {
        yield state.copyWith(hasError: true, errorMessage: dataState.message);
      }
    }
  }

  Stream<ScoreTestTeacherState> _onGetTest(GetTestEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _getScoreTestTeacherUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      getStudentsTest(GetStudentsSimpleTestBody(
          id: dataState.data?.id ?? 0,
          classId: dataState.data?.classes?[0].id ?? 0));
      yield state.copyWith(getTestTeacherModel: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<ScoreTestTeacherState> _onDeleteTest(DeleteTestEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _deleteScoreTestTeacherUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(isDeleteTest: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<ScoreTestTeacherState> _onGetStudentsTest(
      GetStudentsTestEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _getStudentsScoreTestTeacherUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(getStudentsTestTeacherModel: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<ScoreTestTeacherState> _onStudentResultsTest(
      StudentResultsTestEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _studentResultsScoreTestTeacherUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(studentResultsTestTeacherModel: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<ScoreTestTeacherState> _onCreateTest(CreateTestEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _createScoreTestTeacherUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(isCreatedTest: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<ScoreTestTeacherState> _onUpdateTest(UpdateTestEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _updateScoreTestTeacherUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(isUpdateTest: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<ScoreTestTeacherState> _onClassesSelect(
      ClassesSelectTestEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _classesSelectScoreTestTeacherUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(classesSelect: dataState.data, isSubmitTest: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }
}
