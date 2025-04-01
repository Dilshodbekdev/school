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
import 'package:school/src/features/teacher/test/simple/data/bodies/create_simple_test_body.dart';
import 'package:school/src/features/teacher/test/simple/data/models/class_select_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/presentation/manager/simple_test_teacher_bloc.dart';
import 'package:toastification/toastification.dart';

class CreateSimpleTestTeacherPage extends StatefulWidget {
  final int type;
  const CreateSimpleTestTeacherPage({super.key, required this.type});

  @override
  State<CreateSimpleTestTeacherPage> createState() =>
      _CreateSimpleTestTeacherPageState();
}

class _CreateSimpleTestTeacherPageState
    extends State<CreateSimpleTestTeacherPage> {
  late final bloc = context.read<SimpleTestTeacherBloc>();

  final form = FormGroup({
    'name': FormControl<String>(validators: [Validators.required]),
    'description': FormControl<String>(validators: [Validators.required]),
    'number_of_questions': FormControl<int>(validators: [Validators.required]),
    'classes': FormControl<List<ClassSelectTeacherModel>>(validators: [Validators.required]),
    'test_time': FormControl<DateTime>(validators: [Validators.required]),
    'started_date': FormControl<DateTime>(validators: [Validators.required]),
    'ended_date': FormControl<DateTime>(validators: [Validators.required]),
    'questions': FormArray([
      FormGroup({
        'title': FormControl<String>(validators: [Validators.required]),
        'id': FormControl<int>(),
        'selected_answer': FormControl<int>(validators: [Validators.required]),
        'answers': FormArray([
          FormGroup({
            'id': FormControl<int>(),
            'title': FormControl<String>(validators: [Validators.required]),
          }),
          FormGroup({
            'id': FormControl<int>(),
            'title': FormControl<String>(validators: [Validators.required]),
          }),
        ]),
      })
    ]),
  });

  FormControl<String> get name => form.control('name') as FormControl<String>;
  FormControl<String> get description => form.control('description') as FormControl<String>;
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
      name.value=bloc.state.getSimpleTestTeacherModel?.name;
      description.value=bloc.state.getSimpleTestTeacherModel?.description;
      numberOfQuestions.value=bloc.state.getSimpleTestTeacherModel?.numberOfQuestions;
      testTime.value=DateFormat('HH:mm:ss').parse(bloc.state.getSimpleTestTeacherModel?.testTime??'');
      startedDate.value=DateFormat('dd-MM-yyyy HH:mm').parse(bloc.state.getSimpleTestTeacherModel?.startedDate??'');
      endedDate.value=DateFormat('dd-MM-yyyy HH:mm').parse(bloc.state.getSimpleTestTeacherModel?.endedDate??'');
      questions.clear();

      bloc.state.getSimpleTestTeacherModel?.questions?.asMap().forEach((key1, value1){
        questions.add(
            FormGroup({
              'title': FormControl<String>(validators: [Validators.required],value: value1.title),
              'id': FormControl<int>(value: value1.id),
              'selected_answer': FormControl<int>(validators: [Validators.required],),
              'answers': FormArray([]),
            })
        );

        bloc.state.getSimpleTestTeacherModel?.questions?[key1].answers?.asMap().forEach((key2, value2){
          if(value2.isCorrect==true){
            (_getQuestionByIndex(key1).control('selected_answer') as FormControl<int>).value=key2;
          }
          _getAnswersByQuestionIndex(key1).add(
            FormGroup({
              'id': FormControl<int>(value: value2.id),
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
      body: BlocConsumer<SimpleTestTeacherBloc, SimpleTestTeacherState>(
        listener: (context, state) {
          if(state.isSubmitSimpleTest&&widget.type==1){
            List<ClassSelectTeacherModel>? list=[];
            for (int i = 0; i < (state.classesSelect?.length??0); i++){
              for (int j = 0; j < (state.getSimpleTestTeacherModel?.classes?.length??0); j++){
                if(state.classesSelect?[i].value==state.getSimpleTestTeacherModel?.classes?[j].id){
                  list.add(state.classesSelect![i]);
                }
              }
            }
            classes.value=list;
          }
          if(state.isCreatedSimpleTest||state.isUpdateSimpleTest){
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
            bloc.activeSimpleTests();
            bloc.templateSimpleTests();
            bloc.completedSimpleTests();
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
                              ReactiveFormArray(
                                  formArray: answers,
                                  builder: (context, answerArray, child){
                                return Column(
                                  children: List.generate(answers.controls.length, (answerIndex){
                                    final answer = answers.controls[answerIndex] as FormGroup;
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: Row(
                                        children: [
                                          ReactiveRadio(
                                              formControl: question.control('selected_answer') as FormControl<int>,
                                              value: answerIndex,
                                            activeColor: AppColors.mainColor,
                                          ),
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
                              ReactiveValueListenableBuilder<int>(
                                formControl: question.control('selected_answer') as FormControl<int>,
                                builder: (context, control, child) {
                                  return control.invalid && form.touched ? Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      S.of(context).pleaseselectaanswer,
                                      style: const TextStyle(color: AppColors.mainRedColor),
                                    ),
                                  )
                                      : const SizedBox.shrink();
                                },
                              ),
                              const AppDivider(),
                              TextButton.icon(
                                onPressed: (){
                                  answers.add(
                                      FormGroup({
                                        'id': FormControl<int>(),
                                        'title': FormControl<String>(validators: [Validators.required]),
                                      })
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
                      questions.add(FormGroup({
                        'id': FormControl<int>(),
                        'title': FormControl<String>(validators: [Validators.required]),
                        'selected_answer': FormControl<int>(validators: [Validators.required]),
                        'answers': FormArray([
                          FormGroup({
                            'id': FormControl<int>(),
                            'title': FormControl<String>(validators: [Validators.required]),
                          }),
                          FormGroup({
                            'id': FormControl<int>(),
                            'title': FormControl<String>(validators: [Validators.required]),
                          }),
                        ]),
                      }));
                    },
                    bgColor: AppColors.mainColor,
                  ),
                  const Gap(16),
                  ReactiveFormConsumer(builder: (context, form, child){
                    return AppElevatedButton(
                      text: S.of(context).save,
                      onClick: (){
                        if(form.valid){
                          List<Question> questionsModel=[];
                          questions.controls.asMap().forEach((key1, value1){
                            final question = value1 as FormGroup;
                            final selectedAnswer = question.control('selected_answer') as FormControl<int>;
                            final title = question.control('title') as FormControl<String>;
                            final id = question.control('id') as FormControl<int>;

                            final List<Answer> answersModel = [];
                            _getAnswersByQuestionIndex(key1).controls.asMap().forEach((key2, value2){
                              final group = value2 as FormGroup;
                              final title = group.control('title') as FormControl<String>;
                              final id = group.control('id') as FormControl<int>;

                              answersModel.add(
                                  Answer(
                                      title: title.value,
                                      id: id.value,
                                      isCorrect: selectedAnswer.value == key2 ? true : false,
                                  ),
                              );
                            });
                            questionsModel.add(
                              Question(
                                answers: answersModel,
                                title: title.value,
                                id: id.value,
                              )
                            );
                          });

                          CreateSimpleTestBody body = CreateSimpleTestBody(
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
                            bloc.createSimpleTest(body);
                          }else{
                            bloc.updateSimpleTest(body.copyWith(id: state.getSimpleTestTeacherModel?.id));
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