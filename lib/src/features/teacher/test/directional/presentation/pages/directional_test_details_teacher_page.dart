import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/components/app_container.dart';
import 'package:school/src/config/components/app_elevated_button.dart';
import 'package:school/src/config/components/no_info_text.dart';
import 'package:school/src/config/components/text_field_components.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/config/theme/text_styles.dart';
import 'package:school/src/core/router/app_routes.dart';
import 'package:school/src/core/util/funs.dart';
import 'package:school/src/features/teacher/test/directional/presentation/manager/directional_test_teacher_bloc.dart';
import 'package:school/src/features/teacher/test/simple/data/bodies/get_students_simple_test_body.dart';
import 'package:toastification/toastification.dart';

class DirectionalTestDetailsTeacherPage extends StatefulWidget {
  const DirectionalTestDetailsTeacherPage({super.key});

  @override
  State<DirectionalTestDetailsTeacherPage> createState() =>
      _DirectionalTestDetailsTeacherPageState();
}

class _DirectionalTestDetailsTeacherPageState
    extends State<DirectionalTestDetailsTeacherPage> {
  late final bloc = context.read<DirectionalTestTeacherBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DirectionalTestTeacherBloc, DirectionalTestTeacherState>(
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
              primaryColor: AppColors.mainRedColor);
        }
        if(state.isDeleteTest){
          toastification.show(
              title: Text(
                S.of(context).muvaffaqiyatliSaqlandi,
                style: const TextStyle(fontSize: 16),
                maxLines: 4,
              ),
              type: ToastificationType.success,
              alignment: Alignment.bottomCenter,
              showProgressBar: false,
              style: ToastificationStyle.fillColored,
              autoCloseDuration: 5.seconds,
              primaryColor: AppColors.mainGreenColor);
          bloc.activeTests();
          bloc.templateTests();
          bloc.completedTests();
          context.pop();
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.bgColor,
          appBar: AppBar(
            title: Text(state.getTestTeacherModel?.name ?? '--'),
            actions: [
              IconButton(onPressed: (){
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
                            Text(S.of(context).doYouWontToDelete,style: CustomTextStyle.h22SB,),
                            const Gap(20),
                            Row(
                              children: [
                                Expanded(child: AppElevatedButton(text: S.of(context).cancel, onClick: (){
                                  context.pop();
                                },bgColor: Colors.red,)),
                                const Gap(16),
                                Expanded(child: AppElevatedButton(text: S.of(context).accept, onClick: (){
                                  bloc.deleteTest(bloc.state.getTestTeacherModel?.id??0);
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
              }, icon: const Icon(CupertinoIcons.delete,color: AppColors.mainRedColor,))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              context.pushNamed(AppRoutes.createDirectionalTestTeacher.name,pathParameters: {
                'type':'1'
              });
            },
            backgroundColor: AppColors.mainColor,
            child: const Icon(Icons.edit,color: Colors.white,
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: TextEditingController(
                              text: state.getTestTeacherModel?.endedDate ??
                                      '--'),
                          readOnly: true,
                          style: const TextStyle(
                              color: AppColors.mainRedColor,
                              fontWeight: FontWeight.w700),
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            fillColor: AppColors.mainRedColor.withOpacity(0.1),
                            labelText: S.of(context).term,
                            labelStyle: const TextStyle(
                                color: AppColors.mainRedColor,
                                fontWeight: FontWeight.w700),
                            border: appTextFiledBorder(),
                            enabledBorder: appTextFiledBorder(),
                            disabledBorder: appTextFiledBorder(),
                            focusedBorder: appTextFiledBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                          ),
                          keyboardType: TextInputType.none,
                        ),
                      ),
                      const Gap(16),
                      SizedBox(
                        width: 100,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            fillColor: Colors.white,
                            border: appTextFiledBorder(),
                            enabledBorder: appTextFiledBorder(),
                            disabledBorder: appTextFiledBorder(),
                            focusedBorder: appTextFiledBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                          ),
                          hint: Text(S.of(context).clas),
                          value: state.getTestTeacherModel?.classes?[0],
                          isDense: true,
                          borderRadius: BorderRadius.circular(8),
                          items: state.getTestTeacherModel?.classes
                              ?.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(
                                "${e.number}-${e.letter}",
                              ),
                            );
                          }).toList(),
                          onChanged: (val) {
                            bloc.getStudentsTest(
                                GetStudentsSimpleTestBody(
                                    id: state.getTestTeacherModel?.id ?? 0,
                                    classId: val?.id ?? 0,
                                ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                const Gap(16),
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
                                  appDataColumn(S.of(context).fio),
                                  appDataColumn(S.of(context).grade),
                                ],
                                rows: List<DataRow>.generate(state.getStudentsTestTeacherModel?.length ?? 0,
                                  (index) => DataRow(
                                    selected: state.getStudentsTestTeacherModel?[index].enrollResult?.id!=null,
                                    onSelectChanged: (selected) {
                                      if(selected!=true){
                                        bloc.studentResultsTest(
                                          GetStudentsSimpleTestBody(
                                            id: state.getTestTeacherModel?.id ?? 0,
                                            classId: state.getStudentsTestTeacherModel?[index].enrollResult?.id ?? 0,
                                          ),
                                        );
                                        context.pushNamed(AppRoutes.studentResultsDirectionalTestTeacher.name);
                                      }
                                    },
                                    cells: <DataCell>[
                                      DataCell(Text(
                                          "${state.getStudentsTestTeacherModel?[index].lastName} ${state.getStudentsTestTeacherModel?[index].firstName}",
                                      )),
                                      DataCell(Text(state.getStudentsTestTeacherModel?[index].enrollResult?.count != null
                                          ? (state.getStudentsTestTeacherModel?[index].enrollResult?.count.toString() ?? '--') : ''),
                                      ),
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
