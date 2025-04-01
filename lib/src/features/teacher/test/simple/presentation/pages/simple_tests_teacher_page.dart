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
import 'package:school/src/features/teacher/test/simple/presentation/manager/simple_test_teacher_bloc.dart';
import 'package:school/src/features/teacher/test/simple/presentation/widgets/active_simple_test_item.dart';
import 'package:toastification/toastification.dart';

class SimpleTestsTeacherPage extends StatefulWidget {
  const SimpleTestsTeacherPage({super.key});

  @override
  State<SimpleTestsTeacherPage> createState() => _SimpleTestsTeacherPageState();
}

class _SimpleTestsTeacherPageState extends State<SimpleTestsTeacherPage> {
  late final bloc = context.read<SimpleTestTeacherBloc>();

  @override
  void initState() {
    super.initState();
    bloc.activeSimpleTests();
    bloc.templateSimpleTests();
    bloc.completedSimpleTests();
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
          context.pushNamed(AppRoutes.createSimpleTestTeacher.name,pathParameters: {
            'type':'0'
          });
        },
        backgroundColor: AppColors.mainColor,
        child: const Icon(Icons.add,color: Colors.white,),
      ),
      body: BlocConsumer<SimpleTestTeacherBloc, SimpleTestTeacherState>(
        listener: (context, state) {
          if (state.hasError) {
            toastification.show(
                title: Text(
                  state.errorMessage,
                  style: const TextStyle(fontSize: 16),
                  maxLines: 4,
                ),
                type: ToastificationType.error,
                alignment: Alignment.bottomCenter,
                showProgressBar: false,
                style: ToastificationStyle.fillColored,
                autoCloseDuration: 5.seconds,
                primaryColor: Colors.redAccent);
          }
        },
        builder: (context, state) {
          return DefaultTabController(
            length: 3,
            child: Column(
              children: [
                AppContainer(
                  margin: const EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 8),
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
                    state.activeSimpleTests.isNotEmpty
                        ? LazyLoadScrollView(
                            isLoading: state.isPagingActiveSimpleTest,
                            onEndOfPage: ()=> bloc.pagingActiveSimpleTests()
                            ,
                            child: ListView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              itemCount: state.activeSimpleTests.length + (state.isPagingActiveSimpleTest ? 1 : 0),
                              itemBuilder: (context, index) => index == state.activeSimpleTests.length
                                  ? const Center(child: CircularProgressIndicator())
                                  : ActiveSimpleTestItem(
                                      model: state.activeSimpleTests[index],
                                      onClick: () {
                                        bloc.getSimpleTest(state.activeSimpleTests[index].id ?? 0);
                                        context.pushNamed(AppRoutes.simpleTestDetailsTeacher.name);
                                      },
                                    ),
                            ),
                          )
                        : const Center(child: NoInfoText()),
                    state.completedSimpleTests.isNotEmpty
                        ? LazyLoadScrollView(
                            isLoading: state.isPagingCompletedSimpleTest,
                            onEndOfPage: () =>
                                bloc.pagingCompletedSimpleTests(),
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              itemCount: state.completedSimpleTests.length +
                                  (state.isPagingCompletedSimpleTest ? 1 : 0),
                              itemBuilder: (context, index) => index ==
                                      state.completedSimpleTests.length
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : ActiveSimpleTestItem(
                                      model: state.completedSimpleTests[index],
                                      onClick: () {},
                                    ),
                            ),
                          )
                        : const Center(child: NoInfoText()),
                    state.templateSimpleTests.isNotEmpty
                        ? LazyLoadScrollView(
                            isLoading: state.isPagingTemplateSimpleTest,
                            onEndOfPage: () => bloc.pagingTemplateSimpleTests(),
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              itemCount: state.templateSimpleTests.length +
                                  (state.isPagingTemplateSimpleTest ? 1 : 0),
                              itemBuilder: (context, index) => index ==
                                      state.templateSimpleTests.length
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : ActiveSimpleTestItem(
                                      model: state.templateSimpleTests[index],
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
