part of 'directional_test_student_bloc.dart';

class DirectionalTestStudentState {
  final List<NewIqTestModel> newSimpleTests;
  final List<StartedSimpleTestModel> startedSimpleTests;
  final List<StartedSimpleTestModel> completedSimpleTests;
  final GetSimpleTestStudentModel? createSimpleTestStudentModel;
  final GetDirectionalTestStudentModel? getSimpleTestStudentModel;
  final GetCompleteSimpleTestStudentModel? getCompleteSimpleTestStudentModel;
  final AnswerSimpleTestStudentModel? answerSimpleTestStudentModel;
  final List<int?>? selectedTest;
  final bool isLoading;
  final bool isCreatedSimpleTest;
  final bool isGetSimpleTest;
  final bool isSubmitSimpleTest;
  final bool hasError;
  final String errorMessage;
  final PagingBody? bodyNewSimpleTest;
  final PagingBody? bodyStartedSimpleTest;
  final PagingBody? bodyCompletedSimpleTest;
  final bool isPagingNewSimpleTest;
  final bool isPagingStartedSimpleTest;
  final bool isPagingCompletedSimpleTest;
  final bool reachedMaxNewSimpleTest;
  final bool reachedMaxStartedSimpleTest;
  final bool reachedMaxCompletedSimpleTest;

  DirectionalTestStudentState({
    this.newSimpleTests = const [],
    this.startedSimpleTests = const [],
    this.completedSimpleTests = const [],
    this.createSimpleTestStudentModel,
    this.getSimpleTestStudentModel,
    this.getCompleteSimpleTestStudentModel,
    this.answerSimpleTestStudentModel,
    this.selectedTest,
    this.isLoading = false,
    this.isCreatedSimpleTest = false,
    this.isGetSimpleTest = false,
    this.isSubmitSimpleTest = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
    this.bodyNewSimpleTest,
    this.bodyStartedSimpleTest,
    this.bodyCompletedSimpleTest,
    this.isPagingNewSimpleTest = false,
    this.isPagingStartedSimpleTest = false,
    this.isPagingCompletedSimpleTest = false,
    this.reachedMaxNewSimpleTest = false,
    this.reachedMaxStartedSimpleTest = false,
    this.reachedMaxCompletedSimpleTest = false,
  });

  DirectionalTestStudentState copyWith({
    List<NewIqTestModel>? newSimpleTests,
    List<StartedSimpleTestModel>? startedSimpleTests,
    List<StartedSimpleTestModel>? completedSimpleTests,
    GetSimpleTestStudentModel? createSimpleTestStudentModel,
    GetDirectionalTestStudentModel? getSimpleTestStudentModel,
    GetCompleteSimpleTestStudentModel? getCompleteSimpleTestStudentModel,
    AnswerSimpleTestStudentModel? answerSimpleTestStudentModel,
    List<int?>? selectedTest,
    bool? isLoading,
    bool? isCreatedSimpleTest,
    bool? isGetSimpleTest,
    bool? isSubmitSimpleTest,
    bool? hasError,
    String? errorMessage,
    PagingBody? bodyNewSimpleTest,
    PagingBody? bodyStartedSimpleTest,
    PagingBody? bodyCompletedSimpleTest,
    bool? isPagingNewSimpleTest,
    bool? isPagingStartedSimpleTest,
    bool? isPagingCompletedSimpleTest,
    bool? reachedMaxNewSimpleTest,
    bool? reachedMaxStartedSimpleTest,
    bool? reachedMaxCompletedSimpleTest,
  }) =>
      DirectionalTestStudentState(
        newSimpleTests: newSimpleTests ?? this.newSimpleTests,
        startedSimpleTests: startedSimpleTests ?? this.startedSimpleTests,
        completedSimpleTests: completedSimpleTests ?? this.completedSimpleTests,
        createSimpleTestStudentModel: createSimpleTestStudentModel ?? this.createSimpleTestStudentModel,
        getSimpleTestStudentModel: getSimpleTestStudentModel ?? this.getSimpleTestStudentModel,
        getCompleteSimpleTestStudentModel: getCompleteSimpleTestStudentModel,
        answerSimpleTestStudentModel: answerSimpleTestStudentModel,
        selectedTest: selectedTest ?? this.selectedTest,
        isLoading: isLoading ?? false,
        isCreatedSimpleTest: isCreatedSimpleTest ?? false,
        isGetSimpleTest: isGetSimpleTest ?? false,
        isSubmitSimpleTest: isSubmitSimpleTest ?? false,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
        bodyNewSimpleTest: bodyNewSimpleTest ?? this.bodyNewSimpleTest,
        bodyStartedSimpleTest: bodyStartedSimpleTest ?? this.bodyStartedSimpleTest,
        bodyCompletedSimpleTest: bodyCompletedSimpleTest ?? this.bodyCompletedSimpleTest,
        isPagingNewSimpleTest: isPagingNewSimpleTest ?? false,
        isPagingStartedSimpleTest: isPagingStartedSimpleTest ?? false,
        isPagingCompletedSimpleTest: isPagingCompletedSimpleTest ?? false,
        reachedMaxNewSimpleTest: reachedMaxNewSimpleTest ?? this.reachedMaxNewSimpleTest,
        reachedMaxStartedSimpleTest: reachedMaxStartedSimpleTest ?? this.reachedMaxStartedSimpleTest,
        reachedMaxCompletedSimpleTest: reachedMaxCompletedSimpleTest ?? this.reachedMaxCompletedSimpleTest,
      );
}
