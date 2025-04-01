import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school/src/core/router/app_routes.dart';
import 'package:school/src/core/router/route_transitions.dart';
import 'package:school/src/features/auth/presentation/pages/language_page.dart';
import 'package:school/src/features/auth/presentation/pages/login_page.dart';
import 'package:school/src/features/auth/presentation/pages/splash_page.dart';
import 'package:school/src/features/student/home/presentation/pages/all_news_student_page.dart';
import 'package:school/src/features/student/home/presentation/pages/new_details_student_page.dart';
import 'package:school/src/features/student/home/presentation/pages/nutrition_student_page.dart';
import 'package:school/src/features/student/home/presentation/pages/rating_student_page.dart';
import 'package:school/src/features/student/main/main_student_page.dart';
import 'package:school/src/features/student/test/directional/presentation/pages/completed_directional_test_student_page.dart';
import 'package:school/src/features/student/test/directional/presentation/pages/directional_test_student_page.dart';
import 'package:school/src/features/student/test/directional/presentation/pages/directional_tests_student_page.dart';
import 'package:school/src/features/student/test/iq/presentation/pages/completed_iq_test_student_page.dart';
import 'package:school/src/features/student/test/iq/presentation/pages/iq_test_student_page.dart';
import 'package:school/src/features/student/test/iq/presentation/pages/iq_tests_student_page.dart';
import 'package:school/src/features/student/test/score/presentation/pages/completed_score_test_student_page.dart';
import 'package:school/src/features/student/test/score/presentation/pages/score_test_student_page.dart';
import 'package:school/src/features/student/test/score/presentation/pages/score_tests_student_page.dart';
import 'package:school/src/features/student/test/simple/presentation/pages/completed_simple_test_student_page.dart';
import 'package:school/src/features/student/test/simple/presentation/pages/simple_test_student_page.dart';
import 'package:school/src/features/student/test/simple/presentation/pages/simple_tests_student_page.dart';
import 'package:school/src/features/teacher/home/presentation/pages/all_news_teacher_page.dart';
import 'package:school/src/features/teacher/home/presentation/pages/new_details_teacher_page.dart';
import 'package:school/src/features/teacher/magazine/presentation/pages/import_teacher_page.dart';
import 'package:school/src/features/teacher/magazine/presentation/pages/plan_teacher_page.dart';
import 'package:school/src/features/teacher/magazine/presentation/pages/record_magazine_teacher_page.dart';
import 'package:school/src/features/teacher/main/main_teacher_page.dart';
import 'package:school/src/features/teacher/test/directional/presentation/pages/create_directional_test_teacher_page.dart';
import 'package:school/src/features/teacher/test/directional/presentation/pages/directional_test_details_teacher_page.dart';
import 'package:school/src/features/teacher/test/directional/presentation/pages/directional_tests_teacher_page.dart';
import 'package:school/src/features/teacher/test/directional/presentation/pages/student_results_directional_test_teacher_page.dart';
import 'package:school/src/features/teacher/test/iq/presentation/pages/create_iq_test_teacher_page.dart';
import 'package:school/src/features/teacher/test/iq/presentation/pages/iq_test_details_teacher_page.dart';
import 'package:school/src/features/teacher/test/iq/presentation/pages/iq_tests_teacher_page.dart';
import 'package:school/src/features/teacher/test/iq/presentation/pages/student_results_iq_test_teacher_page.dart';
import 'package:school/src/features/teacher/test/score/presentation/pages/create_score_test_teacher_page.dart';
import 'package:school/src/features/teacher/test/score/presentation/pages/score_test_details_teacher_page.dart';
import 'package:school/src/features/teacher/test/score/presentation/pages/score_tests_teacher_page.dart';
import 'package:school/src/features/teacher/test/score/presentation/pages/student_results_score_test_teacher_page.dart';
import 'package:school/src/features/teacher/test/simple/presentation/pages/create_simple_test_teacher_page.dart';
import 'package:school/src/features/teacher/test/simple/presentation/pages/simple_test_details_teacher_page.dart';
import 'package:school/src/features/teacher/test/simple/presentation/pages/simple_tests_teacher_page.dart';
import 'package:school/src/features/teacher/test/simple/presentation/pages/student_results_simple_test_teacher_page.dart';

final GlobalKey<NavigatorState> rootNavigator = GlobalKey(debugLabel: 'root');

