import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/components/app_container.dart';
import 'package:school/src/config/components/app_divider.dart';
import 'package:school/src/config/components/app_elevated_button.dart';
import 'package:school/src/config/components/text_field_components.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/config/theme/text_styles.dart';
import 'package:school/src/core/app_state/cubit/app_cubit.dart';
import 'package:school/src/core/app_state/localization.dart';
import 'package:school/src/core/router/app_routes.dart';
import 'package:school/src/core/services/services.dart';
import 'package:school/src/core/util/app_constants.dart';
import 'package:school/src/features/auth/data/bodies/change_password_body.dart';
import 'package:school/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:school/src/features/student/main/widgets/profile_text_widget.dart';

class ProfileTeacherPage extends StatefulWidget {
  const ProfileTeacherPage({super.key});

  @override
  State<ProfileTeacherPage> createState() => _ProfileTeacherPageState();
}

class _ProfileTeacherPageState extends State<ProfileTeacherPage> {
  late final bloc = context.read<AuthBloc>();
  late final cubit = context.read<AppCubit>();

  final formPassword = FormGroup({
    'temp_password': FormControl<String>(
      validators: [Validators.required],
    ),
    'password': FormControl<String>(
      validators: [Validators.required, Validators.minLength(8)],
    ),
  });
  FormControl<String> get password => formPassword.control('password') as FormControl<String>;
  FormControl<String> get tempPassword => formPassword.control('temp_password') as FormControl<String>;

