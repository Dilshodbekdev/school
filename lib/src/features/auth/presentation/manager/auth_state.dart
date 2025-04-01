part of 'auth_bloc.dart';

class AuthState {
  final LoginModel? loginModel;
  final UserModel? me;
  final List<HobbyModel>? hobbies;
  final TeacherModel? teacherModelMe;
  final bool isLoginVerified;
  final bool isPasswordChanged;
  final bool isMeVerified;
  final bool isChangeHobby;
  final bool isCheckSmsVerified;
  final bool isLoading;
  final bool hasError;
  final String errorMessage;

  AuthState({
    this.loginModel,
    this.me,
    this.hobbies,
    this.teacherModelMe,
    this.isLoginVerified = false,
    this.isPasswordChanged = false,
    this.isMeVerified = false,
    this.isChangeHobby = false,
    this.isCheckSmsVerified = false,
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  AuthState copyWith({
    LoginModel? loginModel,
    UserModel? me,
    List<HobbyModel>? hobbies,
    TeacherModel? teacherModelMe,
    bool? isLoading,
    bool? isLoginVerified,
    bool? isPasswordChanged,
    bool? isMeVerified,
    bool? isChangeHobby,
    bool? isCheckSmsVerified,
    bool? hasError,
    String? errorMessage,
  }) =>
      AuthState(
        loginModel: loginModel ?? this.loginModel,
        me: me ?? this.me,
        hobbies: hobbies ?? this.hobbies,
        teacherModelMe: teacherModelMe ?? this.teacherModelMe,
        isLoginVerified: isLoginVerified ?? false,
        isPasswordChanged: isPasswordChanged ?? false,
        isMeVerified: isMeVerified ?? false,
        isChangeHobby: isChangeHobby ?? false,
        isCheckSmsVerified: isCheckSmsVerified ?? false,
        isLoading: isLoading ?? false,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
