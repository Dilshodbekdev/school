import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:school/src/core/app_state/cubit/app_cubit.dart';
import 'package:school/src/core/network/api_interceptor.dart';
import 'package:school/src/core/util/app_constants.dart';
import 'package:school/src/features/auth/data/data_source/auth_api_service.dart';
import 'package:school/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:school/src/features/auth/domain/repository/auth_repository.dart';
import 'package:school/src/features/auth/domain/use_case/change_hobby_use_case.dart';
import 'package:school/src/features/auth/domain/use_case/change_password_use_case.dart';
import 'package:school/src/features/auth/domain/use_case/hobbies_use_case.dart';
import 'package:school/src/features/auth/domain/use_case/login_use_case.dart';
import 'package:school/src/features/auth/domain/use_case/me_use_case.dart';
import 'package:school/src/features/auth/domain/use_case/teacher_me_use_case.dart';
import 'package:school/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:school/src/features/student/diary/data/data_source/diary_student_api_service.dart';
import 'package:school/src/features/student/diary/data/repository/diary_student_repository_impl.dart';
import 'package:school/src/features/student/diary/domain/repository/diary_student_repository.dart';
import 'package:school/src/features/student/diary/domain/use_case/date_diary_student_use_case.dart';
import 'package:school/src/features/student/diary/domain/use_case/quarterly_diary_student_use_case.dart';
import 'package:school/src/features/student/diary/domain/use_case/yearly_diary_student_use_case.dart';
import 'package:school/src/features/student/diary/presentation/manager/diary_student_bloc.dart';
import 'package:school/src/features/student/home/data/data_source/home_student_api_service.dart';
import 'package:school/src/features/student/home/data/repository/home_student_repository_impl.dart';
import 'package:school/src/features/student/home/domain/repository/home_student_repository.dart';
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
import 'package:school/src/features/student/home/presentation/manager/home_student_bloc.dart';
import 'package:school/src/features/student/test/directional/data/data_source/directional_test_student_api_service.dart';
import 'package:school/src/features/student/test/directional/data/repository/directional_test_student_repository_impl.dart';
import 'package:school/src/features/student/test/directional/domain/repository/directional_test_student_repository.dart';
import 'package:school/src/features/student/test/directional/domain/use_case/answer_directional_test_student_use_case.dart';
import 'package:school/src/features/student/test/directional/domain/use_case/completed_directional_tests_student_use_case.dart';
import 'package:school/src/features/student/test/directional/domain/use_case/create_directional_test_student_use_case.dart';
import 'package:school/src/features/student/test/directional/domain/use_case/get_completed_directional_test_student_use_case.dart';
import 'package:school/src/features/student/test/directional/domain/use_case/get_directional_test_student_use_case.dart';
import 'package:school/src/features/student/test/directional/domain/use_case/new_directional_tests_student_use_case.dart';
import 'package:school/src/features/student/test/directional/domain/use_case/started_directional_tests_student_use_case.dart';
import 'package:school/src/features/student/test/directional/domain/use_case/submit_directional_test_student_use_case.dart';
import 'package:school/src/features/student/test/directional/presentation/manager/directional_test_student_bloc.dart';
import 'package:school/src/features/student/test/iq/data/data_source/iq_test_student_api_service.dart';
import 'package:school/src/features/student/test/iq/data/repository/iq_test_student_repository_impl.dart';
import 'package:school/src/features/student/test/iq/domain/repository/iq_test_student_repository.dart';
import 'package:school/src/features/student/test/iq/domain/use_case/answer_iq_test_student_use_case.dart';
import 'package:school/src/features/student/test/iq/domain/use_case/completed_iq_tests_student_use_case.dart';
import 'package:school/src/features/student/test/iq/domain/use_case/create_iq_test_student_use_case.dart';
import 'package:school/src/features/student/test/iq/domain/use_case/get_completed_iq_test_student_use_case.dart';
import 'package:school/src/features/student/test/iq/domain/use_case/get_iq_test_student_use_case.dart';
import 'package:school/src/features/student/test/iq/domain/use_case/new_iq_tests_student_use_case.dart';
import 'package:school/src/features/student/test/iq/domain/use_case/started_iq_tests_student_use_case.dart';
import 'package:school/src/features/student/test/iq/domain/use_case/submit_iq_test_student_use_case.dart';
import 'package:school/src/features/student/test/iq/presentation/manager/iq_test_student_bloc.dart';
import 'package:school/src/features/student/test/score/data/data_source/score_test_student_api_service.dart';
import 'package:school/src/features/student/test/score/data/repository/score_test_student_repository_impl.dart';
import 'package:school/src/features/student/test/score/domain/repository/score_test_student_repository.dart';
import 'package:school/src/features/student/test/score/domain/use_case/answer_score_test_student_use_case.dart';
import 'package:school/src/features/student/test/score/domain/use_case/completed_score_tests_student_use_case.dart';
import 'package:school/src/features/student/test/score/domain/use_case/create_score_test_student_use_case.dart';
import 'package:school/src/features/student/test/score/domain/use_case/get_completed_score_test_student_use_case.dart';
import 'package:school/src/features/student/test/score/domain/use_case/get_score_test_student_use_case.dart';
import 'package:school/src/features/student/test/score/domain/use_case/new_score_tests_student_use_case.dart';
import 'package:school/src/features/student/test/score/domain/use_case/started_score_tests_student_use_case.dart';
import 'package:school/src/features/student/test/score/domain/use_case/submit_score_test_student_use_case.dart';
import 'package:school/src/features/student/test/score/presentation/manager/score_test_student_bloc.dart';
import 'package:school/src/features/student/test/simple/data/data_source/simple_test_student_api_service.dart';
import 'package:school/src/features/student/test/simple/data/repository/simple_test_student_repository_impl.dart';
import 'package:school/src/features/student/test/simple/domain/repository/simple_test_student_repository.dart';
import 'package:school/src/features/student/test/simple/domain/use_case/answer_simple_test_student_use_case.dart';
import 'package:school/src/features/student/test/simple/domain/use_case/completed_simple_tests_student_use_case.dart';
import 'package:school/src/features/student/test/simple/domain/use_case/create_simple_test_student_use_case.dart';
import 'package:school/src/features/student/test/simple/domain/use_case/get_completed_simple_test_student_use_case.dart';
import 'package:school/src/features/student/test/simple/domain/use_case/get_simple_test_student_use_case.dart';
import 'package:school/src/features/student/test/simple/domain/use_case/new_simple_tests_student_use_case.dart';
import 'package:school/src/features/student/test/simple/domain/use_case/started_simple_tests_student_use_case.dart';
import 'package:school/src/features/student/test/simple/domain/use_case/submit_simple_test_student_use_case.dart';
import 'package:school/src/features/student/test/simple/presentation/manager/simple_test_student_bloc.dart';
import 'package:school/src/features/teacher/home/data/data_source/home_teacher_api_service.dart';
import 'package:school/src/features/teacher/home/data/repository/home_teacher_repository_impl.dart';
import 'package:school/src/features/teacher/home/domain/repository/home_teacher_repository.dart';
import 'package:school/src/features/teacher/home/domain/use_case/current_quarter_teacher_use_case.dart';
import 'package:school/src/features/teacher/home/domain/use_case/my_records_teacher_use_case.dart';
import 'package:school/src/features/teacher/home/domain/use_case/new_details_teacher_use_case.dart';
import 'package:school/src/features/teacher/home/domain/use_case/news_teacher_use_case.dart';
import 'package:school/src/features/teacher/home/domain/use_case/quarters_teacher_use_case.dart';
import 'package:school/src/features/teacher/home/domain/use_case/record_teacher_use_case.dart';
import 'package:school/src/features/teacher/home/domain/use_case/times_teacher_use_case.dart';
import 'package:school/src/features/teacher/home/domain/use_case/timetable_teacher_use_case.dart';
import 'package:school/src/features/teacher/home/presentation/manager/home_teacher_bloc.dart';
import 'package:school/src/features/teacher/magazine/data/data_source/magazine_teacher_api_service.dart';
import 'package:school/src/features/teacher/magazine/data/repository/magazine_teacher_repository_impl.dart';
import 'package:school/src/features/teacher/magazine/domain/repository/magazine_teacher_repository.dart';
import 'package:school/src/features/teacher/magazine/domain/use_case/class_records_teacher_use_case.dart';
import 'package:school/src/features/teacher/magazine/domain/use_case/curator_classes_teacher_use_case.dart';
import 'package:school/src/features/teacher/magazine/domain/use_case/date_marks_teacher_use_case.dart';
import 'package:school/src/features/teacher/magazine/domain/use_case/delete_plan_teacher_use_case.dart';
import 'package:school/src/features/teacher/magazine/domain/use_case/import_teacher_use_case.dart';
import 'package:school/src/features/teacher/magazine/domain/use_case/plans_teacher_use_case.dart';
import 'package:school/src/features/teacher/magazine/domain/use_case/quarterly_marks_teacher_use_case.dart';
import 'package:school/src/features/teacher/magazine/domain/use_case/read_columns_teacher_use_case.dart';
import 'package:school/src/features/teacher/magazine/domain/use_case/select_rating_quarterly_teacher_use_case.dart';
import 'package:school/src/features/teacher/magazine/domain/use_case/select_rating_teacher_use_case.dart';
import 'package:school/src/features/teacher/magazine/domain/use_case/select_rating_yearly_teacher_use_case.dart';
import 'package:school/src/features/teacher/magazine/domain/use_case/update_plan_teacher_use_case.dart';
import 'package:school/src/features/teacher/magazine/domain/use_case/yearly_marks_teacher_use_case.dart';
import 'package:school/src/features/teacher/magazine/presentation/manager/magazine_teacher_bloc.dart';
import 'package:school/src/features/teacher/test/directional/data/data_source/directional_test_teacher_api_service.dart';
import 'package:school/src/features/teacher/test/directional/data/repository/directional_test_teacher_repository_impl.dart';
import 'package:school/src/features/teacher/test/directional/domain/repository/directional_test_teacher_repository.dart';
import 'package:school/src/features/teacher/test/directional/domain/use_case/active_directional_tests_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/directional/domain/use_case/classes_select_directional_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/directional/domain/use_case/completed_directional_tests_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/directional/domain/use_case/create_directional_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/directional/domain/use_case/delete_directional_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/directional/domain/use_case/get_directional_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/directional/domain/use_case/get_students_directional_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/directional/domain/use_case/student_results_directional_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/directional/domain/use_case/template_directional_tests_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/directional/domain/use_case/update_directional_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/directional/presentation/manager/directional_test_teacher_bloc.dart';
import 'package:school/src/features/teacher/test/iq/data/data_source/iq_test_teacher_api_service.dart';
import 'package:school/src/features/teacher/test/iq/data/repository/iq_test_teacher_repository_impl.dart';
import 'package:school/src/features/teacher/test/iq/domain/repository/iq_test_teacher_repository.dart';
import 'package:school/src/features/teacher/test/iq/domain/use_case/active_iq_tests_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/iq/domain/use_case/classes_select_iq_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/iq/domain/use_case/completed_iq_tests_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/iq/domain/use_case/create_iq_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/iq/domain/use_case/delete_iq_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/iq/domain/use_case/get_iq_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/iq/domain/use_case/get_students_iq_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/iq/domain/use_case/student_results_iq_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/iq/domain/use_case/template_iq_tests_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/iq/domain/use_case/update_iq_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/iq/presentation/manager/iq_test_teacher_bloc.dart';
import 'package:school/src/features/teacher/test/score/data/data_source/score_test_teacher_api_service.dart';
import 'package:school/src/features/teacher/test/score/data/repository/score_test_teacher_repository_impl.dart';
import 'package:school/src/features/teacher/test/score/domain/repository/score_test_teacher_repository.dart';
import 'package:school/src/features/teacher/test/score/domain/use_case/active_score_tests_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/score/domain/use_case/classes_select_score_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/score/domain/use_case/completed_score_tests_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/score/domain/use_case/create_score_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/score/domain/use_case/delete_score_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/score/domain/use_case/get_score_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/score/domain/use_case/get_students_score_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/score/domain/use_case/student_results_score_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/score/domain/use_case/template_score_tests_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/score/domain/use_case/update_score_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/score/presentation/manager/score_test_teacher_bloc.dart';
import 'package:school/src/features/teacher/test/simple/data/data_source/simple_test_teacher_api_service.dart';
import 'package:school/src/features/teacher/test/simple/data/repository/simple_test_teacher_repository_impl.dart';
import 'package:school/src/features/teacher/test/simple/domain/repository/simple_test_teacher_repository.dart';
import 'package:school/src/features/teacher/test/simple/domain/use_case/active_simple_tests_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/simple/domain/use_case/classes_select_simple_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/simple/domain/use_case/completed_simple_tests_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/simple/domain/use_case/create_simple_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/simple/domain/use_case/delete_simple_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/simple/domain/use_case/get_simple_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/simple/domain/use_case/get_students_simple_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/simple/domain/use_case/student_results_simple_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/simple/domain/use_case/template_simple_tests_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/simple/domain/use_case/update_simple_test_teacher_use_case.dart';
import 'package:school/src/features/teacher/test/simple/presentation/manager/simple_test_teacher_bloc.dart';

