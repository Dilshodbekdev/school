import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/features/student/home/data/bodies/paging_body.dart';
import 'package:school/src/features/teacher/test/simple/data/bodies/create_simple_test_body.dart';
import 'package:school/src/features/teacher/test/simple/data/bodies/get_students_simple_test_body.dart';
import 'package:school/src/features/teacher/test/simple/data/models/active_simple_tests_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/class_select_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/get_simple_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/get_students_simple_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/student_results_simple_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/domain/use_case/active_simple_tests_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/simple/domain/use_case/classes_select_simple_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/simple/domain/use_case/completed_simple_tests_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/simple/domain/use_case/create_simple_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/simple/domain/use_case/delete_simple_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/simple/domain/use_case/get_simple_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/simple/domain/use_case/get_students_simple_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/simple/domain/use_case/student_results_simple_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/simple/domain/use_case/template_simple_tests_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/simple/domain/use_case/update_simple_test_teacher_use_case.dart';

part 'simple_test_teacher_event.dart';

part 'simple_test_teacher_state.dart';

class SimpleTestTeacherBloc extends Bloc<SimpleTestTeacherEvent, SimpleTestTeacherState> {
  final ActiveSimpleTestsTeacherUseCase _activeSimpleTestsTeacherUseCase;
  final TemplateSimpleTestsTeacherUseCase _templateSimpleTestsTeacherUseCase;
  final CompletedSimpleTestsTeacherUseCase _completedSimpleTestsTeacherUseCase;
  final GetSimpleTestTeacherUseCase _getSimpleTestTeacherUseCase;
  final GetStudentsSimpleTestTeacherUseCase _getStudentsSimpleTestTeacherUseCase;
  final StudentResultsSimpleTestTeacherUseCase _studentResultsSimpleTestTeacherUseCase;
  final CreateSimpleTestTeacherUseCase _createSimpleTestTeacherUseCase;
  final ClassesSelectSimpleTestTeacherUseCase _classesSelectSimpleTestTeacherUseCase;
  final UpdateSimpleTestTeacherUseCase _updateSimpleTestTeacherUseCase;
  final DeleteSimpleTestTeacherUseCase _deleteSimpleTestTeacherUseCase;

  SimpleTestTeacherBloc(
    this._activeSimpleTestsTeacherUseCase,
    this._templateSimpleTestsTeacherUseCase,
    this._completedSimpleTestsTeacherUseCase,
    this._getSimpleTestTeacherUseCase,
    this._getStudentsSimpleTestTeacherUseCase,
    this._studentResultsSimpleTestTeacherUseCase,
    this._createSimpleTestTeacherUseCase,
    this._classesSelectSimpleTestTeacherUseCase,
    this._updateSimpleTestTeacherUseCase,
    this._deleteSimpleTestTeacherUseCase,
  ) : super(SimpleTestTeacherState()) {
    on<ActiveSimpleTestsEvent>((event, emit) async {
      await emit.onEach(_onActiveSimpleTests(event), onData: emit.call);
    });

    on<TemplateSimpleTestsEvent>((event, emit) async {
      await emit.onEach(_onTemplateSimpleTests(event), onData: emit.call);
    });

    on<CompletedSimpleTestsEvent>((event, emit) async {
      await emit.onEach(_onCompletedSimpleTests(event), onData: emit.call);
    });

    on<GetSimpleTestEvent>((event, emit) async {
      await emit.onEach(_onGetSimpleTest(event), onData: emit.call);
    });

    on<DeleteSimpleTestEvent>((event, emit) async {
      await emit.onEach(_onDeleteSimpleTest(event), onData: emit.call);
    });

    on<GetStudentsSimpleTestEvent>((event, emit) async {
      await emit.onEach(_onGetStudentsSimpleTest(event), onData: emit.call);
    });

    on<StudentResultsSimpleTestEvent>((event, emit) async {
      await emit.onEach(_onStudentResultsSimpleTest(event), onData: emit.call);
    });

    on<CreateSimpleTestEvent>((event, emit) async {
      await emit.onEach(_onCreateSimpleTest(event), onData: emit.call);
    });

    on<UpdateSimpleTestEvent>((event, emit) async {
      await emit.onEach(_onUpdateSimpleTest(event), onData: emit.call);
    });

    on<ClassesSelectTestEvent>((event, emit) async {
      await emit.onEach(_onClassesSelect(event), onData: emit.call);
    });
  }

  activeSimpleTests() {
    add(ActiveSimpleTestsEvent(isPaging: false));
  }

  pagingActiveSimpleTests() {
    add(ActiveSimpleTestsEvent(isPaging: true));
  }

  templateSimpleTests() {
    add(TemplateSimpleTestsEvent(isPaging: false));
  }

  pagingTemplateSimpleTests() {
    add(TemplateSimpleTestsEvent(isPaging: true));
  }

  completedSimpleTests() {
    add(CompletedSimpleTestsEvent(isPaging: false));
  }

