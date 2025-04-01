import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/components/app_container.dart';
import 'package:school/src/config/components/no_info_text.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/core/util/funs.dart';
import 'package:school/src/features/teacher/test/score/presentation/manager/score_test_teacher_bloc.dart';
import 'package:toastification/toastification.dart';

class StudentResultsScoreTestTeacherPage extends StatefulWidget {
  const StudentResultsScoreTestTeacherPage({super.key});

  @override
  State<StudentResultsScoreTestTeacherPage> createState() =>
      _StudentResultsScoreTestTeacherPageState();
}

class _StudentResultsScoreTestTeacherPageState
    extends State<StudentResultsScoreTestTeacherPage> {
  late final bloc = context.read<ScoreTestTeacherBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScoreTestTeacherBloc, ScoreTestTeacherState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.bgColor,
          appBar: AppBar(
            title: Text(
                "${state.studentResultsTestTeacherModel?.submitter?.lastName} ${state.studentResultsTestTeacherModel?.submitter?.firstName}"),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  scrollDirection: Axis.horizontal,
                  child: AppContainer(
                    child: Column(
                      children: [
                        state.getStudentsTestTeacherModel?.isNotEmpty == true
                            ? DataTable(
                                showCheckboxColumn: false,
                                dividerThickness: 1,
                                border: TableBorder.all(
                                  color: AppColors.dividerColor,
                                ),
                                columns: [
                                  appDataColumn('№'),
                                  appDataColumn(S.of(context).question),
                                  appDataColumn(S.of(context).answer),
                                ],
                                rows: List<DataRow>.generate(
                                  state.studentResultsTestTeacherModel?.results
                                          ?.length ??
                                      0,
                                  (index) => DataRow(
                                    onSelectChanged: (selected) {},
                                    cells: <DataCell>[
                                      DataCell(Text(state
                                              .studentResultsTestTeacherModel
                                              ?.results?[index]
                                              .number
                                              .toString() ??
                                          '-')),
                                      DataCell(Text(state
                                              .studentResultsTestTeacherModel
                                              ?.results?[index]
                                              .question
                                              .toString() ??
                                          '-')),
                                      DataCell(Row(
                                        children: [
                                          state
                                                      .studentResultsTestTeacherModel
                                                      ?.results?[index]
                                                      .answer
                                                      ?.isCorrect ==
                                                  true
                                              ? const Icon(
                                                  Icons.check_circle_rounded,
                                                  color:
                                                      AppColors.mainGreenColor)
                                              : const Icon(
                                                  Icons.check_circle_rounded,
                                                  color:
                                                      AppColors.mainRedColor),
                                          const Gap(8),
                                          Text(
                                            state.studentResultsTestTeacherModel
                                                    ?.results?[index].answer?.title
                                                    .toString() ??
                                                '-',
                                            style: TextStyle(
                                                color: state
                                                            .studentResultsTestTeacherModel
                                                            ?.results?[index]
                                                            .answer
                                                            ?.isCorrect ==
                                                        true
                                                    ? AppColors.mainGreenColor
                                                    : AppColors.mainRedColor),
                                          ),
                                        ],
                                      )),
                                    ],
                                  ),
                                ))
                            : const NoInfoText()
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
