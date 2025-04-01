import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/services/services.dart';
import 'package:school/src/core/util/app_constants.dart';
import 'package:school/src/features/auth/data/bodies/change_hobby_body.dart';
import 'package:school/src/features/auth/data/bodies/change_password_body.dart';
import 'package:school/src/features/auth/data/bodies/login_body.dart';
import 'package:school/src/features/auth/data/models/hobby_model.dart';
import 'package:school/src/features/auth/data/models/login_model.dart';
import 'package:school/src/features/auth/data/models/teacher_model.dart';
import 'package:school/src/features/auth/data/models/user_model.dart';
import 'package:school/src/features/auth/domain/use_case/change_hobby_use_case.dart';
import 'package:school/src/features/auth/domain/use_case/change_password_use_case.dart';
import 'package:school/src/features/auth/domain/use_case/hobbies_use_case.dart';
import 'package:school/src/features/auth/domain/use_case/login_use_case.dart';
import 'package:school/src/features/auth/domain/use_case/me_use_case.dart';
import 'package:school/src/features/auth/domain/use_case/teacher_me_use_case.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final MeUseCase _meUseCase;
  final HobbiesUseCase _hobbiesUseCase;
  final ChangeHobbyUseCase _changeHobbyUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;
  final TeacherMeUseCase _teacherMeUseCase;

  AuthBloc(
    this._loginUseCase,
    this._meUseCase,
    this._teacherMeUseCase,
    this._hobbiesUseCase,
    this._changeHobbyUseCase, this._changePasswordUseCase,
  ) : super(AuthState()) {
    on<LoginEvent>((event, emit) async {
      await emit.onEach(_onLogin(event), onData: emit.call);
    });
    on<MeEvent>((event, emit) async {
      await emit.onEach(_onMe(event), onData: emit.call);
    });
    on<HobbiesEvent>((event, emit) async {
      await emit.onEach(_onHobbies(event), onData: emit.call);
    });
    on<ChangeHobbyEvent>((event, emit) async {
      await emit.onEach(_onChangeHobby(event), onData: emit.call);
    });
    on<ChangePasswordEvent>((event, emit) async {
      await emit.onEach(_onChangePassword(event), onData: emit.call);
    });
    on<TeacherMeEvent>((event, emit) async {
      await emit.onEach(_onTeacherMe(event), onData: emit.call);
    });
  }

  login(LoginBody body) {
    add(LoginEvent(body: body));
  }

  me() {
    add(MeEvent());
  }

  hobbies() {
    add(HobbiesEvent());
  }

  changeHobby(ChangeHobbyBody body) {
    add(ChangeHobbyEvent(body: body));
  }

  changePassword(ChangePasswordBody body) {
    add(ChangePasswordEvent(body: body));
  }

  teacherMe() {
    add(TeacherMeEvent());
  }

  Stream<AuthState> _onLogin(LoginEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _loginUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(loginModel: dataState.data, isLoginVerified: true);
      Prefs.setString(AppConstants.kRole, dataState.data?.userData?.role ?? '');
      Prefs.setInt(
          AppConstants.kClassRef, dataState.data?.userData?.grade?.value ?? 0);
      Prefs.setString(AppConstants.kAccessToken, dataState.data?.access ?? '');
      Prefs.setString(
          AppConstants.kRefreshToken, dataState.data?.refresh ?? '');
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<AuthState> _onMe(MeEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _meUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(me: dataState.data, isMeVerified: true);
      Prefs.setString(AppConstants.kRole, dataState.data?.role ?? '');
      Prefs.setInt(AppConstants.kClassRef, dataState.data?.grade?.value ?? 0);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<AuthState> _onChangeHobby(ChangeHobbyEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _changeHobbyUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(isChangeHobby: true);
      Prefs.setString(AppConstants.kRole, dataState.data?.role ?? '');
      Prefs.setInt(AppConstants.kClassRef, dataState.data?.grade?.value ?? 0);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<AuthState> _onChangePassword(ChangePasswordEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _changePasswordUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(isPasswordChanged: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<AuthState> _onHobbies(HobbiesEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _hobbiesUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(hobbies: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<AuthState> _onTeacherMe(TeacherMeEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _teacherMeUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(teacherModelMe: dataState.data,isMeVerified: true);
      Prefs.setString(AppConstants.kRole, dataState.data?.role ?? '');
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }
}
