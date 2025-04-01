part of 'magazine_teacher_bloc.dart';

class MagazineTeacherState {
  final List<CuratorClassTeacherModel>? curatorClasses;
  final List<ClassRecordTeacherModel>? classRecords;
  final DateMarksTeacherModel? dateMarks;
  final List<QuarterlyMarksTeacherModel>? quarterlyMarks;
  final List<YearlyMarksTeacherModel>? yearlyMarks;
  final List<PlanTeacherModel>? plans;
  final List<ReadColumnTeacherModel>? readColumns;
  final PlanTeacherModel? updatePlan;
  final DateMarksBody? dateMarksBody;
  final ImportTeacherModel? importTeacherModel;
  final bool isLoading;
  final bool isSelectRating;
  final bool isSelectRatingQuarterly;
  final bool isSelectRatingYearly;
  final bool isDeletePlan;
  final bool isImported;
  final bool isUpdatePlan;
  final bool hasError;
  final String errorMessage;

  MagazineTeacherState({
    this.curatorClasses,
    this.classRecords,
    this.dateMarks,
    this.quarterlyMarks,
    this.yearlyMarks,
    this.plans,
    this.readColumns,
    this.updatePlan,
    this.dateMarksBody,
    this.importTeacherModel,
    this.isLoading = false,
    this.isSelectRating = false,
    this.isSelectRatingQuarterly = false,
    this.isSelectRatingYearly = false,
    this.isDeletePlan = false,
    this.isImported = false,
    this.isUpdatePlan = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  MagazineTeacherState copyWith({
    List<CuratorClassTeacherModel>? curatorClasses,
    List<ClassRecordTeacherModel>? classRecords,
    DateMarksTeacherModel? dateMarks,
    List<QuarterlyMarksTeacherModel>? quarterlyMarks,
    List<YearlyMarksTeacherModel>? yearlyMarks,
    List<PlanTeacherModel>? plans,
    List<ReadColumnTeacherModel>? readColumns,
    PlanTeacherModel? updatePlan,
    DateMarksBody? dateMarksBody,
    ImportTeacherModel? importTeacherModel,
    bool? isLoading,
    bool? isSelectRating,
    bool? isSelectRatingQuarterly,
    bool? isSelectRatingYearly,
    bool? isDeletePlan,
    bool? isImported,
    bool? isUpdatePlan,
    bool? hasError,
    String? errorMessage,
  }) =>
      MagazineTeacherState(
        curatorClasses: curatorClasses ?? this.curatorClasses,
        classRecords: classRecords ?? this.classRecords,
        dateMarks: dateMarks??this.dateMarks,
        quarterlyMarks: quarterlyMarks??this.quarterlyMarks,
        yearlyMarks: yearlyMarks??this.yearlyMarks,
        plans: plans ?? this.plans,
        readColumns: readColumns,
        updatePlan: updatePlan ,
        dateMarksBody: dateMarksBody ?? this.dateMarksBody,
        importTeacherModel: importTeacherModel,
        isLoading: isLoading ?? false,
        isSelectRating: isSelectRating ?? false,
        isSelectRatingQuarterly: isSelectRatingQuarterly ?? false,
        isSelectRatingYearly: isSelectRatingYearly ?? false,
        isDeletePlan: isDeletePlan ?? false,
        isImported: isImported ?? false,
        isUpdatePlan: isUpdatePlan ?? false,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
