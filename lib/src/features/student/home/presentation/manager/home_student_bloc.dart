import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/features/student/home/data/bodies/menu_weekday_body.dart';
import 'package:school/src/features/student/home/data/bodies/paging_body.dart';
import 'package:school/src/features/student/home/data/bodies/rating_body.dart';
import 'package:school/src/features/student/home/data/bodies/science_body.dart';
import 'package:school/src/features/student/home/data/models/menu_model.dart';
import 'package:school/src/features/student/home/data/models/new_details_student_model.dart';
import 'package:school/src/features/student/home/data/models/news_student_model.dart';
import 'package:school/src/features/student/home/data/models/quarter_student_model.dart';
import 'package:school/src/features/student/home/data/models/rating_student_model.dart';
import 'package:school/src/features/student/home/data/models/science_student_model.dart';
import 'package:school/src/features/student/home/data/models/statistic_student_appropriation_model.dart';
import 'package:school/src/features/student/home/data/models/statistic_student_attendance_model.dart';
import 'package:school/src/features/student/home/data/models/time_student_model.dart';
import 'package:school/src/features/student/home/data/models/timetable_student_model.dart';
import 'package:school/src/features/student/home/domain/use_case/current_quarter_student_use_case.dart';
import 'package:school/src/features/student/home/domain/use_case/menu_student_use_case.dart';
import 'package:school/src/features/student/home/domain/use_case/menu_weekday_student_use_case.dart';
import 'package:school/src/features/student/home/domain/use_case/new_details_student_use_case.dart';
import 'package:school/src/features/student/home/domain/use_case/news_student_use_case.dart';
import 'package:school/src/features/student/home/domain/use_case/quarters_student_use_case.dart';
import 'package:school/src/features/student/home/domain/use_case/rating_student_use_case.dart';
import 'package:school/src/features/student/home/domain/use_case/sciences_student_use_case.dart';
import 'package:school/src/features/student/home/domain/use_case/statistic_student_appropriation_student_use_case.dart';
import 'package:school/src/features/student/home/domain/use_case/statistic_student_attendance_student_use_case.dart';
import 'package:school/src/features/student/home/domain/use_case/times_student_use_case.dart';
import 'package:school/src/features/student/home/domain/use_case/timetable_student_use_case.dart';

part 'home_student_event.dart';

part 'home_student_state.dart';

class HomeStudentBloc extends Bloc<HomeStudentEvent, HomeStudentState> {
  final NewsStudentUseCase _newsStudentUseCase;
  final NewDetailsStudentUseCase _newDetailsStudentUseCase;
  final MenuWeekdayStudentUseCase _menuWeekdayStudentUseCase;
  final MenuStudentUseCase _menuStudentUseCase;
  final TimetableStudentUseCase _timetableStudentUseCase;
  final TimesStudentUseCase _timesStudentUseCase;
  final SciencesStudentUseCase _sciencesStudentUseCase;
  final RatingStudentUseCase _ratingStudentUseCase;
  final QuartersStudentUseCase _quartersStudentUseCase;
  final CurrentQuarterStudentUseCase _currentQuarterStudentUseCase;
  final StatisticStudentAttendanceStudentUseCase
      _statisticStudentAttendanceStudentUseCase;
  final StatisticStudentAppropriationStudentUseCase
      _statisticStudentAppropriationStudentUseCase;

