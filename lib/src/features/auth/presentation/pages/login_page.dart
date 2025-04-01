import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/components/app_elevated_button.dart';
import 'package:school/src/config/components/text_field_components.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/config/theme/text_styles.dart';
import 'package:school/src/core/router/app_routes.dart';
import 'package:school/src/core/services/services.dart';
import 'package:school/src/core/util/app_constants.dart';
import 'package:school/src/core/util/enams.dart';
import 'package:school/src/features/auth/data/bodies/login_body.dart';
import 'package:school/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:toastification/toastification.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final bloc = context.read<AuthBloc>();

  final form = FormGroup({
    'username': FormControl<String>(
      validators: [Validators.required],
    ),
    'password': FormControl<String>(
      validators: [Validators.required],
    ),
    'remember': FormControl<bool>(value: false),
    'server': FormControl<String>(),
  });

  FormControl<String> get username =>
      form.control('username') as FormControl<String>;

  FormControl<String> get password =>
      form.control('password') as FormControl<String>;

  FormControl<bool> get remember =>
      form.control('remember') as FormControl<bool>;

  FormControl<String> get server =>
      form.control('server') as FormControl<String>;

  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    Prefs.getBool(AppConstants.kRemember).then((onValue) {
      remember.value = onValue;
      if(onValue==true){
        Prefs.getString(AppConstants.kUsername).then((val){
          username.value=val;
        });
        Prefs.getString(AppConstants.kPassword).then((val){
          password.value=val;
        });
      }
    });
    Prefs.getString(AppConstants.kServer).then((onValue){
      server.value=onValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainColor,
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.hasError) {
              toastification.show(
                  title: Text(
                    state.errorMessage,
                    style: const TextStyle(fontSize: 16),
                  ),
                  type: ToastificationType.error,
                  alignment: Alignment.bottomCenter,
                  showProgressBar: false,
                  style: ToastificationStyle.fillColored,
                  autoCloseDuration: 4.seconds,
                  primaryColor: Colors.red);
            }
            if (state.isLoginVerified) {
              //debugPrint(jsonEncode(state.loginModel?.userData));
              if (state.loginModel?.userData?.role == Roles.student.val) {
                context.goNamed(AppRoutes.mainStudent.name);
              } else if(state.loginModel?.userData?.role == Roles.teacher.val) {
                context.goNamed(AppRoutes.mainTeacher.name);
              } else{
                toastification.show(
                    title: Text(
                      S.of(context).anotherRole,
                      style: const TextStyle(fontSize: 16),
                    ),
                    type: ToastificationType.error,
                    alignment: Alignment.bottomCenter,
                    showProgressBar: false,
                    style: ToastificationStyle.fillColored,
                    autoCloseDuration: 4.seconds,
                    primaryColor: Colors.red);
              }
            }
          },
          builder: (context, state) {
            return ReactiveForm(
              formGroup: form,
              child: Stack(alignment: Alignment.center, children: [
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.2,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/img_logo.png',
                          height: 65,
                          fit: BoxFit.cover,
                        ),
                        const Text(
                          'LUMOS MIND',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 32,
                              color: Colors.white),
                        )
                      ],
                    )),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, bottom: 32, top: 24),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(33),
                            topLeft: Radius.circular(33))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            textAlign: TextAlign.center,
                            S.of(context).login,
                            style: CustomTextStyle.h24SB),
                        const Gap(18),
                        ReactiveDropdownField(
                          formControl: server,
                          decoration: InputDecoration(
                            fillColor: AppColors.bgColor,
                            labelText: S.of(context).filialniTanlang,
                            border: appTextFiledBorder(),
                            enabledBorder: appTextFiledBorder(),
                            disabledBorder: appTextFiledBorder(),
                            focusedBorder: appTextFiledBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                          ),
                          items: [
                            DropdownMenuItem(
                              value: AppConstants.baseUrlSchool,
                              child: Text(
                                S.of(context).server_school,
                                style: CustomTextStyle.h14R,
                              ),
                            ),
                            DropdownMenuItem(
                              value: AppConstants.baseUrlSchool2,
                              child: Text(
                                S.of(context).server_school2,
                                style: CustomTextStyle.h14R,
                              ),
                            ),
                          ],
                          onChanged: (val){
                            Prefs.setString(AppConstants.kServer, val.value??'');
                            final dio = GetIt.instance<Dio>();
                            dio.options.baseUrl = val.value??'';
                          },
                          validationMessages: {
                            'required': (error) =>
                                S.of(context).thefieldmustnotbeempty,
                          },
                        ),
                        const Gap(18),
                        ReactiveTextField(
                          formControl: username,
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.grey),
                            labelText: S.of(context).username,
                            counterText: '',
                            border: appTextFiledBorder(),
                            enabledBorder: appTextFiledBorder(),
                            disabledBorder: appTextFiledBorder(),
                            focusedBorder: appTextFiledBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                          ),
                          keyboardType: TextInputType.text,
                          validationMessages: {
                            'required': (error) =>
                                S.of(context).thefieldmustnotbeempty,
                          },
                        ),
                        const Gap(18),
                        ReactiveTextField(
                          formControl: password,
                          decoration: InputDecoration(
                            labelText: S.of(context).password,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                            border: appTextFiledBorder(),
                            enabledBorder: appTextFiledBorder(),
                            disabledBorder: appTextFiledBorder(),
                            focusedBorder: appTextFiledBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _obscurePassword,
                          validationMessages: {
                            'required': (error) =>
                                S.of(context).thefieldmustnotbeempty,
                            'minLength': (error) => S
                                .of(context)
                                .thePasswordMustHaveAtLeast8Characters,
                          },
                        ),
                        ReactiveCheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: const EdgeInsets.all(0),
                          formControl: remember,
                          activeColor: AppColors.mainColor,
                          title: Text(
                            S.of(context).rememberMe,
                            style: CustomTextStyle.h14M,
                          ),
                          onChanged: (val){
                            Prefs.setBool(AppConstants.kRemember, val.value??false);
                          },
                        ),
                        const Gap(18),
                        state.isLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.mainColor,
                                ),
                              )
                            : ReactiveFormConsumer(
                                builder: (context, form, child) {
                                return AppElevatedButton(
                                    text: S.of(context).login,
                                    onClick: () {
                                      //context.goNamed(AppRoutes.main.name);
                                      debugPrint(jsonEncode(form.value));
                                      if (form.valid) {
                                        if (remember.value == true) {
                                          Prefs.setString(AppConstants.kUsername, username.value ?? '');
                                          Prefs.setString(AppConstants.kPassword, password.value ?? '');
                                        } else {
                                          Prefs.setString(AppConstants.kUsername, '');
                                          Prefs.setString(AppConstants.kPassword, '');
                                        }
                                        bloc.login(LoginBody(
                                            phone: username.value
                                                ?.replaceAll(' ', '')
                                                .replaceFirst('+', ''),
                                            password: password.value));
                                      } else {
                                        form.markAllAsTouched();
                                      }
                                    });
                              }),
                      ],
                    ),
                  ),
                )
              ]),
            );
          },
        ));
  }
}
