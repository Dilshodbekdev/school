import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/core/app_state/cubit/app_cubit.dart';
import 'package:school/src/core/locator.dart';
import 'package:school/src/core/router/route_config.dart';
import 'package:school/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:school/src/features/student/diary/presentation/manager/diary_student_bloc.dart';
import 'package:school/src/features/student/home/presentation/manager/home_student_bloc.dart';
import 'package:school/src/features/student/test/directional/presentation/manager/directional_test_student_bloc.dart';
import 'package:school/src/features/student/test/iq/presentation/manager/iq_test_student_bloc.dart';
import 'package:school/src/features/student/test/score/presentation/manager/score_test_student_bloc.dart';
import 'package:school/src/features/student/test/simple/presentation/manager/simple_test_student_bloc.dart';
import 'package:school/src/features/teacher/home/presentation/manager/home_teacher_bloc.dart';
import 'package:school/src/features/teacher/magazine/presentation/manager/magazine_teacher_bloc.dart';
import 'package:school/src/features/teacher/test/directional/presentation/manager/directional_test_teacher_bloc.dart';
import 'package:school/src/features/teacher/test/iq/presentation/manager/iq_test_teacher_bloc.dart';
import 'package:school/src/features/teacher/test/score/presentation/manager/score_test_teacher_bloc.dart';
import 'package:school/src/features/teacher/test/simple/presentation/manager/simple_test_teacher_bloc.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => locator<AppCubit>()..init()),
          BlocProvider(create: (context) => locator<AuthBloc>()),
          BlocProvider(create: (context) => locator<HomeStudentBloc>()),
          BlocProvider(create: (context) => locator<DiaryStudentBloc>()),
          BlocProvider(create: (context) => locator<SimpleTestStudentBloc>()),
          BlocProvider(create: (context) => locator<IqTestStudentBloc>()),
          BlocProvider(create: (context) => locator<DirectionalTestStudentBloc>()),
          BlocProvider(create: (context) => locator<ScoreTestStudentBloc>()),
          BlocProvider(create: (context) => locator<HomeTeacherBloc>()),
          BlocProvider(create: (context) => locator<MagazineTeacherBloc>()),
          BlocProvider(create: (context) => locator<SimpleTestTeacherBloc>()),
          BlocProvider(create: (context) => locator<IqTestTeacherBloc>()),
          BlocProvider(create: (context) => locator<DirectionalTestTeacherBloc>()),
          BlocProvider(create: (context) => locator<ScoreTestTeacherBloc>()),
        ],
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return ToastificationWrapper(
              child: MaterialApp.router(
                locale: state.locale,
                supportedLocales: S.delegate.supportedLocales,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                debugShowCheckedModeBanner: false,
                title: 'Lumos Mind',
                theme: ThemeData(
                    appBarTheme: const AppBarTheme(
                      backgroundColor: Colors.white,
                      titleTextStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24.0),
                          bottomRight: Radius.circular(24.0),
                        ),
                      ),
                    ),
                    bottomNavigationBarTheme:
                        const BottomNavigationBarThemeData(
                      backgroundColor: Colors.white,
                    ),
                    useMaterial3: true,
                    fontFamily: 'GolosText'),
                routeInformationParser: appRouter.routeInformationParser,
                routeInformationProvider: appRouter.routeInformationProvider,
                routerDelegate: appRouter.routerDelegate,
              ),
            );
          },
        ));
  }
}
