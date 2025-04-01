part of 'home_teacher_bloc.dart';

class HomeTeacherState {
  final List<NewStudentModel> places;
  final List<TimetableStudentModel>? timetables;
  final List<TimeStudentModel>? times;
  final List<QuarterStudentModel>? quarters;
  final QuarterStudentModel? currentQuarter;
  final NewDetailsStudentModel? newDetailsStudentModel;
  final List<MyRecordTeacherModel>? myRecords;
  final RecordTeacherModel? recordTeacherModel;
  final DateTime? currentDate;
  final bool isLoading;
  final bool isMyRecord;
  final bool isCurrentQuarter;
  final PagingBody? body;
  final bool isPaging;
  final bool reachedMax;
  final bool hasError;
  final String errorMessage;

  HomeTeacherState({
    this.places = const [],
    this.timetables,
    this.times,
    this.quarters,
    this.currentQuarter,
    this.myRecords,
    this.recordTeacherModel,
    this.currentDate,
    this.newDetailsStudentModel,
    this.isLoading = false,
    this.isMyRecord = false,
    this.isCurrentQuarter = false,
    this.body,
    this.isPaging = false,
    this.reachedMax = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  HomeTeacherState copyWith({
    List<NewStudentModel>? places,
    List<TimetableStudentModel>? timetables,
    List<TimeStudentModel>? times,
    List<QuarterStudentModel>? quarters,
    QuarterStudentModel? currentQuarter,
    NewDetailsStudentModel? newDetailsStudentModel,
    List<MyRecordTeacherModel>? myRecords,
    RecordTeacherModel? recordTeacherModel,
    DateTime? currentDate,
    bool? isLoading,
    bool? isMyRecord,
    bool? isCurrentQuarter,
    PagingBody? body,
    bool? isPaging,
    bool? reachedMax,
    bool? hasError,
    String? errorMessage,
  }) =>
      HomeTeacherState(
        places: places ?? this.places,
        timetables: timetables ?? this.timetables,
        times: times ?? this.times,
        quarters: quarters ?? this.quarters,
        currentQuarter: currentQuarter ?? this.currentQuarter,
        myRecords: myRecords ?? this.myRecords,
        recordTeacherModel: recordTeacherModel ?? this.recordTeacherModel,
        currentDate: currentDate ?? this.currentDate,
        newDetailsStudentModel: newDetailsStudentModel,
        isLoading: isLoading ?? false,
        isMyRecord: isMyRecord ?? false,
        isCurrentQuarter: isCurrentQuarter ?? false,
        body: body ?? this.body,
        isPaging: isPaging ?? false,
        reachedMax: reachedMax ?? this.reachedMax,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
