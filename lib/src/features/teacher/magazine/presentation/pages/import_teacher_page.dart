import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:open_file/open_file.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/components/app_container.dart';
import 'package:school/src/config/components/app_divider.dart';
import 'package:school/src/config/components/app_elevated_button.dart';
import 'package:school/src/config/components/text_field_components.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/config/theme/text_styles.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/import_body.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/plan_body.dart';
import 'package:school/src/features/teacher/magazine/presentation/manager/magazine_teacher_bloc.dart';
import 'package:toastification/toastification.dart';

class ImportTeacherPage extends StatefulWidget {
  final int id;
  final int quarter;

  const ImportTeacherPage({
    super.key,
    required this.id,
    required this.quarter,
  });

  @override
  State<ImportTeacherPage> createState() => _ImportTeacherPageState();
}

class _ImportTeacherPageState extends State<ImportTeacherPage> {
  late final bloc = context.read<MagazineTeacherBloc>();
  File? selectedFile;

  final form = FormGroup({
    'number': FormControl<int>(validators: [Validators.required]),
    'name': FormControl<int>(validators: [Validators.required]),
    'homework': FormControl<int>(validators: [Validators.required]),
  });

  FormControl<int> get name => form.control('name') as FormControl<int>;

  FormControl<int> get number => form.control('number') as FormControl<int>;

  FormControl<int> get homework => form.control('homework') as FormControl<int>;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Text(S.of(context).import1),
      ),
      body: BlocConsumer<MagazineTeacherBloc, MagazineTeacherState>(
        listener: (context, state) {
          if(state.isImported){
            toastification.show(
                title: Text(
                  state.importTeacherModel?.message??'--',
                  style: const TextStyle(fontSize: 16),
                  maxLines: 4,
                ),
                type: ToastificationType.success,
                alignment: Alignment.bottomCenter,
                showProgressBar: false,
                style: ToastificationStyle.fillColored,
                autoCloseDuration: 5.seconds,
                primaryColor: AppColors.mainGreenColor);
            bloc.plans(PlanBody(quarter: widget.quarter, record: widget.id));
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
                      children: [
                        GestureDetector(
                          onTap: () async {
                            if (selectedFile != null) {
                              OpenFile.open(selectedFile?.path);
                            } else {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['xlsx', 'xls'],
                              );
                              if (result != null &&
                                  result.files.single.path != null) {
                                int bytes =
                                    await File(result.files.single.path!)
                                        .length();
                                debugPrint(result.files.single.path);
                                if (bytes <= 5242880) {
                                  setState(() {
                                    selectedFile =
                                        File(result.files.single.path!);
                                  });
                                  bloc.readColumns(
                                      File(result.files.single.path!));
                                } else {
                                  toastification.show(
                                      title: Text(
                                        S.of(context).filesizeshouldnotexceed3MB,
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
                              } else {
                                /// User canceled the picker
                              }
                            }
                          },
                          child: DottedBorder(
                            dashPattern: const [6, 6],
                            strokeWidth: 1,
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(4),
                            color:selectedFile==null?Colors.red: Colors.grey,
                            child: state.isLoading
                                ? const LinearProgressIndicator(
                                    color: AppColors.mainColor,
                                  )
                                : Container(
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    color: AppColors.bgColor,
                                    child: selectedFile == null
                                        ? Row(
                                            children: [
                                              const Icon(
                                                Icons.file_upload_outlined,
                                                color: AppColors.mainColor,
                                              ),
                                              const Gap(8),
                                              Text(
                                                S.of(context).download,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: AppColors.mainColor,
                                                ),
                                              )
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  selectedFile?.path
                                                          .split('/')
                                                          .last ??
                                                      '--',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: AppColors.mainColor,
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      selectedFile = null;
                                                    });
                                                  },
                                                  icon: const Icon(
                                                    Icons.delete_outline,
                                                    color:
                                                        AppColors.mainRedColor,
                                                  ))
                                            ],
                                          ),
                                  ),
                          ),
                        ),
                        const Gap(16),
                        Text(S.of(context).filesizeshouldnotexceed3MB),
                        const Gap(16),
                        const AppDivider(),
                        const Gap(16),
                        Table(
                          children: [
                            TableRow(children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  S.of(context).no,
                                  style: CustomTextStyle.h16SB,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: ReactiveDropdownField<int>(
                                  isExpanded: true,
                                  formControl: number,
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
                                  borderRadius: BorderRadius.circular(6),
                                  items: state.readColumns?.map((e) {
                                        return DropdownMenuItem(
                                          value: e.column,
                                          child: Text(e.name ?? '--'),
                                        );
                                      }).toList() ??
                                      [],
                                  hint: Text(
                                    S.of(context).column,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                  validationMessages: {
                                    'required': (error) =>
                                        S.of(context).thefieldmustnotbeempty,
                                  },
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  S.of(context).name,
                                  style: CustomTextStyle.h16SB,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: ReactiveDropdownField<int>(
                                  isExpanded: true,
                                  formControl: name,
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
                                  borderRadius: BorderRadius.circular(6),
                                  items: state.readColumns?.map((e) {
                                        return DropdownMenuItem(
                                          value: e.column,
                                          child: Text(e.name ?? '--'),
                                        );
                                      }).toList() ??
                                      [],
                                  hint: Text(
                                    S.of(context).column,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                  validationMessages: {
                                    'required': (error) =>
                                        S.of(context).thefieldmustnotbeempty,
                                  },
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  S.of(context).homework,
                                  style: CustomTextStyle.h16SB,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: ReactiveDropdownField<int>(
                                  isExpanded: true,
                                  formControl: homework,
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
                                  borderRadius: BorderRadius.circular(6),
                                  items: state.readColumns?.map((e) {
                                        return DropdownMenuItem(
                                          value: e.column,
                                          child: Text(e.name ?? '--'),
                                        );
                                      }).toList() ??
                                      [],
                                  hint: Text(
                                    S.of(context).column,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                  validationMessages: {
                                    'required': (error) =>
                                        S.of(context).thefieldmustnotbeempty,
                                  },
                                ),
                              ),
                            ]),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Gap(20),
                  ReactiveFormConsumer(builder: (context, form, child) {
                    return AppElevatedButton(
                        text: S.of(context).save,
                        onClick: () {
                          if (form.valid) {
                            bloc.import(ImportBody(
                              quarter: widget.quarter,
                              record: widget.id,
                              homework: homework.value??0,
                              title: name.value ?? 0,
                              number: number.value ?? 0,
                              file: selectedFile,
                            ));
                          } else {
                            form.markAllAsTouched();
                          }
                        });
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
