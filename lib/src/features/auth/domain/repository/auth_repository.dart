import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/features/auth/data/bodies/change_hobby_body.dart';
import 'package:school/src/features/auth/data/bodies/change_password_body.dart';
import 'package:school/src/features/auth/data/bodies/login_body.dart';
import 'package:school/src/features/auth/data/models/hobby_model.dart';
import 'package:school/src/features/auth/data/models/login_model.dart';
import 'package:school/src/features/auth/data/models/teacher_model.dart';
import 'package:school/src/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<DataState<LoginModel>> login(LoginBody body);

  Future<DataState<UserModel>> me();

  Future<DataState<dynamic>> changeHobby(ChangeHobbyBody body);

  Future<DataState<dynamic>> changePassword(ChangePasswordBody body);

  Future<DataState<List<HobbyModel>>> hobbies();

  Future<DataState<TeacherModel>> meTeacher();
}