  HomeStudentBloc(
    this._newsStudentUseCase,
    this._menuWeekdayStudentUseCase,
    this._timetableStudentUseCase,
    this._timesStudentUseCase,
    this._quartersStudentUseCase,
    this._statisticStudentAttendanceStudentUseCase,
    this._statisticStudentAppropriationStudentUseCase,
    this._sciencesStudentUseCase,
    this._ratingStudentUseCase,
    this._menuStudentUseCase,
    this._currentQuarterStudentUseCase,
    this._newDetailsStudentUseCase,
  ) : super(HomeStudentState()) {
    on<HomeStudentNewsEvent>((event, emit) async {
      await emit.onEach(_onNews(event), onData: emit.call);
    });

    on<CurrentDayMenuEvent>((event, emit) async {
      await emit.onEach(_onCurrentDayMenu(event), onData: emit.call);
    });

    on<MenuEvent>((event, emit) async {
      await emit.onEach(_onMenu(event), onData: emit.call);
    });

    on<TimetableEvent>((event, emit) async {
      await emit.onEach(_onTimetable(event), onData: emit.call);
    });

    on<TimesEvent>((event, emit) async {
      await emit.onEach(_onTimes(event), onData: emit.call);
    });

    on<SciencesEvent>((event, emit) async {
      await emit.onEach(_onSciences(event), onData: emit.call);
    });

    on<RatingEvent>((event, emit) async {
      await emit.onEach(_onRating(event), onData: emit.call);
    });

    on<QuartersEvent>((event, emit) async {
      await emit.onEach(_onQuarters(event), onData: emit.call);
    });

    on<NewDetailsEvent>((event, emit) async {
      await emit.onEach(_onNewDetails(event), onData: emit.call);
    });

    on<CurrentQuarterEvent>((event, emit) async {
      await emit.onEach(_onCurrentQuarter(event), onData: emit.call);
    });

    on<StatisticStudentAttendanceEvent>((event, emit) async {
      await emit.onEach(_onStatisticStudentAttendance(event),
          onData: emit.call);
    });

    on<StatisticStudentAppropriationEvent>((event, emit) async {
      await emit.onEach(_onStatisticStudentAppropriation(event),
          onData: emit.call);
    });

    on<ChangeCurrentDateEvent>((event, emit) async {
      emit(state.copyWith(currentDate: event.date));
    });
  }

  changeCurrentDate(DateTime date) {
    add(ChangeCurrentDateEvent(date: date));
  }

  news() {
    add(HomeStudentNewsEvent(isPaging: false));
  }

  pagingNews() {
    add(HomeStudentNewsEvent(isPaging: true));
  }

  currentDayMenu(MenuWeekdayBody body) {
    add(CurrentDayMenuEvent(body: body));
  }

  menu() {
    add(MenuEvent());
  }

  sciences(ScienceBody body) {
    add(SciencesEvent(body: body));
  }

  rating(RatingBody body) {
    add(RatingEvent(body: body));
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

  newDetails(int id) {
    add(NewDetailsEvent(id: id));
  }

  currentQuarter() {
    add(CurrentQuarterEvent());
  }

  statisticStudentAttendance(int quarter) {
    add(StatisticStudentAttendanceEvent(quarter: quarter));
  }

  statisticStudentAppropriation(int quarter) {
    add(StatisticStudentAppropriationEvent(quarter: quarter));
  }

  Stream<HomeStudentState> _onNews(HomeStudentNewsEvent event) async* {
    if (!state.reachedMax || !event.isPaging) {
      final page = event.isPaging ? (state.body?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging, isPaging: event.isPaging);
      final dataState =
          await _newsStudentUseCase.call(params: PagingBody(page: page));

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

  Stream<HomeStudentState> _onNewDetails(NewDetailsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _newDetailsStudentUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(newDetailsStudentModel: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeStudentState> _onCurrentDayMenu(CurrentDayMenuEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _menuWeekdayStudentUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(currentDayMenu: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeStudentState> _onMenu(MenuEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _menuStudentUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(menu: dataState.data, isMenu: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeStudentState> _onTimetable(TimetableEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _timetableStudentUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(timetables: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeStudentState> _onTimes(TimesEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _timesStudentUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(times: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeStudentState> _onSciences(SciencesEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _sciencesStudentUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      rating(RatingBody(
          science: dataState.data?.first.value ?? 0,
          quarterNumber: state.currentQuarter?.number ?? 0));
      yield state.copyWith(sciences: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeStudentState> _onRating(RatingEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _ratingStudentUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(rating: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeStudentState> _onQuarters(QuartersEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _quartersStudentUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(quarters: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeStudentState> _onCurrentQuarter(CurrentQuarterEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _currentQuarterStudentUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      statisticStudentAttendance(dataState.data?.number ?? 0);
      statisticStudentAppropriation(dataState.data?.number ?? 0);
      yield state.copyWith(currentQuarter: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeStudentState> _onStatisticStudentAttendance(
      StatisticStudentAttendanceEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _statisticStudentAttendanceStudentUseCase.call(
        params: event.quarter);

    if (dataState is DataSuccess) {
      yield state.copyWith(statisticStudentAttendance: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeStudentState> _onStatisticStudentAppropriation(
      StatisticStudentAppropriationEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _statisticStudentAppropriationStudentUseCase.call(
        params: event.quarter);

    if (dataState is DataSuccess) {
      yield state.copyWith(statisticStudentAppropriation: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }
}
