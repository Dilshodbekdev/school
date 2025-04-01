import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/features/student/home/data/bodies/paging_body.dart';
import 'package:school/src/features/student/home/data/models/new_details_student_model.dart';
import 'package:school/src/features/student/home/data/models/news_student_model.dart';
import 'package:school/src/features/student/home/data/models/quarter_student_model.dart';
import 'package:school/src/features/student/home/data/models/time_student_model.dart';
import 'package:school/src/features/student/home/data/models/timetable_student_model.dart';
import 'package:school/src/features/teacher/home/data/bodies/record_body.dart';
import 'package:school/src/features/teacher/home/data/models/my_record_teacher_model.dart';
import 'package:school/src/features/teacher/home/data/models/record_teacher_model.dart';
import 'package:school/src/features/teacher/home/domain/use_case/current_quarter_teacher_use_case.dart';
import 'package:school/src/features/teacher/home/domain/use_case/my_records_teacher_use_case.dart';
import 'package:school/src/features/teacher/home/domain/use_case/new_details_teacher_use_case.dart';
import 'package:school/src/features/teacher/home/domain/use_case/news_teacher_use_case.dart';
import 'package:school/src/features/teacher/home/domain/use_case/quarters_teacher_use_case.dart';
import 'package:school/src/features/teacher/home/domain/use_case/record_teacher_use_case.dart';
import 'package:school/src/features/teacher/home/domain/use_case/times_teacher_use_case.dart';
import 'package:school/src/features/teacher/home/domain/use_case/timetable_teacher_use_case.dart';

part 'home_teacher_event.dart';

part 'home_teacher_state.dart';

class HomeTeacherBloc extends Bloc<HomeTeacherEvent, HomeTeacherState> {
  final NewsTeacherUseCase _newsTeacherUseCase;
  final TimetableTeacherUseCase _timetableTeacherUseCase;
  final TimesTeacherUseCase _timesTeacherUseCase;
  final QuartersTeacherUseCase _quartersTeacherUseCase;
  final CurrentQuarterTeacherUseCase _currentQuarterTeacherUseCase;
  final NewDetailsTeacherUseCase _newDetailsTeacherUseCase;
  final MyRecordsTeacherUseCase _myRecordsTeacherUseCase;
  final RecordTeacherUseCase _recordTeacherUseCase;

  HomeTeacherBloc(
    this._newsTeacherUseCase,
    this._quartersTeacherUseCase,
    this._timetableTeacherUseCase,
    this._timesTeacherUseCase,
    this._myRecordsTeacherUseCase,
    this._recordTeacherUseCase,
    this._currentQuarterTeacherUseCase, this._newDetailsTeacherUseCase,
  ) : super(HomeTeacherState()) {
    on<NewsEvent>((event, emit) async {
      await emit.onEach(_onNews(event), onData: emit.call);
    });

    on<TimetableEvent>((event, emit) async {
      await emit.onEach(_onTimetable(event), onData: emit.call);
    });

    on<TimesEvent>((event, emit) async {
      await emit.onEach(_onTimes(event), onData: emit.call);
    });

    on<QuartersEvent>((event, emit) async {
      await emit.onEach(_onQuarters(event), onData: emit.call);
    });

    on<CurrentQuarterEvent>((event, emit) async {
      await emit.onEach(_onCurrentQuarter(event), onData: emit.call);
    });

    on<NewDetailsEvent>((event, emit) async {
      await emit.onEach(_onNewDetails(event), onData: emit.call);
    });

    on<MyRecordsEvent>((event, emit) async {
      await emit.onEach(_onMyRecords(event), onData: emit.call);
    });

    on<RecordEvent>((event, emit) async {
      await emit.onEach(_onRecord(event), onData: emit.call);
    });

    on<ChangeCurrentDateEvent>((event, emit) async{
      emit(state.copyWith(currentDate: event.date));
    });
  }

  changeCurrentDate(DateTime date){
    add(ChangeCurrentDateEvent(date: date));
  }

  news() {
    add(NewsEvent(isPaging: false));
  }

  pagingNews() {
    add(NewsEvent(isPaging: true));
  }

  timetable() {
    add(TimetableEvent());
  }

  times() {
    add(TimesEvent());
  }

  quarters() {
    add(QuartersEvent());
  }

  currentQuarter() {
    add(CurrentQuarterEvent());
  }

  newDetails(int id) {
    add(NewDetailsEvent(id: id));
  }

  myRecords() {
    add(MyRecordsEvent());
  }

  record(RecordBody body) {
    add(RecordEvent(body: body));
  }

  Stream<HomeTeacherState> _onNews(NewsEvent event) async* {
    if (!state.reachedMax || !event.isPaging) {
      final page = event.isPaging ? (state.body?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging, isPaging: event.isPaging);
      final dataState =
          await _newsTeacherUseCase.call(params: PagingBody(page: page));

      if (dataState is DataSuccess) {
        final newList = dataState.data?.results ?? [];
        yield state.copyWith(
          places: state.isPaging ? [...state.places, ...newList] : newList,
          reachedMax: newList.length < 10,
          body: (state.body ?? PagingBody()).copyWith(page: page + 1),
        );
      } else if (dataState is DataFailed) {
        yield state.copyWith(hasError: true, errorMessage: dataState.message);
      }
    }
  }

  Stream<HomeTeacherState> _onTimetable(TimetableEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _timetableTeacherUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(timetables: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeTeacherState> _onTimes(TimesEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _timesTeacherUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(times: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeTeacherState> _onQuarters(QuartersEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _quartersTeacherUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(quarters: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeTeacherState> _onCurrentQuarter(CurrentQuarterEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _currentQuarterTeacherUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(currentQuarter: dataState.data,isCurrentQuarter: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeTeacherState> _onNewDetails(NewDetailsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _newDetailsTeacherUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(newDetailsStudentModel: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeTeacherState> _onMyRecords(MyRecordsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _myRecordsTeacherUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(myRecords: dataState.data, isMyRecord: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeTeacherState> _onRecord(RecordEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _recordTeacherUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(recordTeacherModel: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }
}
