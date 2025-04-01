part of 'diary_student_bloc.dart';

class DiaryStudentState {
  final List<LessonModel>? dateDiary;
  final List<QuarterlyDiaryModel>? quarterlyDiary;
  final List<QuarterlyDiaryModel>? yearlyDiary;
  final DateTime? date;
  final bool isLoading;
  final bool hasError;
  final String errorMessage;

  DiaryStudentState({
    this.dateDiary,
    this.quarterlyDiary,
    this.yearlyDiary,
    this.date,
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  DiaryStudentState copyWith({
    List<LessonModel>? dateDiary,
    List<QuarterlyDiaryModel>? quarterlyDiary,
    List<QuarterlyDiaryModel>? yearlyDiary,
    DateTime? date,
    bool? isLoading,
    bool? hasError,
    String? errorMessage,
  }) =>
      DiaryStudentState(
        dateDiary: dateDiary ?? this.dateDiary,
        quarterlyDiary: quarterlyDiary ?? this.quarterlyDiary,
        yearlyDiary: yearlyDiary ?? this.yearlyDiary,
        date: date ?? this.date,
        isLoading: isLoading ?? false,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
