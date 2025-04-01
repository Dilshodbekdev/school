import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/features/student/diary/data/models/diary_student_model.dart';
import 'package:school/src/features/student/diary/data/models/quarterly_diary_model.dart';
import 'package:school/src/features/student/diary/domain/use_case/date_diary_student_use_case.dart';
import 'package:school/src/features/student/diary/domain/use_case/quarterly_diary_student_use_case.dart';
import 'package:school/src/features/student/diary/domain/use_case/yearly_diary_student_use_case.dart';

part 'diary_student_event.dart';

part 'diary_student_state.dart';

class DiaryStudentBloc extends Bloc<DiaryStudentEvent, DiaryStudentState> {
  final DateDiaryStudentUseCase _dateDiaryStudentUseCase;
  final QuarterlyDiaryStudentUseCase _quarterlyDiaryStudentUseCase;
  final YearlyDiaryStudentUseCase _yearlyDiaryStudentUseCase;

  DiaryStudentBloc(
    this._dateDiaryStudentUseCase,
    this._quarterlyDiaryStudentUseCase,
    this._yearlyDiaryStudentUseCase,
  ) : super(DiaryStudentState()) {
    on<DateDiariesEvent>((event, emit) async {
      await emit.onEach(_onDateDiaries(event), onData: emit.call);
    });

    on<QuarterlyDiariesEvent>((event, emit) async {
      await emit.onEach(_onQuarterlyDiaries(event), onData: emit.call);
    });

    on<YearlyDiariesEvent>((event, emit) async {
      await emit.onEach(_onYearlyDiaries(event), onData: emit.call);
    });

    on<ChangeDateEvent>((event, emit) async {
      emit(state.copyWith(date: event.date));
    });
  }

  changeDate(DateTime date) {
    add(ChangeDateEvent(date: date));
  }

  dateDiaries(String? date) {
    add(DateDiariesEvent(date: date));
  }

  quarterlyDiaries(int quarter) {
    add(QuarterlyDiariesEvent(quarter: quarter));
  }

  yearlyDiaries() {
    add(YearlyDiariesEvent());
  }

  Stream<DiaryStudentState> _onDateDiaries(DateDiariesEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _dateDiaryStudentUseCase.call(params: event.date);

    if (dataState is DataSuccess) {
      yield state.copyWith(dateDiary: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<DiaryStudentState> _onQuarterlyDiaries(QuarterlyDiariesEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _quarterlyDiaryStudentUseCase.call(params: event.quarter);

    if (dataState is DataSuccess) {
      yield state.copyWith(quarterlyDiary: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<DiaryStudentState> _onYearlyDiaries(YearlyDiariesEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _yearlyDiaryStudentUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(yearlyDiary: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }
}
