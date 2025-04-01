import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/src/core/app_state/localization.dart';
import 'package:school/src/core/services/services.dart';
import 'package:school/src/core/util/app_constants.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(AppState(
          locale: Localization.uz,
          isDark: false,
          lang: 'uz',
          selectedIndex: 0,
          isBottomNavVisible: true,
        ));

  changeLocale(Locale locale, String lang) {
    emit(state.copyWith(
      locale: locale,
      lang: lang,
    ));
    Prefs.setString(AppConstants.kLanguage, lang);
  }

  init() async {
    var lang = await Prefs.getString(AppConstants.kLanguage) ?? 'uz';
    var localization =
        Localization.all.firstWhere((element) => element.languageCode == lang);
    emit(state.copyWith(locale: localization, lang: lang));
  }

  void selectTab(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  // Method to show the BottomNavigationBar
  void showBottomNavBar() {
    emit(state.copyWith(isBottomNavVisible: true));
  }

  // Method to hide the BottomNavigationBar
  void hideBottomNavBar() {
    emit(state.copyWith(isBottomNavVisible: false));
  }

  // Toggle visibility
  void toggleBottomNavBar() {
    emit(state.copyWith(isBottomNavVisible: !state.isBottomNavVisible));
  }
}
