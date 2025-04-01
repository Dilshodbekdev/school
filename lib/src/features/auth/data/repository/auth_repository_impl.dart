import 'package:school/src/core/resources/base_repository.dart';
import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/features/auth/data/bodies/change_hobby_body.dart';
import 'package:school/src/features/auth/data/bodies/change_password_body.dart';
import 'package:school/src/features/auth/data/bodies/login_body.dart';
import 'package:school/src/features/auth/data/data_source/auth_api_service.dart';
import 'package:school/src/features/auth/data/models/hobby_model.dart';
import 'package:school/src/features/auth/data/models/login_model.dart';
import 'package:school/src/features/auth/data/models/teacher_model.dart';
import 'package:school/src/features/auth/data/models/user_model.dart';
import 'package:school/src/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl with BaseRepository implements AuthRepository {
  final AuthApiService _apiService;

  AuthRepositoryImpl(this._apiService);

  @override
  Future<DataState<LoginModel>> login(LoginBody body) async =>
      await handleResponse(response: _apiService.login(body));

  @override
  Future<DataState<UserModel>> me() async =>
      await handleResponse(response: _apiService.me());

  @override
  Future<DataState<List<HobbyModel>>> hobbies() async =>
      await handleResponse(response: _apiService.hobbies());

  @override
  Future<DataState<dynamic>> changeHobby(ChangeHobbyBody body) async =>
      await handleResponse(response: _apiService.changeHobby(body));

  @override
  Future<DataState> changePassword(ChangePasswordBody body) async =>
      await handleResponse(
          response: _apiService.changePassword(body, body.id ?? 0));

  @override
  Future<DataState<TeacherModel>> meTeacher() async =>
      await handleResponse(response: _apiService.meTeacher());
}
