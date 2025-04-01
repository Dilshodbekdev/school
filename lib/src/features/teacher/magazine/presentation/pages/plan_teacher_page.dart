import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/components/app_container.dart';
import 'package:school/src/config/components/app_elevated_button.dart';
import 'package:school/src/config/components/no_info_text.dart';
import 'package:school/src/config/components/text_field_components.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/config/theme/text_styles.dart';
import 'package:school/src/core/router/app_routes.dart';
import 'package:school/src/core/util/funs.dart';
import 'package:school/src/features/teacher/home/presentation/manager/home_teacher_bloc.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/plan_body.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/update_plan_body.dart';
import 'package:school/src/features/teacher/magazine/presentation/manager/magazine_teacher_bloc.dart';
import 'package:toastification/toastification.dart';

class PlanTeacherPage extends StatefulWidget {
  final int id;
  final String name;
  final int quarter;

  const PlanTeacherPage({
    super.key,
    required this.id,
    required this.name,
    required this.quarter,
  });

  @override
  State<PlanTeacherPage> createState() => _PlanTeacherPageState();
}

class _PlanTeacherPageState extends State<PlanTeacherPage> {
  late final bloc = context.read<MagazineTeacherBloc>();
  int quarter=-1;

  final form = FormGroup({
    'name': FormControl<String>(validators: [Validators.required]),
    'homework': FormControl<String>(validators: [Validators.required]),
  });

  FormControl<String> get name => form.control('name') as FormControl<String>;
  FormControl<String> get homework => form.control('homework') as FormControl<String>;