  @override
  void initState() {
    super.initState();
    bloc.teacherMe();
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).profile),
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
                        Text(S.of(context).exitAccountText,style: CustomTextStyle.h18SB,),
                        const Gap(20),
                        Row(
                          children: [
                            Expanded(
                                child: AppElevatedButton(
                                  text: S.of(context).yoq,
                                  onClick: () {
                                    context.pop();
                                  },
                                  bgColor: Colors.red,
                                )),
                            const Gap(16),
                            Expanded(
                                child: AppElevatedButton(
                                  text: S.of(context).ha,
                                  onClick: () {
                                    Prefs.setString(AppConstants.kAccessToken, '');
                                    Prefs.setString(AppConstants.kRefreshToken, '');
                                    context.pop();
                                    context.goNamed(AppRoutes.login.name);
                                  },
                                  bgColor: Colors.green,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }, icon: const Icon(Icons.exit_to_app))
        ],
      ),
      backgroundColor: AppColors.bgColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state){
          if(state.isMeVerified){
            if(state.teacherModelMe?.tempPassword!=null){
              showModalBottomSheet<void>(
                context: context,
                backgroundColor: Colors.white,
                builder: (BuildContext context) {
                  return ReactiveForm(
                    formGroup: formPassword,
                    child: SizedBox(
                      height: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            S.of(context).changePassword,
                            style: CustomTextStyle.h16SB,
                          ),
                          Gap(20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: ReactiveTextField(
                              formControl: tempPassword,
                              decoration: InputDecoration(
                                fillColor: AppColors.bgColor,
                                filled: true,
                                isDense: true,
                                labelText: S.of(context).oldPassword,
                                border: appTextFiledBorder(),
                                enabledBorder: appTextFiledBorder(),
                                disabledBorder: appTextFiledBorder(),
                                focusedBorder: appTextFiledBorder(),
                                errorBorder: appTextFiledErrorBorder(),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              validationMessages: {
                                'required': (error) =>
                                S.of(context).thefieldmustnotbeempty,
                              },
                            ),
                          ),
                          Gap(16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: ReactiveTextField(
                              formControl: password,
                              decoration: InputDecoration(
                                fillColor: AppColors.bgColor,
                                filled: true,
                                isDense: true,
                                labelText: S.of(context).newPassword,
                                border: appTextFiledBorder(),
                                enabledBorder: appTextFiledBorder(),
                                disabledBorder: appTextFiledBorder(),
                                focusedBorder: appTextFiledBorder(),
                                errorBorder: appTextFiledErrorBorder(),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              validationMessages: {
                                'required': (error) =>
                                S.of(context).thefieldmustnotbeempty,
                                'minLength': (error) => S
                                    .of(context)
                                    .thePasswordMustHaveAtLeast8Characters,
                              },
                            ),
                          ),
                          const Gap(20),
                          ReactiveFormConsumer(builder: (context, form, child){
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: AppElevatedButton(text: S.of(context).save, onClick: (){
                                if (form.valid) {
                                  bloc.changePassword(ChangePasswordBody(
                                      tempPassword: tempPassword.value,
                                      password: password.value,
                                      id: state.me?.id
                                  ));
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
            }
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                AppContainer(
                  radius: 24,
                  padding: const EdgeInsets.all(16),
                  margin: EdgeInsets.zero,
                  child: Row(
                    children: [
                      FutureBuilder(
                        future: Prefs.getString(AppConstants.kServer),
                        builder: (context, snap){
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: CachedNetworkImage(
                              height: 100,
                              width: 100,
                              imageUrl: "${snap.data}${state.teacherModelMe?.photo?.file}",
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Center(
                                  child: CircularProgressIndicator(
                                    value: downloadProgress.progress,
                                    color: AppColors.mainColor,
                                  )),
                              errorWidget: (context, url, error) => const Center(
                                  child: Icon(
                                    Icons.error,
                                    color: AppColors.mainRedColor,
                                  )),
                            ),
                          );
                        },
                      ),
                      const Gap(16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${state.teacherModelMe?.lastName} ${state.teacherModelMe?.firstName} ${state.teacherModelMe?.midName}",
                              style: const TextStyle(
                                color: AppColors.mainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            const Gap(4),
                            Text(
                              state.teacherModelMe?.subjectNames?.map((e)=>e).toList().join(', ')??'-',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Gap(4),
                            Text(
                              "ID: ${state.teacherModelMe?.id}",
                              style: const TextStyle(
                                color: AppColors.secondaryTextColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Gap(12),
                BlocBuilder<AppCubit, AppState>(
                  builder: (context, appState) {
                    return AppContainer(
                      radius: 24,
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      child: ExpansionTile(
                        shape: const Border(),
                        leading: const Icon(Icons.language),
                        title: Text(
                          S.of(context).tilniOzgartirish,
                          style: CustomTextStyle.h16R,
                        ),
                        iconColor: Theme.of(context).colorScheme.tertiary,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: AppDivider(),
                          ),
                          ListTile(
                            onTap: () {
                              cubit.changeLocale(Localization.uz, 'uz');
                            },
                            leading: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: SvgPicture.asset('assets/icons/uz.svg',height: 30,)),
                            title: const Text(
                              "O'zbek",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: Checkbox(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                value: appState.lang=='uz',
                                onChanged: (v){
                                  cubit.changeLocale(Localization.uz, 'uz');
                                },
                              activeColor: AppColors.mainColor,),
                          ).animate().move().fade().slideY(duration: 200.ms),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: AppDivider(),
                          ),
                          ListTile(
                            onTap: () {
                              cubit.changeLocale(Localization.ru, 'ru');
                            },
                            leading: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: SvgPicture.asset('assets/icons/ru.svg',height: 30,)),
                            title: const Text(
                              "Русский",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: Checkbox(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                value: appState.lang=='ru',
                                onChanged: (v){
                                  cubit.changeLocale(Localization.ru, 'ru');
                                },
                              activeColor: AppColors.mainColor,),
                          ).animate().move().fade().slideY(duration: 250.ms)
                        ],
                      ),
                    );
                  },
                ),
                const Gap(12),
                AppContainer(
                  radius: 24,
                  padding: const EdgeInsets.all(16),
                  margin: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).main_info,
                        style: CustomTextStyle.h16SB,
                      ),
                      const Gap(16),
                      ProfileTextWidget(
                          text1: S.of(context).yearOfBirth,
                          text2: state.teacherModelMe?.birthDate ?? '-'),
                      ProfileTextWidget(
                          text1: S.of(context).gender,
                          text2: state.teacherModelMe?.gender ?? '-'),
                      ProfileTextWidget(
                          text1: S.of(context).livingPlace,
                          text2: state.teacherModelMe?.livingPlace?.label ?? '-'),
                      ProfileTextWidget(
                          text1: S.of(context).district,
                          text2: state.teacherModelMe?.district?.label ?? '-'),
                      ProfileTextWidget(
                          text1: S.of(context).address,
                          text2: state.teacherModelMe?.address ?? '-'),
                      ProfileTextWidget(
                          text1: S.of(context).phone,
                          text2: state.teacherModelMe?.phone ?? '-'),
                      ProfileTextWidget(
                          text1: S.of(context).email,
                          text2: state.teacherModelMe?.email ?? '-'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
