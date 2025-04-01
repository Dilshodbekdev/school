part of 'app_cubit.dart';

class AppState {
  final Locale locale;
  final bool isDark;
  final String lang;
  final int selectedIndex;
  final bool isBottomNavVisible;

  AppState({
    required this.locale,
    required this.isDark,
    required this.lang,
    required this.selectedIndex,
    required this.isBottomNavVisible,
  });

  AppState copyWith({
    Locale? locale,
    bool? isDark,
    String? lang,
    int? selectedIndex,
    bool? isBottomNavVisible,
  }) {
    return AppState(
      locale: locale ?? this.locale,
      isDark: isDark ?? this.isDark,
      lang: lang ?? this.lang,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isBottomNavVisible: isBottomNavVisible ?? this.isBottomNavVisible,
    );
  }
}