  pagingCompletedSimpleTests() {
    add(CompletedSimpleTestsEvent(isPaging: true));
  }

  getSimpleTest(int id) {
    add(GetSimpleTestEvent(id: id));
  }

  deleteSimpleTest(int id) {
    add(DeleteSimpleTestEvent(id: id));
  }

  getStudentsSimpleTest(GetStudentsSimpleTestBody body) {
    add(GetStudentsSimpleTestEvent(body: body));
  }

  studentResultsSimpleTest(GetStudentsSimpleTestBody body) {
    add(StudentResultsSimpleTestEvent(body: body));
  }

  createSimpleTest(CreateSimpleTestBody body) {
    add(CreateSimpleTestEvent(body: body));
  }

  updateSimpleTest(CreateSimpleTestBody body) {
    add(UpdateSimpleTestEvent(body: body));
  }

  classesSelect() {
    add(ClassesSelectTestEvent());
  }

  Stream<SimpleTestTeacherState> _onActiveSimpleTests(
      ActiveSimpleTestsEvent event) async* {
    if (!state.reachedMaxActiveSimpleTest || !event.isPaging) {
      final page = event.isPaging ? (state.bodyActiveSimpleTest?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging, isPagingActiveSimpleTest: event.isPaging);
      final dataState = await _activeSimpleTestsTeacherUseCase.call(
          params: PagingBody(page: page));

      if (dataState is DataSuccess) {
        final newList = dataState.data?.results ?? [];
        yield state.copyWith(
          activeSimpleTests: state.isPagingActiveSimpleTest
              ? [...state.activeSimpleTests, ...newList]
              : newList,
          reachedMaxActiveSimpleTest: newList.length < 10,
          bodyActiveSimpleTest: (state.bodyActiveSimpleTest ?? PagingBody()).copyWith(page: page + 1),
        );
      } else if (dataState is DataFailed) {
        yield state.copyWith(hasError: true, errorMessage: dataState.message);
      }
    }
  }

  Stream<SimpleTestTeacherState> _onTemplateSimpleTests(
      TemplateSimpleTestsEvent event) async* {
    if (!state.reachedMaxTemplateSimpleTest || !event.isPaging) {
      final page =
          event.isPaging ? (state.bodyTemplateSimpleTest?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging,
          isPagingTemplateSimpleTest: event.isPaging);
      final dataState = await _templateSimpleTestsTeacherUseCase.call(
          params: PagingBody(page: page));

      if (dataState is DataSuccess) {
        final newList = dataState.data?.results ?? [];
        yield state.copyWith(
          templateSimpleTests: state.isPagingTemplateSimpleTest
              ? [...state.templateSimpleTests, ...newList]
              : newList,
          reachedMaxTemplateSimpleTest: newList.length < 10,
          bodyTemplateSimpleTest: (state.bodyTemplateSimpleTest ?? PagingBody())
              .copyWith(page: page + 1),
        );
      } else if (dataState is DataFailed) {
        yield state.copyWith(hasError: true, errorMessage: dataState.message);
      }
    }
  }

  Stream<SimpleTestTeacherState> _onCompletedSimpleTests(
      CompletedSimpleTestsEvent event) async* {
    if (!state.reachedMaxCompletedSimpleTest || !event.isPaging) {
      final page =
          event.isPaging ? (state.bodyCompletedSimpleTest?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging,
          isPagingCompletedSimpleTest: event.isPaging);
      final dataState = await _completedSimpleTestsTeacherUseCase.call(
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

  Stream<SimpleTestTeacherState> _onGetSimpleTest(GetSimpleTestEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _getSimpleTestTeacherUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      getStudentsSimpleTest(GetStudentsSimpleTestBody(
          id: dataState.data?.id ?? 0,
          classId: dataState.data?.classes?[0].id ?? 0));
      yield state.copyWith(getSimpleTestTeacherModel: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<SimpleTestTeacherState> _onDeleteSimpleTest(DeleteSimpleTestEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _deleteSimpleTestTeacherUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(isDeleteSimpleTest: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<SimpleTestTeacherState> _onGetStudentsSimpleTest(
      GetStudentsSimpleTestEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _getStudentsSimpleTestTeacherUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(getStudentsSimpleTestTeacherModel: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<SimpleTestTeacherState> _onStudentResultsSimpleTest(
      StudentResultsSimpleTestEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _studentResultsSimpleTestTeacherUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(
          studentResultsSimpleTestTeacherModel: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<SimpleTestTeacherState> _onCreateSimpleTest(
      CreateSimpleTestEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _createSimpleTestTeacherUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(isCreatedSimpleTest: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<SimpleTestTeacherState> _onUpdateSimpleTest(
      UpdateSimpleTestEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
    await _updateSimpleTestTeacherUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(isUpdateSimpleTest: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<SimpleTestTeacherState> _onClassesSelect(
      ClassesSelectTestEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _classesSelectSimpleTestTeacherUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(
          classesSelect: dataState.data, isSubmitSimpleTest: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }
}
