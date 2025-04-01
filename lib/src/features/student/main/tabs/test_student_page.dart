import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/core/router/app_routes.dart';
import 'package:school/src/features/student/diary/presentation/manager/diary_student_bloc.dart';
import 'package:school/src/features/student/main/widgets/home_card_widget.dart';

class TestStudentPage extends StatelessWidget {
  const TestStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).task),
      ),
      backgroundColor: AppColors.bgColor,
      body: BlocBuilder<DiaryStudentBloc, DiaryStudentState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                HomeCardWidget(
                    title: S.of(context).subjectTest,
                    content: S.of(context).seeai,
                    onClick: () {
                      context.pushNamed(AppRoutes.simpleTestsStudent.name);
                    },
                    img: 'assets/images/img_subject_test.png'),
                const Gap(16),
                HomeCardWidget(
                    title: S.of(context).directionalTests,
                    content: S.of(context).seeai,
                    onClick: () {
                      context.pushNamed(AppRoutes.directionalTestsStudent.name);
                    },
                    img: 'assets/images/img_psychological_test.png'),
                const Gap(16),
                HomeCardWidget(
                    title: S.of(context).scoreTests,
                    content: S.of(context).seeai,
                    onClick: () {
                      context.pushNamed(AppRoutes.scoreTestsStudent.name);
                    },
                    img: 'assets/images/img_psychological_test.png'),
                const Gap(16),
                HomeCardWidget(
                    title: S.of(context).iqTest,
                    content: S.of(context).seeai,
                    onClick: () {
                      context.pushNamed(AppRoutes.iqTestsStudent.name);
                    },
                    img: 'assets/images/img_iq_test.png'),
              ],
            ),
          );
        },
      ),
    );
  }
}
