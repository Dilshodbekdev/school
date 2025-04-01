import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/components/app_elevated_button.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/config/theme/text_styles.dart';
import 'package:school/src/core/app_state/cubit/app_cubit.dart';
import 'package:school/src/core/app_state/localization.dart';
import 'package:school/src/core/router/app_routes.dart';
import 'package:school/src/core/services/services.dart';
import 'package:school/src/core/util/app_constants.dart';
import 'package:school/src/features/auth/presentation/widgets/language_button.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  late final cubit = context.read<AppCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: AppColors.mainColor,
            body: Stack(alignment: Alignment.center, children: [
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
                          topRight: Radius.circular(36),
                          topLeft: Radius.circular(36))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          textAlign: TextAlign.center,
                          S.of(context).language,
                          style: CustomTextStyle.h24SB),
                      const Gap(18),
                      LanguageButton(
                        icon: 'assets/icons/uz.svg',
                        title: "O’zbekcha",
                        isCheck: state.lang == 'uz',
                        onClick: () {
                          cubit.changeLocale(Localization.uz, 'uz');
                          Prefs.setString(AppConstants.kLanguage, 'uz');
                        },
                      ),
                      const Gap(16),
                      LanguageButton(
                        icon: 'assets/icons/sh.svg',
                        title: "English",
                        isCheck: state.lang == 'en',
                        onClick: () {
                          cubit.changeLocale(Localization.en, 'en');
                          Prefs.setString(AppConstants.kLanguage, 'en');
                        },
                      ),
                      const Gap(16),
                      LanguageButton(
                        icon: 'assets/icons/ru.svg',
                        title: "Русский",
                        isCheck: state.lang == 'ru',
                        onClick: () {
                          cubit.changeLocale(Localization.ru, 'ru');
                          Prefs.setString(AppConstants.kLanguage, 'ru');
                        },
                      ),
                      const Gap(18),
                      AppElevatedButton(
                          text: S.of(context).next,
                          onClick: () {
                            context.goNamed(AppRoutes.login.name);
                          })
                    ],
                  ),
                ),
              )
            ]));
      },
    );
  }
}
