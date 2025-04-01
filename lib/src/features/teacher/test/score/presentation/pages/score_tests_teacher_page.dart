import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/components/app_container.dart';
import 'package:school/src/config/components/no_info_text.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/config/theme/text_styles.dart';
import 'package:school/src/core/router/app_routes.dart';
import 'package:school/src/features/teacher/test/directional/presentation/manager/directional_test_teacher_bloc.dart';
import 'package:school/src/features/teacher/test/iq/presentation/widgets/active_iq_test_item.dart';
import 'package:school/src/features/teacher/test/score/presentation/manager/score_test_teacher_bloc.dart';
import 'package:toastification/toastification.dart';

class ScoreTestsTeacherPage extends StatefulWidget {
  const ScoreTestsTeacherPage({super.key});

  @override
  State<ScoreTestsTeacherPage> createState() => _ScoreTestsTeacherPageState();
}

class _ScoreTestsTeacherPageState extends State<ScoreTestsTeacherPage> {
  late final bloc = context.read<ScoreTestTeacherBloc>();

  @override
  void initState() {
    super.initState();
    bloc.activeTests();
    bloc.templateTests();
    bloc.completedTests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Text(S.of(context).task),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(AppRoutes.createScoreTestTeacher.name,pathParameters: {
            'type':'0'
          });
        },
        backgroundColor: AppColors.mainColor,
        child: const Icon(Icons.add,color: Colors.white,),
      ),
      body: BlocBuilder<ScoreTestTeacherBloc, ScoreTestTeacherState>(
        builder: (context, state) {
          return DefaultTabController(
            length: 3,
            child: Column(
              children: [
                AppContainer(
                  margin: const EdgeInsets.only(
                      right: 16, left: 16, top: 16, bottom: 8),
                  padding: EdgeInsets.zero,
                  radius: 8,
                  child: TabBar(
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.mainColor.withOpacity(0.2),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    splashBorderRadius: BorderRadius.circular(8),
                    labelStyle: CustomTextStyle.h16R,
                    labelColor: AppColors.mainColor,
                    unselectedLabelStyle: CustomTextStyle.h16R,
                    tabs: <Widget>[
                      Tab(text: S.of(context).active),
                      Tab(text: S.of(context).completed),
                      Tab(text: S.of(context).template),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(children: [
                    state.activeTests.isNotEmpty
                        ? LazyLoadScrollView(
                            isLoading: state.isPagingActiveTest,
                            onEndOfPage: ()=> bloc.pagingActiveTests()
                            ,
                            child: ListView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              itemCount: state.activeTests.length + (state.isPagingActiveTest ? 1 : 0),
                              itemBuilder: (context, index) => index == state.activeTests.length
                                  ? const Center(child: CircularProgressIndicator())
                                  : ActiveIqTestItem(
                                      model: state.activeTests[index],
                                      onClick: () {
                                        bloc.getTest(state.activeTests[index].id ?? 0);
                                        context.pushNamed(AppRoutes.scoreTestDetailsTeacher.name);
                                      },
                                    ),
                            ),
                          )
                        : const Center(child: NoInfoText()),
                    state.completedTests.isNotEmpty
                        ? LazyLoadScrollView(
                            isLoading: state.isPagingCompletedTest,
                            onEndOfPage: () =>
                                bloc.pagingCompletedTests(),
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              itemCount: state.completedTests.length +
                                  (state.isPagingCompletedTest ? 1 : 0),
                              itemBuilder: (context, index) => index ==
                                      state.completedTests.length
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : ActiveIqTestItem(
                                      model: state.completedTests[index],
                                      onClick: () {},
                                    ),
                            ),
                          )
                        : const Center(child: NoInfoText()),
                    state.templateTests.isNotEmpty
                        ? LazyLoadScrollView(
                            isLoading: state.isPagingTemplateTest,
                            onEndOfPage: () => bloc.pagingTemplateTests(),
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              itemCount: state.templateTests.length +
                                  (state.isPagingTemplateTest ? 1 : 0),
                              itemBuilder: (context, index) => index ==
                                      state.templateTests.length
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : ActiveIqTestItem(
                                      model: state.templateTests[index],
                                      onClick: () {},
                                    ),
                            ),
                          )
                        : const Center(child: NoInfoText()),
                  ]),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
