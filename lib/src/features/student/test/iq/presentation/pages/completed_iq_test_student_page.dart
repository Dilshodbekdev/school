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
import 'package:school/src/features/student/test/iq/presentation/manager/iq_test_student_bloc.dart';

class CompletedIqTestStudentPage extends StatefulWidget {
  final int id;
  const CompletedIqTestStudentPage({super.key, required this.id});

  @override
  State<CompletedIqTestStudentPage> createState() => _CompletedIqTestStudentPageState();
}

class _CompletedIqTestStudentPageState extends State<CompletedIqTestStudentPage> {
  late final bloc = context.read<IqTestStudentBloc>();

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    bloc.getCompletedTest(widget.id);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Text(S.of(context).task),
      ),
      body: BlocBuilder<IqTestStudentBloc, IqTestStudentState>(
        builder: (context, state) {
          return  AppContainer(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            child: state.getCompleteSimpleTestStudentModel!=null? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    state.getCompleteSimpleTestStudentModel?.results?.length ?? 0,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Container(
                        height: 32,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: _currentPage == index ? Colors.blue : state.getCompleteSimpleTestStudentModel?.results?[index].answer!=null?AppColors.mainGreenColor.withOpacity(0.1):AppColors.bgColor,
                        ),
                        child: Center(
                          child: Text(
                            "${index + 1}",
                            style: TextStyle(
                                fontSize: 14,
                                color: _currentPage == index ? Colors.white : state.selectedTest?[index]!=null?AppColors.mainGreenColor:Colors.black,
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
                    itemCount: state.getCompleteSimpleTestStudentModel?.results?.length ?? 0,
                    itemBuilder: (context, index1) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Html(
                            data: state.getCompleteSimpleTestStudentModel?.results?[index1].question,
                            style: {
                              "h1": Style(fontSize: FontSize(32.0)), // Custom font size for <h1>
                              "p": Style(fontWeight: FontWeight.w600,
                                fontSize: FontSize(20.0),
                                color: Colors.black,),  // Custom font size for <p>
                            },
                          ),
                          Column(
                            children: List.generate(
                                state.getCompleteSimpleTestStudentModel?.results?[index1].options?.length ?? 0, (index2) {
                              return Container(
                                margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                                decoration: BoxDecoration(
                                 color:  (state.getCompleteSimpleTestStudentModel?.results?[index1].options?[index2].id)==(state.getCompleteSimpleTestStudentModel?.results?[index1].answer?.id)?
                                 (state.getCompleteSimpleTestStudentModel?.results?[index1].options?[index2].isCorrect)==true? AppColors.mainGreenColor.withOpacity(0.2):AppColors.mainRedColor.withOpacity(0.2):
                                 (state.getCompleteSimpleTestStudentModel?.results?[index1].options?[index2].isCorrect)==true? AppColors.mainGreenColor.withOpacity(0.2):AppColors.bgColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: RadioListTile<int>(
                                  title: Text(
                                    state.getCompleteSimpleTestStudentModel?.results?[index1].options?[index2].title ?? '--',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  activeColor: AppColors.mainColor,
                                  value: state.getCompleteSimpleTestStudentModel?.results?[index1].options?[index2].id ?? 0,
                                  groupValue: state.getCompleteSimpleTestStudentModel?.results?[index1].answer?.id,
                                  onChanged: (int? value) {

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
                          if (_currentPage < (state.getCompleteSimpleTestStudentModel?.results?.length ?? 0) - 1) {
                              _pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
                              _currentPage++;
                          }else{
                            context.pop();
                          }
                        },
                        text: _currentPage<((state.getCompleteSimpleTestStudentModel?.results?.length??0)-1)? S.of(context).nextOne:S.of(context).finish,
                      ),
                    ),
                  ],
                )
              ],
            ):const Center(child: CircularProgressIndicator(color: AppColors.mainColor,)),
          );
        },
      ),
    );
  }
}