  @override
  void initState() {
    super.initState();
    quarter=widget.quarter;
    bloc.plans(PlanBody(quarter: widget.quarter, record: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: BlocConsumer<MagazineTeacherBloc, MagazineTeacherState>(
        listener: (context, state){
          if(state.isUpdatePlan){
            bloc.plans(PlanBody(quarter: widget.quarter, record: widget.id));
          }
          if(state.isDeletePlan){
            bloc.plans(PlanBody(quarter: widget.quarter, record: widget.id));
          }
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
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                BlocBuilder<HomeTeacherBloc, HomeTeacherState>(
                  builder: (context, stateHome) {
                    return AppContainer(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                filled: true,
                                isDense: true,
                                fillColor: AppColors.bgColor,
                                border: appTextFiledBorder(),
                                enabledBorder: appTextFiledBorder(),
                                disabledBorder: appTextFiledBorder(),
                                focusedBorder: appTextFiledBorder(),
                                errorBorder: appTextFiledErrorBorder(),
                              ),
                              value: stateHome.quarters
                                  ?.where((item) =>
                                      item.id == stateHome.currentQuarter?.id)
                                  .toList()
                                  .first,
                              hint: Text(S.of(context).quarter),
                              isDense: true,
                              borderRadius: BorderRadius.circular(8),
                              items: stateHome.quarters?.map((e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    S.of(context).quarterByIndex(e.number??0)
                                  ),
                                );
                              }).toList(),
                              onChanged: (val) {
                                quarter=val?.id??0;
                                bloc.plans(PlanBody(quarter: val?.id, record: widget.id));
                              },
                            ),
                          ),
                          const Gap(16),
                          SizedBox(
                            width: 120,
                            child: AppElevatedButton(
                              text: S.of(context).import,
                              onClick: () {
                                context.pushNamed(AppRoutes.importTeacher.name,pathParameters: {
                                  'id':widget.id.toString(),
                                  'quarter':quarter.toString(),
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                const Gap(16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: AppContainer(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        state.plans?.isNotEmpty == true
                            ? DataTable(
                                showCheckboxColumn: false,
                                dividerThickness: 1,
                                border: TableBorder.all(
                                  color: AppColors.dividerColor,
                                ),
                                columns: [
                                  appDataColumn(S.of(context).no),
                                  appDataColumn(S.of(context).name),
                                  appDataColumn(S.of(context).date),
                                  appDataColumn(S.of(context).homework),
                                  appDataColumn(''),
                                ],
                                rows: List<DataRow>.generate(
                                  state.plans?.length ?? 0,
                                  (index) => DataRow(
                                    onSelectChanged: (selected) {},
                                    cells: <DataCell>[
                                      DataCell(Text(state.plans?[index].number
                                              .toString() ??
                                          '-')),
                                      DataCell(Text(
                                          state.plans?[index].title ?? '-')),
                                      DataCell(Text(
                                          state.plans?[index].date ?? '-')),
                                      DataCell(Text(
                                          state.plans?[index].homework ?? '-')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              name.value=state.plans?[index].title;
                                              homework.value=state.plans?[index].homework;
                                              showModalBottomSheet<void>(
                                                context: context,
                                                backgroundColor: Colors.white,
                                                builder: (BuildContext context) {
                                                  return ReactiveForm(
                                                    formGroup: form,
                                                    child: SizedBox(
                                                      height: 300,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 16),
                                                            child: ReactiveTextField(
                                                              style: CustomTextStyle.h16M,
                                                              formControl: name,
                                                              decoration: InputDecoration(
                                                                filled: true,
                                                                fillColor: AppColors.bgColor,
                                                                labelText: S.of(context).name,
                                                                border: appTextFiledBorder(),
                                                                enabledBorder: appTextFiledBorder(),
                                                                disabledBorder: appTextFiledBorder(),
                                                                focusedBorder: appTextFiledBorder(),
                                                                errorBorder: appTextFiledErrorBorder(),
                                                              ),
                                                              validationMessages: {
                                                                'required': (error) => S.of(context).thefieldmustnotbeempty,
                                                              },
                                                            ),
                                                          ),
                                                          const Gap(16),
                                                          Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 16),
                                                            child: ReactiveTextField(
                                                              style: CustomTextStyle.h16M,
                                                              formControl: homework,
                                                              decoration: InputDecoration(
                                                                filled: true,
                                                                fillColor: AppColors.bgColor,
                                                                labelText: S.of(context).homework,
                                                                border: appTextFiledBorder(),
                                                                enabledBorder: appTextFiledBorder(),
                                                                disabledBorder: appTextFiledBorder(),
                                                                focusedBorder: appTextFiledBorder(),
                                                                errorBorder: appTextFiledErrorBorder(),
                                                              ),
                                                              validationMessages: {
                                                                'required': (error) => S.of(context).thefieldmustnotbeempty,
                                                              },
                                                            ),
                                                          ),
                                                          const Gap(20),
                                                          ReactiveFormConsumer(builder: (context, form, child){
                                                            return Padding(
                                                              padding: const EdgeInsets.symmetric(horizontal: 16),
                                                              child: AppElevatedButton(text: S.of(context).save, onClick: (){
                                                                if (form.valid) {
                                                                  bloc.updatePlan(
                                                                      UpdatePlanBody(
                                                                          id: state.plans?[index].id,
                                                                          title: name.value,
                                                                        homework: homework.value,
                                                                      )
                                                                  );
                                                                  context.pop();
                                                                } else {
                                                                  form.markAllAsTouched();
                                                                }
                                                              }),
                                                            );
                                                          })
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.edit,
                                              color: AppColors.mainColor,
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {
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
                                                            Text(S.of(context).doYouWontToDelete,style: CustomTextStyle.h24SB,),
                                                            const Gap(20),
                                                            Row(
                                                              children: [
                                                                Expanded(child: AppElevatedButton(text: S.of(context).cancel, onClick: (){
                                                                  context.pop();
                                                                },bgColor: Colors.red,)),
                                                                const Gap(16),
                                                                Expanded(child: AppElevatedButton(text: S.of(context).accept, onClick: (){
                                                                  bloc.deletePlan(state.plans?[index].id??0);
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
                                              icon: const Icon(
                                                Icons.delete,
                                                color: AppColors.mainRedColor,
                                              )),
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
          );
        },
      ),
    );
  }
}
