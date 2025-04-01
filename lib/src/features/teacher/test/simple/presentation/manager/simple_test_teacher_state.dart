part of 'simple_test_teacher_bloc.dart';

class SimpleTestTeacherState {
  final List<ActiveSimpleTestTeacherModel> activeSimpleTests;
  final List<ActiveSimpleTestTeacherModel> templateSimpleTests;
  final List<ActiveSimpleTestTeacherModel> completedSimpleTests;
  final GetSimpleTestTeacherModel? getSimpleTestTeacherModel;
  final StudentResultsSimpleTestTeacherModel? studentResultsSimpleTestTeacherModel;
  final List<GetStudentsSimpleTestTeacherModel>? getStudentsSimpleTestTeacherModel;
  final List<ClassSelectTeacherModel>? classesSelect;
  final bool isLoading;
  final bool isCreatedSimpleTest;
  final bool isGetSimpleTest;
  final bool isDeleteSimpleTest;
  final bool isUpdateSimpleTest;
  final bool isSubmitSimpleTest;
  final bool hasError;
  final String errorMessage;
  final PagingBody? bodyActiveSimpleTest;
  final PagingBody? bodyTemplateSimpleTest;
  final PagingBody? bodyCompletedSimpleTest;
  final bool isPagingActiveSimpleTest;
  final bool isPagingTemplateSimpleTest;
  final bool isPagingCompletedSimpleTest;
  final bool reachedMaxActiveSimpleTest;
  final bool reachedMaxTemplateSimpleTest;
  final bool reachedMaxCompletedSimpleTest;

  SimpleTestTeacherState({
    this.activeSimpleTests = const [],
    this.templateSimpleTests = const [],
    this.completedSimpleTests = const [],
    this.getSimpleTestTeacherModel,
    this.studentResultsSimpleTestTeacherModel,
    this.getStudentsSimpleTestTeacherModel,
    this.classesSelect,
    this.isLoading = false,
    this.isCreatedSimpleTest = false,
    this.isGetSimpleTest = false,
    this.isDeleteSimpleTest = false,
    this.isUpdateSimpleTest = false,
    this.isSubmitSimpleTest = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
    this.bodyActiveSimpleTest,
    this.bodyTemplateSimpleTest,
    this.bodyCompletedSimpleTest,
    this.isPagingActiveSimpleTest = false,
    this.isPagingTemplateSimpleTest = false,
    this.isPagingCompletedSimpleTest = false,
    this.reachedMaxActiveSimpleTest = false,
    this.reachedMaxTemplateSimpleTest = false,
    this.reachedMaxCompletedSimpleTest = false,
  });

  SimpleTestTeacherState copyWith({
    List<ActiveSimpleTestTeacherModel>? activeSimpleTests,
    List<ActiveSimpleTestTeacherModel>? templateSimpleTests,
    List<ActiveSimpleTestTeacherModel>? completedSimpleTests,
    GetSimpleTestTeacherModel? getSimpleTestTeacherModel,
    StudentResultsSimpleTestTeacherModel? studentResultsSimpleTestTeacherModel,
    List<GetStudentsSimpleTestTeacherModel>? getStudentsSimpleTestTeacherModel,
    List<ClassSelectTeacherModel>? classesSelect,
    bool? isLoading,
    bool? isCreatedSimpleTest,
    bool? isGetSimpleTest,
    bool? isDeleteSimpleTest,
    bool? isUpdateSimpleTest,
    bool? isSubmitSimpleTest,
    bool? hasError,
    String? errorMessage,
    PagingBody? bodyActiveSimpleTest,
    PagingBody? bodyTemplateSimpleTest,
    PagingBody? bodyCompletedSimpleTest,
    bool? isPagingActiveSimpleTest,
    bool? isPagingTemplateSimpleTest,
    bool? isPagingCompletedSimpleTest,
    bool? reachedMaxActiveSimpleTest,
    bool? reachedMaxTemplateSimpleTest,
    bool? reachedMaxCompletedSimpleTest,
  }) =>
      SimpleTestTeacherState(
        activeSimpleTests: activeSimpleTests ?? this.activeSimpleTests,
        templateSimpleTests: templateSimpleTests ?? this.templateSimpleTests,
        completedSimpleTests: completedSimpleTests ?? this.completedSimpleTests,
        getSimpleTestTeacherModel: getSimpleTestTeacherModel ?? this.getSimpleTestTeacherModel,
        studentResultsSimpleTestTeacherModel: studentResultsSimpleTestTeacherModel ?? this.studentResultsSimpleTestTeacherModel,
        getStudentsSimpleTestTeacherModel: getStudentsSimpleTestTeacherModel ?? this.getStudentsSimpleTestTeacherModel,
        classesSelect: classesSelect,
        isLoading: isLoading ?? false,
        isCreatedSimpleTest: isCreatedSimpleTest ?? false,
        isGetSimpleTest: isGetSimpleTest ?? false,
        isDeleteSimpleTest: isDeleteSimpleTest ?? false,
        isUpdateSimpleTest: isUpdateSimpleTest ?? false,
        isSubmitSimpleTest: isSubmitSimpleTest ?? false,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
        bodyActiveSimpleTest: bodyActiveSimpleTest ?? this.bodyActiveSimpleTest,
        bodyTemplateSimpleTest: bodyTemplateSimpleTest ?? this.bodyTemplateSimpleTest,
        bodyCompletedSimpleTest: bodyCompletedSimpleTest ?? this.bodyCompletedSimpleTest,
        isPagingActiveSimpleTest: isPagingActiveSimpleTest ?? false,
        isPagingTemplateSimpleTest: isPagingTemplateSimpleTest ?? false,
        isPagingCompletedSimpleTest: isPagingCompletedSimpleTest ?? false,
        reachedMaxActiveSimpleTest: reachedMaxActiveSimpleTest ?? this.reachedMaxActiveSimpleTest,
        reachedMaxTemplateSimpleTest: reachedMaxTemplateSimpleTest ?? this.reachedMaxTemplateSimpleTest,
        reachedMaxCompletedSimpleTest: reachedMaxCompletedSimpleTest ?? this.reachedMaxCompletedSimpleTest,
      );
}
