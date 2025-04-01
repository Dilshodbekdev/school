import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/components/app_container.dart';
import 'package:school/src/config/components/app_divider.dart';
import 'package:school/src/config/components/app_elevated_button.dart';
import 'package:school/src/config/components/text_field_components.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/config/theme/text_styles.dart';
import 'package:school/src/features/teacher/test/iq/data/bodies/create_iq_test_body.dart';
import 'package:school/src/features/teacher/test/iq/presentation/manager/iq_test_teacher_bloc.dart';
import 'package:school/src/features/teacher/test/simple/data/models/class_select_teacher_model.dart';
import 'package:toastification/toastification.dart';

class CreateIqTestTeacherPage extends StatefulWidget {
  final int type;
  const CreateIqTestTeacherPage({super.key, required this.type});

  @override
  State<CreateIqTestTeacherPage> createState() =>
      _CreateIqTestTeacherPage();
}

class _CreateIqTestTeacherPage
    extends State<CreateIqTestTeacherPage> {
  late final bloc = context.read<IqTestTeacherBloc>();

  final form = FormGroup({
    'name': FormControl<String>(validators: [Validators.required]),
    'description': FormControl<String>(validators: [Validators.required]),
    'directions': FormControl<List<String>>(value: []),
    'input_direction': FormControl<String>(),
    'number_of_questions': FormControl<int>(validators: [Validators.required]),
    'classes': FormControl<List<ClassSelectTeacherModel>>(validators: [Validators.required]),
    'test_time': FormControl<DateTime>(validators: [Validators.required]),
    'started_date': FormControl<DateTime>(validators: [Validators.required]),
    'ended_date': FormControl<DateTime>(validators: [Validators.required]),
    'questions': FormArray([
      FormGroup({
        'title': FormControl<String>(validators: [Validators.required]),
        'direction': FormControl<String>(validators: [Validators.required]),
        'id': FormControl<int>(),
        'answers': FormArray([
          FormGroup({
            'id': FormControl<int>(),
            'ball': FormControl<int>(validators: [Validators.required]),
            'title': FormControl<String>(validators: [Validators.required]),
          }),
          FormGroup({
            'id': FormControl<int>(),
            'ball': FormControl<int>(validators: [Validators.required]),
            'title': FormControl<String>(validators: [Validators.required]),
          }),
        ]),
      })
    ]),
  });

  FormControl<String> get name => form.control('name') as FormControl<String>;
  FormControl<String> get description => form.control('description') as FormControl<String>;
  FormControl<List<String>> get directions => form.control('directions') as FormControl<List<String>>;
  FormControl<String> get inputDirection => form.control('input_direction') as FormControl<String>;
  FormControl<int> get numberOfQuestions => form.control('number_of_questions') as FormControl<int>;
  FormControl<DateTime> get testTime => form.control('test_time') as FormControl<DateTime>;
  FormControl<DateTime> get startedDate => form.control('started_date') as FormControl<DateTime>;
  FormControl<DateTime> get endedDate => form.control('ended_date') as FormControl<DateTime>;
  FormControl<List<ClassSelectTeacherModel>> get classes => form.control('classes') as FormControl<List<ClassSelectTeacherModel>>;

  FormArray get questions => form.control('questions') as FormArray;

  FormGroup _getQuestionByIndex(int index) {
    final group = questions.controls[index] as FormGroup;
    return group;
  }

  FormArray _getAnswersByQuestionIndex(int questionIndex) {
    final group = _getQuestionByIndex(questionIndex);
    final answers = group.control('answers') as FormArray;
    return answers;
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    bloc.classesSelect();
    if(widget.type==1){
      name.value=bloc.state.getTestTeacherModel?.name;
      description.value=bloc.state.getTestTeacherModel?.description;
      numberOfQuestions.value=bloc.state.getTestTeacherModel?.numberOfQuestions;
      testTime.value=DateFormat('HH:mm:ss').parse(bloc.state.getTestTeacherModel?.testTime??'');
      startedDate.value=DateFormat('dd-MM-yyyy HH:mm').parse(bloc.state.getTestTeacherModel?.startedDate??'');
      endedDate.value=DateFormat('dd-MM-yyyy HH:mm').parse(bloc.state.getTestTeacherModel?.endedDate??'');
      questions.clear();

      bloc.state.getTestTeacherModel?.questions?.asMap().forEach((key1, value1){
        questions.add(
            FormGroup({
              'title': FormControl<String>(validators: [Validators.required],value: value1.title),
              'direction': FormControl<String>(validators: [Validators.required],value: value1.direction),
              'id': FormControl<int>(value: value1.id),
              'answers': FormArray([]),
            })
        );

        bloc.state.getTestTeacherModel?.questions?[key1].answers?.asMap().forEach((key2, value2){
          _getAnswersByQuestionIndex(key1).add(
            FormGroup({
              'id': FormControl<int>(value: value2.id),
              'ball': FormControl<int>(validators: [Validators.required],value: value2.ball),
              'title': FormControl<String>(validators: [Validators.required],value: value2.title),
            }),
          );
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Text(S.of(context).createTest),
      ),
      body: BlocConsumer<IqTestTeacherBloc, IqTestTeacherState>(
        listener: (context, state) {
          if(state.isSubmitTest&&widget.type==1){
            List<ClassSelectTeacherModel>? list=[];
            for (int i = 0; i < (state.classesSelect?.length??0); i++){
              for (int j = 0; j < (state.getTestTeacherModel?.classes?.length??0); j++){
                if(state.classesSelect?[i].value==state.getTestTeacherModel?.classes?[j].id){
                  list.add(state.classesSelect![i]);
                }
              }
            }
            classes.value=list;
            debugPrint(jsonEncode(list));
          }
          if(state.isCreatedTest||state.isUpdateTest){
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
          return ReactiveForm(
            formGroup: form,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  AppContainer(
                    margin: EdgeInsets.zero,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).basicInfo,
                          style: CustomTextStyle.h18SB,
                        ),
                        const Gap(8),
                        const AppDivider(),
                        const Gap(16),
                        ReactiveTextField(
                          style: CustomTextStyle.h16M,
                          formControl: name,
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            fillColor: AppColors.bgColor,
                            labelText: S.of(context).name,
                            border: appTextFiledBorder(),
                            enabledBorder: appTextFiledBorder(),
                            disabledBorder: appTextFiledBorder(),
                            focusedBorder: appTextFiledBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                          ),
                          validationMessages: {
                            'required': (error) =>
                                S.of(context).thefieldmustnotbeempty,
                          },
                        ),
                        const Gap(16),
                        ///
                        ReactiveDropdownSearchMultiSelection<ClassSelectTeacherModel, ClassSelectTeacherModel>(
                          formControl: classes,
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            decoration: InputDecoration(
                              filled: true,
                              isDense: true,
                              fillColor: AppColors.bgColor,
                              labelText: S.of(context).classes,
                              border: appTextFiledBorder(),
                              enabledBorder: appTextFiledBorder(),
                              disabledBorder: appTextFiledBorder(),
                              focusedBorder: appTextFiledBorder(),
                              errorBorder: appTextFiledErrorBorder(),
                            ),
                          ),
                          compareFn: (item1, item2) => item1.value == item2.value,
                          popupProps: PopupPropsMultiSelection.menu(
                            menuProps: MenuProps(
                                borderRadius: BorderRadius.circular(6)),
                            showSelectedItems: false,
                          ),
                          validationMessages: {
                            'required': (error) =>
                                S.of(context).thefieldmustnotbeempty,
                          },
                          items: (_, __) => state.classesSelect?? [],
                          itemAsString: (item)=>item.label??'--',
                        ),
                        const Gap(16),
                        ReactiveDateTimePicker(
                          formControl: testTime,
                          dateFormat: DateFormat('HH:mm'),
                          type: ReactiveDatePickerFieldType.time,
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            fillColor: AppColors.bgColor,
                            labelText: S.of(context).timeForTest,
                            border: appTextFiledBorder(),
                            enabledBorder: appTextFiledBorder(),
                            disabledBorder: appTextFiledBorder(),
                            focusedBorder: appTextFiledBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                            suffixIcon: const Icon(Icons.access_time),
                          ),
                          validationMessages: {
                            'required': (error) =>
                                S.of(context).thefieldmustnotbeempty,
                          },
                        ),
                        const Gap(16),
                        ReactiveDateTimePicker(
                          formControl: startedDate,
                          type: ReactiveDatePickerFieldType.dateTime,
                          dateFormat: DateFormat('yyyy-MM-dd HH:mm'),
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            fillColor: AppColors.bgColor,
                            labelText: S.of(context).startredDate,
                            border: appTextFiledBorder(),
                            enabledBorder: appTextFiledBorder(),
                            disabledBorder: appTextFiledBorder(),
                            focusedBorder: appTextFiledBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                            suffixIcon: const Icon(Icons.calendar_month),
                          ),
                          validationMessages: {
                            'required': (error) =>
                                S.of(context).thefieldmustnotbeempty,
                          },
                        ),
                        const Gap(16),
                        ReactiveDateTimePicker(
                          formControl: endedDate,
                          type: ReactiveDatePickerFieldType.dateTime,
                          dateFormat: DateFormat('yyyy-MM-dd HH:mm'),
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            fillColor: AppColors.bgColor,
                            labelText: S.of(context).endedDate,
                            border: appTextFiledBorder(),
                            enabledBorder: appTextFiledBorder(),
                            disabledBorder: appTextFiledBorder(),
                            focusedBorder: appTextFiledBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                            suffixIcon: const Icon(Icons.calendar_month),
                          ),
                          validationMessages: {
                            'required': (error) =>
                                S.of(context).thefieldmustnotbeempty,
                          },
                        ),
                        const Gap(16),
                        ReactiveTextField(
                          formControl: description,
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            fillColor: AppColors.bgColor,
                            labelText: S.of(context).description,
                            border: appTextFiledBorder(),
                            enabledBorder: appTextFiledBorder(),
                            disabledBorder: appTextFiledBorder(),
                            focusedBorder: appTextFiledBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                          ),
                          keyboardType: TextInputType.text,
                          minLines: 4,
                          maxLines: null,
                          validationMessages: {
                            'required': (error) =>
                                S.of(context).thefieldmustnotbeempty,
                          },
                        ),
                        const Gap(16),
                        ReactiveTextField(
                          formControl: numberOfQuestions,
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            fillColor: AppColors.bgColor,
                            labelText: S.of(context).numberOfQuestions,
                            border: appTextFiledBorder(),
                            enabledBorder: appTextFiledBorder(),
                            disabledBorder: appTextFiledBorder(),
                            focusedBorder: appTextFiledBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          validationMessages: {
                            'required': (error) =>
                            S.of(context).thefieldmustnotbeempty,
                          },
                        ),
                      ],
                    ),
                  ),
                  const Gap(16),
                  AppContainer(
                    margin: EdgeInsets.zero,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).details,
                          style: CustomTextStyle.h18SB,
                        ),
                        const Gap(8),
                        const AppDivider(),
                        const Gap(16),
                        ReactiveValueListenableBuilder<List<String>>(
                          formControl: directions,
                            builder: (context, val, child){
                          return Wrap(
                            spacing: 6.0,
                            runSpacing: 6.0,
                            children: List<Widget>.generate(val.value?.length??0, (int index) {
                              return Chip(
                                backgroundColor: AppColors.bgColor,
                                side: const BorderSide(color: AppColors.dividerColor),
                                deleteIcon: const Icon(Icons.clear),
                                deleteIconColor: AppColors.mainRedColor,
                                label: Text(directions.value?[index]??''),
                                onDeleted: () {
                                  List<String> list=List<String>.from(directions.value??[]);
                                  list.removeAt(index);
                                  directions.value=list;
                                },
                              );
                            }),
                          );
                        }),
                        const Gap(16),
                        ReactiveTextField(
                          style: CustomTextStyle.h16M,
                          formControl: inputDirection,
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            fillColor: AppColors.bgColor,
                            labelText: S.of(context).directionofquestions,
                            border: appTextFiledBorder(),
                            enabledBorder: appTextFiledBorder(),
                            disabledBorder: appTextFiledBorder(),
                            focusedBorder: appTextFiledBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                          ),
                          keyboardType: TextInputType.text,
                          minLines: 1,
                          maxLines: null,
                          validationMessages: {
                            'required': (error) =>
                            S.of(context).thefieldmustnotbeempty,
                          },
                        ),
                        const Gap(16),
                        AppElevatedButton(
                          text: S.of(context).add,
                          icon: Icons.add,
                          onClick: (){
                            if(inputDirection.value?.isNotEmpty==true&&inputDirection.value!=null){
                              List<String> list=List<String>.from(directions.value??[]);
                              list.add(inputDirection.value??'-');
                              directions.value=list;
                              inputDirection.value='';
                            }else{
                              inputDirection.markAsTouched();
                            }
                          },
                          bgColor: AppColors.mainColor,
                        ),
                      ],
                    ),
                  ),
                  ReactiveFormArray(
                    formArray: questions,
                      builder: (context, array, child){
                    return Column(
                      children: List.generate(questions.controls.length, (questionIndex){
                        final question =_getQuestionByIndex(questionIndex);
                        final answers=_getAnswersByQuestionIndex(questionIndex);
                        return AppContainer(
                          margin: const EdgeInsets.only(top: 16),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    S.of(context).questionByIndex(++questionIndex),
                                    style: CustomTextStyle.h18SB,
                                  ),
                                  const Spacer(),
                                  IconButton(onPressed: (){
                                    if(questions.controls.length>1){
                                      questions.remove(question);
                                    }else{
                                      snackBar(S.of(context).theremustbeatleastonequestion);
                                    }
                                  }, icon: const Icon(Icons.clear,color: AppColors.mainRedColor,))
                                ],
                              ),
                              ReactiveValueListenableBuilder<List<String>>(
                                  formControl: directions,
                                  builder: (context, val, child){
                                    return ReactiveDropdownField(
                                      formControl: question.control('direction') as FormControl<String>,
                                      items: val.value?.map((e){
                                        return DropdownMenuItem<String>(
                                            value: e,
                                            child: Text(e),
                                        );
                                      }).toList()??[],
                                      isExpanded: true,
                                      decoration: InputDecoration(
                                        filled: true,
                                        isDense: true,
                                        fillColor: AppColors.bgColor,
                                        labelText: S.of(context).direction,
                                        border: appTextFiledBorder(),
                                        enabledBorder: appTextFiledBorder(),
                                        disabledBorder: appTextFiledBorder(),
                                        focusedBorder: appTextFiledBorder(),
                                        errorBorder: appTextFiledErrorBorder(),
                                      ),
                                    );
                                  }),
                              const AppDivider(),
                              const Gap(16),
                              ReactiveTextField(
                                formControl: question.control('title') as FormControl<String>,
                                decoration: InputDecoration(
                                  filled: true,
                                  isDense: true,
                                  fillColor: AppColors.bgColor,
                                  labelText: S.of(context).question,
                                  border: appTextFiledBorder(),
                                  enabledBorder: appTextFiledBorder(),
                                  disabledBorder: appTextFiledBorder(),
                                  focusedBorder: appTextFiledBorder(),
                                  errorBorder: appTextFiledErrorBorder(),
                                ),
                                keyboardType: TextInputType.text,
                                minLines: 4,
                                maxLines: null,
                                validationMessages: {
                                  'required': (error) =>
                                  S.of(context).thefieldmustnotbeempty,
                                },
                              ),
                              const Gap(8),
                              ReactiveFormArray(
                                  formArray: answers,
                                  builder: (context, answerArray, child){
                                return Column(
                                  children: List.generate(answers.controls.length, (answerIndex){
                                    final answer = answers.controls[answerIndex] as FormGroup;
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: ReactiveTextField(
                                              formControl: answer.control('title') as FormControl<String>,
                                              decoration: InputDecoration(
                                                filled: true,
                                                isDense: true,
                                                fillColor: AppColors.bgColor,
                                                labelText: S.of(context).answerByIndex(++answerIndex),
                                                border: appTextFiledBorder(),
                                                enabledBorder: appTextFiledBorder(),
                                                disabledBorder: appTextFiledBorder(),
                                                focusedBorder: appTextFiledBorder(),
                                                errorBorder: appTextFiledErrorBorder(),
                                              ),
                                              keyboardType: TextInputType.text,
                                              minLines: 1,
                                              maxLines: null,
                                              validationMessages: {
                                                'required': (error) =>
                                                S.of(context).thefieldmustnotbeempty,
                                              },
                                            ),
                                          ),
                                          const Gap(8),
                                          SizedBox(
                                            width:70,
                                            child: ReactiveTextField(
                                              formControl: answer.control('ball') as FormControl<int>,
                                              decoration: InputDecoration(
                                                filled: true,
                                                isDense: true,
                                                fillColor: AppColors.bgColor,
                                                labelText: S.of(context).ball,
                                                border: appTextFiledBorder(),
                                                enabledBorder: appTextFiledBorder(),
                                                disabledBorder: appTextFiledBorder(),
                                                focusedBorder: appTextFiledBorder(),
                                                errorBorder: appTextFiledErrorBorder(),
                                              ),
                                              keyboardType: TextInputType.number,
                                              minLines: 1,
                                              maxLines: null,
                                              validationMessages: {
                                                'required': (error) =>
                                                S.of(context).thefieldmustnotbeempty,
                                              },
                                            ),
                                          ),
                                          IconButton(onPressed: (){
                                            if(answers.controls.length>2){
                                              answers.remove(answer);
                                            }else{
                                              snackBar(S.of(context).theremustbeatleasttwoanswers);
                                            }
                                          }, icon: const Icon(Icons.clear,color: AppColors.mainRedColor,))
                                        ],
                                      ),
                                    );
                                  }),
                                );
                              }),
                              const Gap(16),
                              const AppDivider(),
                              TextButton.icon(
                                onPressed: (){
                                  answers.add(
                                    FormGroup({
                                      'id': FormControl<int>(),
                                      'ball': FormControl<int>(validators: [Validators.required]),
                                      'title': FormControl<String>(validators: [Validators.required]),
                                    }),
                                  );
                                },
                                label: Text(
                                  S.of(context).addAnswer,
                                  style: const TextStyle(color: AppColors.mainColor),
                                ),
                                icon: const Icon(Icons.add_circle_outline,
                                  color: AppColors.mainColor,
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                    );
                  }),
                  const Gap(16),
                  AppElevatedButton(
                    text: S.of(context).addQuestion,
                    icon: Icons.add,
                    onClick: (){
                      questions.add(
                          FormGroup({
                            'title': FormControl<String>(validators: [Validators.required]),
                            'direction': FormControl<String>(validators: [Validators.required]),
                            'id': FormControl<int>(),
                            'answers': FormArray([
                              FormGroup({
                                'id': FormControl<int>(),
                                'ball': FormControl<int>(validators: [Validators.required]),
                                'title': FormControl<String>(validators: [Validators.required]),
                              }),
                              FormGroup({
                                'id': FormControl<int>(),
                                'ball': FormControl<int>(validators: [Validators.required]),
                                'title': FormControl<String>(validators: [Validators.required]),
                              }),
                            ]),
                          })
                      );
                    },
                    bgColor: AppColors.mainColor,
                  ),
                  const Gap(16),
                  ReactiveFormConsumer(builder: (context, form, child){
                    return AppElevatedButton(
                      text: S.of(context).save,
                      onClick: (){
                        if(form.valid){
                          List<QuestionIq> questionsModel=[];
                          questions.controls.asMap().forEach((key1, value1){
                            final question = value1 as FormGroup;
                            final direction = question.control('direction') as FormControl<String>;
                            final title = question.control('title') as FormControl<String>;
                            final id = question.control('id') as FormControl<int>;

                            final List<AnswerIq> answersModel = [];
                            _getAnswersByQuestionIndex(key1).controls.asMap().forEach((key2, value2){
                              final group = value2 as FormGroup;
                              final title = group.control('title') as FormControl<String>;
                              final id = group.control('id') as FormControl<int>;
                              final ball = group.control('ball') as FormControl<int>;

                              answersModel.add(
                                AnswerIq(
                                      title: title.value,
                                      id: id.value,
                                      ball: ball.value,
                                  ),
                              );
                            });
                            questionsModel.add(
                              QuestionIq(
                                answers: answersModel,
                                title: title.value,
                                id: id.value,
                                direction: direction.value,
                              )
                            );
                          });

                          CreateIqTestBody body = CreateIqTestBody(
                            name: name.value,
                            classes: classes.value?.map((e)=>e.value??0).toList(),
                            testTime: DateFormat('HH:mm:ss').format(testTime.value??DateTime.now()),
                            startedDate: DateFormat('yyyy-MM-dd HH:mm').format(startedDate.value??DateTime.now()),
                            endedDate: DateFormat('yyyy-MM-dd HH:mm').format(endedDate.value??DateTime.now()),
                            description: description.value,
                            numberOfQuestions: numberOfQuestions.value,
                            questions: questionsModel,
                          );
                          debugPrint(jsonEncode(body));
                          if(widget.type==0){
                            bloc.createTest(body);
                          }else{
                            bloc.updateTest(body.copyWith(id: state.getTestTeacherModel?.id));
                          }
                        }else{
                          form.markAllAsTouched();
                        }
                      },
                      bgColor: AppColors.mainGreenColor,
                    );
                  })
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}