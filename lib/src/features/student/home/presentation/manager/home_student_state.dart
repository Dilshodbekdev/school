part of 'home_student_bloc.dart';

class HomeStudentState {
  final List<NewStudentModel> places;
  final NewDetailsStudentModel? newDetailsStudentModel;
  final MenuModel? currentDayMenu;
  final List<MenuModel>? menu;
  final List<TimetableStudentModel>? timetables;
  final List<TimeStudentModel>? times;
  final List<ScienceStudentModel>? sciences;
  final List<RatingStudentModel>? rating;
  final List<QuarterStudentModel>? quarters;
  final QuarterStudentModel? currentQuarter;
  final DateTime? currentDate;
  final List<StatisticStudentAttendanceModel>? statisticStudentAttendance;
  final List<StatisticStudentAppropriationModel>? statisticStudentAppropriation;
  final bool isLoading;
  final bool isMenu;
  final PagingBody? body;
  final bool isPaging;
  final bool reachedMax;
  final bool hasError;
  final String errorMessage;

  HomeStudentState({
    this.places = const [],
    this.newDetailsStudentModel,
    this.currentDayMenu,
    this.menu,
    this.timetables,
    this.times,
    this.sciences,
    this.rating,
    this.quarters,
    this.currentQuarter,
    this.currentDate,
    this.statisticStudentAttendance,
    this.statisticStudentAppropriation,
    this.isLoading = false,
    this.isMenu = false,
    this.body,
    this.isPaging = false,
    this.reachedMax = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  HomeStudentState copyWith({
    List<NewStudentModel>? places,
    NewDetailsStudentModel? newDetailsStudentModel,
    MenuModel? currentDayMenu,
    List<MenuModel>? menu,
    List<TimetableStudentModel>? timetables,
    List<TimeStudentModel>? times,
    List<ScienceStudentModel>? sciences,
    List<RatingStudentModel>? rating,
    List<QuarterStudentModel>? quarters,
    QuarterStudentModel? currentQuarter,
    DateTime? currentDate,
    List<StatisticStudentAttendanceModel>? statisticStudentAttendance,
    List<StatisticStudentAppropriationModel>? statisticStudentAppropriation,
    bool? isLoading,
    bool? isMenu,
    PagingBody? body,
    bool? isPaging,
    bool? reachedMax,
    bool? hasError,
    String? errorMessage,
  }) =>
      HomeStudentState(
        places: places ?? this.places,
        newDetailsStudentModel: newDetailsStudentModel,
        currentDayMenu: currentDayMenu ?? this.currentDayMenu,
        menu: menu,
        timetables: timetables ?? this.timetables,
        times: times ?? this.times,
        sciences: sciences??this.sciences,
        rating: rating,
        quarters: quarters ?? this.quarters,
        currentQuarter: currentQuarter ?? this.currentQuarter,
        currentDate: currentDate ?? this.currentDate,
        statisticStudentAttendance: statisticStudentAttendance ?? this.statisticStudentAttendance,
        statisticStudentAppropriation: statisticStudentAppropriation ?? this.statisticStudentAppropriation,
        isLoading: isLoading ?? false,
        isMenu: isMenu ?? false,
        body: body ?? this.body,
        isPaging: isPaging ?? false,
        reachedMax: reachedMax ?? this.reachedMax,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
