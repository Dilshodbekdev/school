import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/components/app_container.dart';
import 'package:school/src/config/components/app_elevated_button.dart';
import 'package:school/src/config/components/no_info_text.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/config/theme/text_styles.dart';
import 'package:school/src/core/router/app_routes.dart';
import 'package:school/src/features/student/home/data/models/quarter_student_model.dart';
import 'package:school/src/features/student/test/iq/presentation/manager/iq_test_student_bloc.dart';
import 'package:school/src/features/student/test/iq/presentation/widgets/new_iq_test_item.dart';
import 'package:school/src/features/student/test/simple/data/bodies/create_simple_test_student_body.dart';
import 'package:school/src/features/student/test/simple/presentation/widgets/started_simple_test_item.dart';
import 'package:toastification/toastification.dart';

class IqTestsStudentPage extends StatefulWidget {
  const IqTestsStudentPage({super.key});

  @override
  State<IqTestsStudentPage> createState() => _IqTestsStudentPageState();
}

class _IqTestsStudentPageState extends State<IqTestsStudentPage> {
  late final bloc = context.read<IqTestStudentBloc>();

  @override
  void initState() {
    super.initState();
    bloc.newTests();
    bloc.startedTests();
    bloc.completedTests();
  }

  QuarterStudentModel? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Text(S.of(context).task),
      ),
      body: BlocConsumer<IqTestStudentBloc, IqTestStudentState>(
        listener: (context,state){
          if(state.isCreatedSimpleTest){
            bloc.getTest(state.createSimpleTestStudentModel?.id??0);
          }
          if(state.isGetSimpleTest){
            context.pushNamed(AppRoutes.iqTestStudent.name);
          }
          if(state.hasError){
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
                  margin: const EdgeInsets.only(right: 16,left: 16,top: 16,bottom: 8),
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
                      Tab(text: S.of(context).newTest),
                      Tab(text: S.of(context).started),
                      Tab(text: S.of(context).completed),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(children: [
                    state.newSimpleTests.isNotEmpty?
                    LazyLoadScrollView(
                      scrollDirection: Axis.horizontal,
                      isLoading: state.isPagingNewSimpleTest,
                      onEndOfPage: () => bloc.pagingNewTests(),
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        itemCount: state.newSimpleTests.length + (state.isPagingNewSimpleTest ? 1 : 0),
                        itemBuilder: (context, index) => index == state.newSimpleTests.length
                            ? const Center(child: CircularProgressIndicator())
                            : NewIqTestItem(
                          model: state.newSimpleTests[index],
                          onClick: () {
                            showDialog<void>(
                              context: context,
                              barrierDismissible: true, // user must tap button!
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(S.of(context).startTest,style: CustomTextStyle.h24SB,),
                                        const Gap(20),
                                        RichText(
                                          text: TextSpan(
                                            text: S.of(context).testTime,
                                            style: const TextStyle(
                                              fontWeight:FontWeight.w500,
                                              fontSize: 16,
                                              color: AppColors.secondaryTextColor,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(text: state.newSimpleTests[index].testTime,
                                                style: const TextStyle(
                                                fontWeight:FontWeight.w500,
                                                fontSize: 16,
                                                color: AppColors.mainColor,
                                              ),),
                                            ],
                                          ),
                                        ),
                                        const Gap(8),
                                        RichText(
                                          text: TextSpan(
                                            text: S.of(context).questions,
                                            style: const TextStyle(
                                              fontWeight:FontWeight.w500,
                                              fontSize: 16,
                                              color: AppColors.secondaryTextColor,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(text: S.of(context).pcs(state.newSimpleTests[index].numberOfQuestions??0),
                                                style: const TextStyle(
                                                  fontWeight:FontWeight.w500,
                                                  fontSize: 16,
                                                  color: AppColors.mainColor,
                                                ),),
                                            ],
                                          ),
                                        ),
                                        const Gap(20),
                                        Row(
                                          children: [
                                            Expanded(child: AppElevatedButton(text: S.of(context).cancel, onClick: (){
                                              context.pop();
                                            },bgColor: Colors.red,)),
                                            const Gap(16),
                                            Expanded(child: AppElevatedButton(text: S.of(context).accept, onClick: (){
                                              bloc.createTest(CreateSimpleTestStudentBody(test: state.newSimpleTests[index].id));
                                              context.pop();
                                            },bgColor: Colors.green,)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ):const Center(child: NoInfoText()),
                    state.startedSimpleTests.isNotEmpty?
                    LazyLoadScrollView(
                      scrollDirection: Axis.horizontal,
                      isLoading: state.isPagingStartedSimpleTest,
                      onEndOfPage: () => bloc.pagingStartedTests(),
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        itemCount: state.startedSimpleTests.length + (state.isPagingStartedSimpleTest ? 1 : 0),
                        itemBuilder: (context, index) => index == state.startedSimpleTests.length
                            ? const Center(child: CircularProgressIndicator())
                            : StartedSimpleTestItem(
                          model: state.startedSimpleTests[index],
                          onClick: () {
                            showDialog<void>(
                              context: context,
                              barrierDismissible: true, // user must tap button!
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(S.of(context).startTest,style: CustomTextStyle.h24SB,),
                                        const Gap(20),
                                        RichText(
                                          text: TextSpan(
                                            text: S.of(context).testTime,
                                            style: const TextStyle(
                                              fontWeight:FontWeight.w500,
                                              fontSize: 16,
                                              color: AppColors.secondaryTextColor,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(text: S.of(context).minutes(state.startedSimpleTests[index].remainingTime.toString()),
                                                style: const TextStyle(
                                                  fontWeight:FontWeight.w500,
                                                  fontSize: 16,
                                                  color: AppColors.mainColor,
                                                ),),
                                            ],
                                          ),
                                        ),
                                        const Gap(8),
                                        RichText(
                                          text: TextSpan(
                                            text: S.of(context).questions,
                                            style: const TextStyle(
                                              fontWeight:FontWeight.w500,
                                              fontSize: 16,
                                              color: AppColors.secondaryTextColor,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(text: S.of(context).pcs(state.startedSimpleTests[index].questionCount??0),
                                                style: const TextStyle(
                                                  fontWeight:FontWeight.w500,
                                                  fontSize: 16,
                                                  color: AppColors.mainColor,
                                                ),),
                                            ],
                                          ),
                                        ),
                                        const Gap(20),
                                        Row(
                                          children: [
                                            Expanded(child: AppElevatedButton(text: S.of(context).cancel, onClick: (){
                                              context.pop();
                                            },bgColor: Colors.red,)),
                                            const Gap(16),
                                            Expanded(child: AppElevatedButton(text: S.of(context).accept, onClick: (){
                                              bloc.getTest(state.startedSimpleTests[index].id??0);
                                              context.pop();
                                            },bgColor: Colors.green,)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ):const Center(child: NoInfoText()),
                    state.completedSimpleTests.isNotEmpty?
                    LazyLoadScrollView(
                      scrollDirection: Axis.horizontal,
                      isLoading: state.isPagingCompletedSimpleTest,
                      onEndOfPage: () => bloc.pagingCompletedTests(),
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        itemCount: state.completedSimpleTests.length + (state.isPagingCompletedSimpleTest ? 1 : 0),
                        itemBuilder: (context, index) => index == state.completedSimpleTests.length
                            ? const Center(child: CircularProgressIndicator())
                            : StartedSimpleTestItem(
                          model: state.completedSimpleTests[index],
                          onClick: () {
                            context.pushNamed(AppRoutes.completedIqTestStudent.name,pathParameters: {'id':state.completedSimpleTests[index].id.toString()});
                          },
                        ),
                      ),
                    ):const NoInfoText(),
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