final GetIt locator = GetIt.instance;

Future<void> initializeDependencies() async {
  String server = AppConstants.baseUrlSchool;
  Dio dio = Dio(
    BaseOptions(
      baseUrl: server,
      contentType: "application/json",
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60 * 1000),
      receiveTimeout: const Duration(seconds: 60 * 1000),
      listFormat: ListFormat.multiCompatible,
    ),
  );
  dio.interceptors.add(ApiInterceptor());
  locator.registerSingleton<Dio>(dio);
  locator.registerFactory(() => AppCubit());

  /// AUTH
  // Services
  locator.registerSingleton(AuthApiService(locator()));

  // Repositories
  locator.registerSingleton<AuthRepository>(AuthRepositoryImpl(locator()));

  // UseCases
  locator.registerSingleton(LoginUseCase(locator()));
  locator.registerSingleton(MeUseCase(locator()));
  locator.registerSingleton(HobbiesUseCase(locator()));
  locator.registerSingleton(ChangeHobbyUseCase(locator()));
  locator.registerSingleton(ChangePasswordUseCase(locator()));
  locator.registerSingleton(TeacherMeUseCase(locator()));

  // Blocs
  locator.registerFactory<AuthBloc>(
    () => AuthBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );

  ///TEACHER
  //Services
  locator.registerSingleton(HomeTeacherApiService(locator()));
  locator.registerSingleton(MagazineTeacherApiService(locator()));
  locator.registerSingleton(SimpleTestTeacherApiService(locator()));
  locator.registerSingleton(IqTestTeacherApiService(locator()));
  locator.registerSingleton(DirectionalTestTeacherApiService(locator()));
  locator.registerSingleton(ScoreTestTeacherApiService(locator()));

  // Repositories
  locator.registerSingleton<HomeTeacherRepository>(HomeTeacherRepositoryImpl(locator()));
  locator.registerSingleton<MagazineTeacherRepository>(MagazineTeacherRepositoryImpl(locator()));
  locator.registerSingleton<SimpleTestTeacherRepository>(SimpleTestTeacherRepositoryImpl(locator()));
  locator.registerSingleton<IqTestTeacherRepository>(IqTestTeacherRepositoryImpl(locator()));
  locator.registerSingleton<DirectionalTestTeacherRepository>(DirectionalTestTeacherRepositoryImpl(locator()));
  locator.registerSingleton<ScoreTestTeacherRepository>(ScoreTestTeacherRepositoryImpl(locator()));

  //Home UseCases
  locator.registerSingleton(NewsTeacherUseCase(locator()));
  locator.registerSingleton(NewDetailsTeacherUseCase(locator()));
  locator.registerSingleton(TimetableTeacherUseCase(locator()));
  locator.registerSingleton(TimesTeacherUseCase(locator()));
  locator.registerSingleton(QuartersTeacherUseCase(locator()));
  locator.registerSingleton(CurrentQuarterTeacherUseCase(locator()));
  locator.registerSingleton(MyRecordsTeacherUseCase(locator()));
  locator.registerSingleton(RecordTeacherUseCase(locator()));

  //Magazine UseCases
  locator.registerSingleton(CuratorClassesTeacherUseCase(locator()));
  locator.registerSingleton(ClassRecordsTeacherUseCase(locator()));
  locator.registerSingleton(DateMarksTeacherUseCase(locator()));
  locator.registerSingleton(QuarterlyMarksTeacherUseCase(locator()));
  locator.registerSingleton(YearlyMarksTeacherUseCase(locator()));
  locator.registerSingleton(SelectRatingTeacherUseCase(locator()));
  locator.registerSingleton(SelectRatingQuarterlyTeacherUseCase(locator()));
  locator.registerSingleton(SelectRatingYearlyTeacherUseCase(locator()));
  locator.registerSingleton(PlansTeacherUseCase(locator()));
  locator.registerSingleton(UpdatePlanTeacherUseCase(locator()));
  locator.registerSingleton(DeletePlanTeacherUseCase(locator()));
  locator.registerSingleton(ReadColumnsTeacherUseCase(locator()));
  locator.registerSingleton(ImportTeacherUseCase(locator()));

  //Tests Simple
  locator.registerSingleton(ActiveSimpleTestsTeacherUseCase(locator()));
  locator.registerSingleton(TemplateSimpleTestsTeacherUseCase(locator()));
  locator.registerSingleton(CompletedSimpleTestsTeacherUseCase(locator()));
  locator.registerSingleton(GetSimpleTestTeacherUseCase(locator()));
  locator.registerSingleton(GetStudentsSimpleTestTeacherUseCase(locator()));
  locator.registerSingleton(StudentResultsSimpleTestTeacherUseCase(locator()));
  locator.registerSingleton(CreateSimpleTestTeacherUseCase(locator()));
  locator.registerSingleton(UpdateSimpleTestTeacherUseCase(locator()));
  locator.registerSingleton(DeleteSimpleTestTeacherUseCase(locator()));
  locator.registerSingleton(ClassesSelectSimpleTestTeacherUseCase(locator()));

  //Tests Iq
  locator.registerSingleton(ActiveIqTestsTeacherUseCase(locator()));
  locator.registerSingleton(TemplateIqTestsTeacherUseCase(locator()));
  locator.registerSingleton(CompletedIqTestsTeacherUseCase(locator()));
  locator.registerSingleton(GetIqTestTeacherUseCase(locator()));
  locator.registerSingleton(GetStudentsIqTestTeacherUseCase(locator()));
  locator.registerSingleton(StudentResultsIqTestTeacherUseCase(locator()));
  locator.registerSingleton(CreateIqTestTeacherUseCase(locator()));
  locator.registerSingleton(UpdateIqTestTeacherUseCase(locator()));
  locator.registerSingleton(DeleteIqTestTeacherUseCase(locator()));
  locator.registerSingleton(ClassesSelectIqTestTeacherUseCase(locator()));

  //Tests Directional
  locator.registerSingleton(ActiveDirectionalTestsTeacherUseCase(locator()));
  locator.registerSingleton(TemplateDirectionalTestsTeacherUseCase(locator()));
  locator.registerSingleton(CompletedDirectionalTestsTeacherUseCase(locator()));
  locator.registerSingleton(GetDirectionalTestTeacherUseCase(locator()));
  locator.registerSingleton(GetStudentsDirectionalTestTeacherUseCase(locator()));
  locator.registerSingleton(StudentResultsDirectionalTestTeacherUseCase(locator()));
  locator.registerSingleton(CreateDirectionalTestTeacherUseCase(locator()));
  locator.registerSingleton(UpdateDirectionalTestTeacherUseCase(locator()));
  locator.registerSingleton(DeleteDirectionalTestTeacherUseCase(locator()));
  locator.registerSingleton(ClassesSelectDirectionalTestTeacherUseCase(locator()));

  //Tests Score
  locator.registerSingleton(ActiveScoreTestsTeacherUseCase(locator()));
  locator.registerSingleton(TemplateScoreTestsTeacherUseCase(locator()));
  locator.registerSingleton(CompletedScoreTestsTeacherUseCase(locator()));
  locator.registerSingleton(GetScoreTestTeacherUseCase(locator()));
  locator.registerSingleton(GetStudentsScoreTestTeacherUseCase(locator()));
  locator.registerSingleton(StudentResultsScoreTestTeacherUseCase(locator()));
  locator.registerSingleton(CreateScoreTestTeacherUseCase(locator()));
  locator.registerSingleton(UpdateScoreTestTeacherUseCase(locator()));
  locator.registerSingleton(DeleteScoreTestTeacherUseCase(locator()));
  locator.registerSingleton(ClassesSelectScoreTestTeacherUseCase(locator()));

  // Blocs
  locator.registerFactory<HomeTeacherBloc>(
        () => HomeTeacherBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory<MagazineTeacherBloc>(
        () => MagazineTeacherBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory<SimpleTestTeacherBloc>(
        () => SimpleTestTeacherBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory<IqTestTeacherBloc>(
        () => IqTestTeacherBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory<DirectionalTestTeacherBloc>(
        () => DirectionalTestTeacherBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory<ScoreTestTeacherBloc>(
        () => ScoreTestTeacherBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );

  /// STUDENT
  //Services
  locator.registerSingleton(HomeStudentApiService(locator()));
  locator.registerSingleton(DiaryStudentApiService(locator()));
  locator.registerSingleton(SimpleTestStudentApiService(locator()));
  locator.registerSingleton(IqTestStudentApiService(locator()));
  locator.registerSingleton(DirectionalTestStudentApiService(locator()));
  locator.registerSingleton(ScoreTestStudentApiService(locator()));

  // Repositories
  locator.registerSingleton<HomeStudentRepository>(HomeStudentRepositoryImpl(locator()));
  locator.registerSingleton<DiaryStudentRepository>(DiaryStudentRepositoryImpl(locator()));
  locator.registerSingleton<SimpleTestStudentRepository>(SimpleTestStudentRepositoryImpl(locator()));
  locator.registerSingleton<IqTestStudentRepository>(IqTestStudentRepositoryImpl(locator()));
  locator.registerSingleton<DirectionalTestStudentRepository>(DirectionalTestStudentRepositoryImpl(locator()));
  locator.registerSingleton<ScoreTestStudentRepository>(ScoreTestStudentRepositoryImpl(locator()));

  //Home UseCases
  locator.registerSingleton(NewsStudentUseCase(locator()));
  locator.registerSingleton(NewDetailsStudentUseCase(locator()));
  locator.registerSingleton(MenuWeekdayStudentUseCase(locator()));
  locator.registerSingleton(MenuStudentUseCase(locator()));
  locator.registerSingleton(TimetableStudentUseCase(locator()));
  locator.registerSingleton(TimesStudentUseCase(locator()));
  locator.registerSingleton(SciencesStudentUseCase(locator()));
  locator.registerSingleton(RatingStudentUseCase(locator()));
  locator.registerSingleton(QuartersStudentUseCase(locator()));
  locator.registerSingleton(CurrentQuarterStudentUseCase(locator()));
  locator.registerSingleton(StatisticStudentAttendanceStudentUseCase(locator()));
  locator.registerSingleton(StatisticStudentAppropriationStudentUseCase(locator()));

  //Diary UseCases
  locator.registerSingleton(DateDiaryStudentUseCase(locator()));
  locator.registerSingleton(QuarterlyDiaryStudentUseCase(locator()));
  locator.registerSingleton(YearlyDiaryStudentUseCase(locator()));

  //Simple Test UseCases
  locator.registerSingleton(NewSimpleTestsStudentUseCase(locator()));
  locator.registerSingleton(StartedSimpleTestsStudentUseCase(locator()));
  locator.registerSingleton(CompletedSimpleTestsStudentUseCase(locator()));
  locator.registerSingleton(CreateSimpleTestStudentUseCase(locator()));
  locator.registerSingleton(GetSimpleTestStudentUseCase(locator()));
  locator.registerSingleton(GetCompletedSimpleTestStudentUseCase(locator()));
  locator.registerSingleton(SubmitSimpleTestStudentUseCase(locator()));
  locator.registerSingleton(AnswerSimpleTestStudentUseCase(locator()));

  //Iq Test USeCases
  locator.registerSingleton(NewIqTestsStudentUseCase(locator()));
  locator.registerSingleton(StartedIqTestsStudentUseCase(locator()));
  locator.registerSingleton(CompletedIqTestsStudentUseCase(locator()));
  locator.registerSingleton(CreateIqTestStudentUseCase(locator()));
  locator.registerSingleton(GetIqTestStudentUseCase(locator()));
  locator.registerSingleton(GetCompletedIqTestStudentUseCase(locator()));
  locator.registerSingleton(SubmitIqTestStudentUseCase(locator()));
  locator.registerSingleton(AnswerIqTestStudentUseCase(locator()));

  //Directional Test USeCases
  locator.registerSingleton(NewDirectionalTestsStudentUseCase(locator()));
  locator.registerSingleton(StartedDirectionalTestsStudentUseCase(locator()));
  locator.registerSingleton(CompletedDirectionalTestsStudentUseCase(locator()));
  locator.registerSingleton(CreateDirectionalTestStudentUseCase(locator()));
  locator.registerSingleton(GetDirectionalTestStudentUseCase(locator()));
  locator.registerSingleton(GetCompletedDirectionalTestStudentUseCase(locator()));
  locator.registerSingleton(SubmitDirectionalTestStudentUseCase(locator()));
  locator.registerSingleton(AnswerDirectionalTestStudentUseCase(locator()));

  //Score Test USeCases
  locator.registerSingleton(NewScoreTestsStudentUseCase(locator()));
  locator.registerSingleton(StartedScoreTestsStudentUseCase(locator()));
  locator.registerSingleton(CompletedScoreTestsStudentUseCase(locator()));
  locator.registerSingleton(CreateScoreTestStudentUseCase(locator()));
  locator.registerSingleton(GetScoreTestStudentUseCase(locator()));
  locator.registerSingleton(GetCompletedScoreTestStudentUseCase(locator()));
  locator.registerSingleton(SubmitScoreTestStudentUseCase(locator()));
  locator.registerSingleton(AnswerScoreTestStudentUseCase(locator()));

  // Blocs
  locator.registerFactory<HomeStudentBloc>(
    () => HomeStudentBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory<DiaryStudentBloc>(
    () => DiaryStudentBloc(
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory<SimpleTestStudentBloc>(
    () => SimpleTestStudentBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory<IqTestStudentBloc>(
        () => IqTestStudentBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory<DirectionalTestStudentBloc>(
        () => DirectionalTestStudentBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory<ScoreTestStudentBloc>(
        () => ScoreTestStudentBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
}