final appRouter = GoRouter(
  navigatorKey: rootNavigator,
  initialLocation: AppRoutes.splash.path,
  routes: [
    //Auth
    GoRoute(
      name: AppRoutes.splash.name,
      path: AppRoutes.splash.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const SplashPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.language.name,
      path: AppRoutes.language.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const LanguagePage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.login.name,
      path: AppRoutes.login.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const LoginPage().defaultPage(state: state),
    ),
    //Home Student
    GoRoute(
      name: AppRoutes.mainStudent.name,
      path: AppRoutes.mainStudent.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const MainStudentPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.nutritionStudent.name,
      path: AppRoutes.nutritionStudent.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const NutritionStudentPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.ratingStudent.name,
      path: AppRoutes.ratingStudent.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const RatingStudentPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.newDetailsStudent.name,
      path: AppRoutes.newDetailsStudent.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const NewDetailsStudentPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.allNewsStudent.name,
      path: AppRoutes.allNewsStudent.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const AllNewsStudentPage().defaultPage(state: state),
    ),
    //Test Student
    GoRoute(
      name: AppRoutes.simpleTestsStudent.name,
      path: AppRoutes.simpleTestsStudent.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const SimpleTestsStudentPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.simpleTestStudent.name,
      path: AppRoutes.simpleTestStudent.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const SimpleTestStudentPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.completedSimpleTestStudent.name,
      path: AppRoutes.completedSimpleTestStudent.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => CompletedSimpleTestStudentPage(
        id: int.parse(state.pathParameters['id']!),
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.iqTestsStudent.name,
      path: AppRoutes.iqTestsStudent.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const IqTestsStudentPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.iqTestStudent.name,
      path: AppRoutes.iqTestStudent.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const IqTestStudentPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.completedIqTestStudent.name,
      path: AppRoutes.completedIqTestStudent.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => CompletedIqTestStudentPage(
        id: int.parse(state.pathParameters['id']!),
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.directionalTestsStudent.name,
      path: AppRoutes.directionalTestsStudent.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const DirectionalTestsStudentPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.directionalTestStudent.name,
      path: AppRoutes.directionalTestStudent.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const DirectionalTestStudentPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.completedDirectionalTestStudent.name,
      path: AppRoutes.completedDirectionalTestStudent.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => CompletedDirectionalTestStudentPage(
        id: int.parse(state.pathParameters['id']!),
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.scoreTestsStudent.name,
      path: AppRoutes.scoreTestsStudent.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const ScoreTestsStudentPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.scoreTestStudent.name,
      path: AppRoutes.scoreTestStudent.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const ScoreTestStudentPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.completedScoreTestStudent.name,
      path: AppRoutes.completedScoreTestStudent.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => CompletedScoreTestStudentPage(
        id: int.parse(state.pathParameters['id']!),
      ).defaultPage(state: state),
    ),
    //Home Teacher
    GoRoute(
      name: AppRoutes.mainTeacher.name,
      path: AppRoutes.mainTeacher.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
           const MainTeacherPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.newDetailsTeacher.name,
      path: AppRoutes.newDetailsTeacher.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const NewDetailsTeacherPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.allNewsTeacher.name,
      path: AppRoutes.allNewsTeacher.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const AllNewsTeacherPage().defaultPage(state: state),
    ),
    //Test Teacher
    GoRoute(
      name: AppRoutes.simpleTestsTeacher.name,
      path: AppRoutes.simpleTestsTeacher.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const SimpleTestsTeacherPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.createSimpleTestTeacher.name,
      path: AppRoutes.createSimpleTestTeacher.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          CreateSimpleTestTeacherPage(
            type: int.parse(state.pathParameters['type']!),
          ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.simpleTestDetailsTeacher.name,
      path: AppRoutes.simpleTestDetailsTeacher.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const SimpleTestDetailsTeacherPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.studentResultsSimpleTestTeacher.name,
      path: AppRoutes.studentResultsSimpleTestTeacher.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const StudentResultsSimpleTestTeacherPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.iqTestsTeacher.name,
      path: AppRoutes.iqTestsTeacher.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const IqTestsTeacherPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.createIqTestTeacher.name,
      path: AppRoutes.createIqTestTeacher.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          CreateIqTestTeacherPage(
            type: int.parse(state.pathParameters['type']!),
          ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.iqTestDetailsTeacher.name,
      path: AppRoutes.iqTestDetailsTeacher.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const IqTestDetailsTeacherPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.studentResultsIqTestTeacher.name,
      path: AppRoutes.studentResultsIqTestTeacher.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const StudentResultsIqTestTeacherPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.directionalTestsTeacher.name,
      path: AppRoutes.directionalTestsTeacher.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const DirectionalTestsTeacherPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.createDirectionalTestTeacher.name,
      path: AppRoutes.createDirectionalTestTeacher.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          CreateDirectionalTestTeacherPage(
            type: int.parse(state.pathParameters['type']!),
          ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.directionalTestDetailsTeacher.name,
      path: AppRoutes.directionalTestDetailsTeacher.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const DirectionalTestDetailsTeacherPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.studentResultsDirectionalTestTeacher.name,
      path: AppRoutes.studentResultsDirectionalTestTeacher.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const StudentResultsDirectionalTestTeacherPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.scoreTestsTeacher.name,
      path: AppRoutes.scoreTestsTeacher.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const ScoreTestsTeacherPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.createScoreTestTeacher.name,
      path: AppRoutes.createScoreTestTeacher.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          CreateScoreTestTeacherPage(
            type: int.parse(state.pathParameters['type']!),
          ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.scoreTestDetailsTeacher.name,
      path: AppRoutes.scoreTestDetailsTeacher.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const ScoreTestDetailsTeacherPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.studentResultsScoreTestTeacher.name,
      path: AppRoutes.studentResultsScoreTestTeacher.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const StudentResultsScoreTestTeacherPage().defaultPage(state: state),
    ),
    //Magazine Teacher
    GoRoute(
      name: AppRoutes.recordMagazineTeacher.name,
      path: AppRoutes.recordMagazineTeacher.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => RecordMagazineTeacherPage(
        id: int.parse(state.pathParameters['id']!),
        name: state.pathParameters['name']!,
        curator: bool.parse(state.pathParameters['curator']!),
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.planTeacher.name,
      path: AppRoutes.planTeacher.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => PlanTeacherPage(
        id: int.parse(state.pathParameters['id']!),
        name: state.pathParameters['name']!,
        quarter: int.parse(state.pathParameters['quarter']!),
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.importTeacher.name,
      path: AppRoutes.importTeacher.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => ImportTeacherPage(
        id: int.parse(state.pathParameters['id']!),
        quarter: int.parse(state.pathParameters['quarter']!),
      ).defaultPage(state: state),
    ),
  ],
);
