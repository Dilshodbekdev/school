part of 'auth_bloc.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final LoginBody body;

  LoginEvent({required this.body});
}

class MeEvent extends AuthEvent {
  MeEvent();
}

class ChangeHobbyEvent extends AuthEvent {
  final ChangeHobbyBody body;

  ChangeHobbyEvent({required this.body});
}

class ChangePasswordEvent extends AuthEvent {
  final ChangePasswordBody body;

  ChangePasswordEvent({required this.body});
}

class HobbiesEvent extends AuthEvent {
  HobbiesEvent();
}

class TeacherMeEvent extends AuthEvent {
  TeacherMeEvent();
}
