import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:school/src/features/auth/data/bodies/change_hobby_body.dart';
import 'package:school/src/features/auth/data/bodies/change_password_body.dart';
import 'package:school/src/features/auth/data/bodies/login_body.dart';
import 'package:school/src/features/auth/data/models/hobby_model.dart';
import 'package:school/src/features/auth/data/models/login_model.dart';
import 'package:school/src/features/auth/data/models/teacher_model.dart';
import 'package:school/src/features/auth/data/models/user_model.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  /// URLS
  static const String _login = 'api/token';
  static const String _me = 'api/account/whoami';
  static const String _hobbies = 'api/common/hobby/select';
  static const String _changeHobby = 'api/account/student/update-hobby';
  static const String _changePassword = 'api/account/update/pass/{id}';

  /// REQUESTS
  @POST(_login)
  Future<HttpResponse<LoginModel>> login(@Body() LoginBody body);

  @GET(_me)
  Future<HttpResponse<UserModel>> me();

  @GET(_hobbies)
  Future<HttpResponse<List<HobbyModel>>> hobbies();

  @POST(_changeHobby)
  Future<HttpResponse<dynamic>> changeHobby(@Body() ChangeHobbyBody body);

  @PATCH(_changePassword)
  Future<HttpResponse<dynamic>> changePassword(
    @Body() ChangePasswordBody body,
    @Path('id') int id,
  );

  @GET(_me)
  Future<HttpResponse<TeacherModel>> meTeacher();
}
