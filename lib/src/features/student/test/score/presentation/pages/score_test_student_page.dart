import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/components/app_container.dart';
import 'package:school/src/config/components/app_divider.dart';
import 'package:school/src/config/components/app_elevated_button.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/config/theme/text_styles.dart';
import 'package:school/src/features/student/test/score/presentation/manager/score_test_student_bloc.dart';
import 'package:school/src/features/student/test/simple/data/bodies/answer_body.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:toastification/toastification.dart';

class ScoreTestStudentPage extends StatefulWidget {
  const ScoreTestStudentPage({super.key});

  @override
  State<ScoreTestStudentPage> createState() => _ScoreTestStudentPageState();
}

class _ScoreTestStudentPageState extends State<ScoreTestStudentPage> {
  late final bloc = context.read<ScoreTestStudentBloc>();

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round(); // Update the page indicator
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScoreTestStudentBloc, ScoreTestStudentState>(
      listener: (context, state) {
        if (state.isSubmitSimpleTest) {
          bloc.newTests();
          bloc.startedTests();
          bloc.completedTests();
          toastification.show(
              title: Text(S.of(context).muvaffaqiyatliSaqlandi),
              type: ToastificationType.info,
              alignment: Alignment.bottomCenter,
              showProgressBar: false,
              icon: const Icon(Icons.check_circle_outline),
              style: ToastificationStyle.fillColored,
              autoCloseDuration: 3.seconds,
              primaryColor: AppColors.mainGreenColor);
          context.pop();
          context.pop();
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
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,result){
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
                    Text(S.of(context).doYouWantFinish,style: CustomTextStyle.h18SB,),
                    const Gap(20),
                    Row(
                      children: [
                        Expanded(child: AppElevatedButton(text: S.of(context).cancel, onClick: (){
                          context.pop();
                        },bgColor: Colors.red,)),
                        const Gap(16),
                        Expanded(child: AppElevatedButton(text: S.of(context).accept, onClick: (){
                          bloc.submitTest(state.getSimpleTestStudentModel?.id??0);
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
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          title: Countdown(
            seconds: state.getSimpleTestStudentModel?.helperTestTime??0,
            build: (BuildContext context, double time) => Text(_formatTime(time.round())),
            interval: 1.seconds,
            onFinished: () {
              bloc.submitTest(state.getSimpleTestStudentModel?.id??0);
            },
          ),
        ),
        body: AppContainer(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  state.getSimpleTestStudentModel?.questions?.length ?? 0,
                      (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      height: 32,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: _currentPage == index ? Colors.blue : state.selectedTest?[index]!=null?Colors.green.withOpacity(0.1):AppColors.bgColor,
                      ),
                      child: Center(
                        child: Text(
                          "${index + 1}",
                          style: TextStyle(
                            fontSize: 14,
                            color: _currentPage == index ? Colors.white : state.selectedTest?[index]!=null?Colors.green:Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(16),
              const AppDivider(),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount:
                  state.getSimpleTestStudentModel?.questions?.length ?? 0,
                  itemBuilder: (context, index1) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Html(
                          data: state.getSimpleTestStudentModel?.questions?[index1].question,
                          style: {
                            "h1": Style(fontSize: FontSize(32.0)), // Custom font size for <h1>
                            "p": Style(fontWeight: FontWeight.w600,
                              fontSize: FontSize(20.0),
                              color: Colors.black,),  // Custom font size for <p>
                          },
                        ),
                        Column(
                          children: List.generate(
                              state.getSimpleTestStudentModel?.questions?[index1].options?.length ?? 0, (index2) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: AppColors.textFieldBgColor.withOpacity(0.1),
                                border: Border.all(
                                  color: AppColors.borderColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: RadioListTile<int>(
                                title: Text(
                                  state.getSimpleTestStudentModel?.questions?[index1].options?[index2].title ?? '--',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                activeColor: AppColors.mainColor,
                                value: state.getSimpleTestStudentModel?.questions?[index1].options?[index2].id ?? 0,
                                groupValue: state.selectedTest?[index1],
                                onChanged: (int? value) {
                                  bloc.changeSelectTest(index1, value ?? 0);
                                  bloc.answerTest(
                                     AnswerBody(
                                            answer: state.getSimpleTestStudentModel?.questions?[index1].options?[index2].id,
                                      questionId: state.getSimpleTestStudentModel?.questions?[index1].id ?? 0
                                  ));
                                },
                              ),
                            );
                          }),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppElevatedButton(
                      onClick: () {
                        if (_currentPage > 0) {
                          _pageController.previousPage(
                              duration: 300.milliseconds,
                              curve: Curves.ease);
                          _currentPage--;
                          debugPrint("current page $_currentPage");
                        }
                      },
                      text: S.of(context).previous,
                      bgColor: AppColors.bgColor,
                      textColor: AppColors.secondaryTextColor,
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    child: AppElevatedButton(
                      onClick: () {
                        if (_currentPage < (state.getSimpleTestStudentModel?.questions?.length ?? 0) - 1) {
                          _pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
                          _currentPage++;
                          debugPrint("current page $_currentPage");
                          debugPrint("current page ${state.selectedTest?.length}");
                        }else{
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
                                      Text(S.of(context).doYouWantFinish,style: CustomTextStyle.h18SB,),
                                      const Gap(20),
                                      Row(
                                        children: [
                                          Expanded(child: AppElevatedButton(text: S.of(context).cancel, onClick: (){
                                            context.pop();
                                          },bgColor: Colors.red,)),
                                          const Gap(16),
                                          Expanded(child: AppElevatedButton(text: S.of(context).accept, onClick: (){
                                            bloc.submitTest(state.getSimpleTestStudentModel?.id??0);
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
                        }
                      },
                      text: _currentPage!=((state.selectedTest?.length??0)-1)? S.of(context).nextOne:S.of(context).finish,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ),
    );
  },
);
  }
}
