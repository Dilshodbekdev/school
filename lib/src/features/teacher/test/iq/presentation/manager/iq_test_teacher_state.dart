part of 'iq_test_teacher_bloc.dart';

class IqTestTeacherState {
  final List<ActiveIqTestTeacher> activeTests;
  final List<ActiveIqTestTeacher> templateTests;
  final List<ActiveIqTestTeacher> completedTests;
  final GetIqTestTeacherModel? getTestTeacherModel;
  final StudentResultsSimpleTestTeacherModel? studentResultsTestTeacherModel;
  final List<GetStudentsSimpleTestTeacherModel>? getStudentsTestTeacherModel;
  final List<ClassSelectTeacherModel>? classesSelect;
  final bool isLoading;
  final bool isCreatedTest;
  final bool isGetTest;
  final bool isDeleteTest;
  final bool isUpdateTest;
  final bool isSubmitTest;
  final bool hasError;
  final String errorMessage;
  final PagingBody? bodyActiveTest;
  final PagingBody? bodyTemplateTest;
  final PagingBody? bodyCompletedTest;
  final bool isPagingActiveTest;
  final bool isPagingTemplateTest;
  final bool isPagingCompletedTest;
  final bool reachedMaxActiveTest;
  final bool reachedMaxTemplateTest;
  final bool reachedMaxCompletedTest;

  IqTestTeacherState({
    this.activeTests = const [],
    this.templateTests = const [],
    this.completedTests = const [],
    this.getTestTeacherModel,
    this.studentResultsTestTeacherModel,
    this.getStudentsTestTeacherModel,
    this.classesSelect,
    this.isLoading = false,
    this.isCreatedTest = false,
    this.isGetTest = false,
    this.isDeleteTest = false,
    this.isUpdateTest = false,
    this.isSubmitTest = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
    this.bodyActiveTest,
    this.bodyTemplateTest,
    this.bodyCompletedTest,
    this.isPagingActiveTest = false,
    this.isPagingTemplateTest = false,
    this.isPagingCompletedTest = false,
    this.reachedMaxActiveTest = false,
    this.reachedMaxTemplateTest = false,
    this.reachedMaxCompletedTest = false,
  });

  IqTestTeacherState copyWith({
    List<ActiveIqTestTeacher>? activeTests,
    List<ActiveIqTestTeacher>? templateTests,
    List<ActiveIqTestTeacher>? completedTests,
    GetIqTestTeacherModel? getTestTeacherModel,
    StudentResultsSimpleTestTeacherModel? studentResultsTestTeacherModel,
    List<GetStudentsSimpleTestTeacherModel>? getStudentsTestTeacherModel,
    List<ClassSelectTeacherModel>? classesSelect,
    bool? isLoading,
    bool? isCreatedTest,
    bool? isGetTest,
    bool? isDeleteTest,
    bool? isUpdateTest,
    bool? isSubmitTest,
    bool? hasError,
    String? errorMessage,
    PagingBody? bodyActiveTest,
    PagingBody? bodyTemplateTest,
    PagingBody? bodyCompletedTest,
    bool? isPagingActiveTest,
    bool? isPagingTemplateTest,
    bool? isPagingCompletedTest,
    bool? reachedMaxActiveTest,
    bool? reachedMaxTemplateTest,
    bool? reachedMaxCompletedTest,
  }) =>
      IqTestTeacherState(
        activeTests: activeTests ?? this.activeTests,
        templateTests: templateTests ?? this.templateTests,
        completedTests: completedTests ?? this.completedTests,
        getTestTeacherModel: getTestTeacherModel ?? this.getTestTeacherModel,
        studentResultsTestTeacherModel: studentResultsTestTeacherModel ?? this.studentResultsTestTeacherModel,
        getStudentsTestTeacherModel: getStudentsTestTeacherModel ?? this.getStudentsTestTeacherModel,
        classesSelect: classesSelect,
        isLoading: isLoading ?? false,
        isCreatedTest: isCreatedTest ?? false,
        isGetTest: isGetTest ?? false,
        isDeleteTest: isDeleteTest ?? false,
        isUpdateTest: isUpdateTest ?? false,
        isSubmitTest: isSubmitTest ?? false,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
        bodyActiveTest: bodyActiveTest ?? this.bodyActiveTest,
        bodyTemplateTest: bodyTemplateTest ?? this.bodyTemplateTest,
        bodyCompletedTest: bodyCompletedTest ?? this.bodyCompletedTest,
        isPagingActiveTest: isPagingActiveTest ?? false,
        isPagingTemplateTest: isPagingTemplateTest ?? false,
        isPagingCompletedTest: isPagingCompletedTest ?? false,
        reachedMaxActiveTest: reachedMaxActiveTest ?? this.reachedMaxActiveTest,
        reachedMaxTemplateTest: reachedMaxTemplateTest ?? this.reachedMaxTemplateTest,
        reachedMaxCompletedTest: reachedMaxCompletedTest ?? this.reachedMaxCompletedTest,
      );
}
