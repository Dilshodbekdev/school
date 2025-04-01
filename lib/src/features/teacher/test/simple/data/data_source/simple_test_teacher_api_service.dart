import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:school/src/features/teacher/test/simple/data/bodies/create_simple_test_body.dart';
import 'package:school/src/features/teacher/test/simple/data/models/active_simple_tests_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/class_select_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/create_simple_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/get_simple_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/get_students_simple_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/student_results_simple_test_teacher_model.dart';

part 'simple_test_teacher_api_service.g.dart';

@RestApi()
abstract class SimpleTestTeacherApiService {
  factory SimpleTestTeacherApiService(Dio dio, {String baseUrl}) =
      _SimpleTestTeacherApiService;

  /// URLS
  static const String _activeSimpleTests = 'api/test/simple-test?status=1';
  static const String _createSimpleTest = 'api/test/simple-test';
  static const String _completedSimpleTests = 'api/test/simple-test?status=2';
  static const String _templateSimpleTests = 'api/test/simple-test?status=3';
  static const String _getSimpleTest = 'api/test/simple-test/{id}';
  static const String _classesSelect = 'api/classes/cls/select';
  static const String _getStudentsSimpleTest = 'api/test/simple-test/{id}/students';
  static const String _studentResultsSimpleTest = 'api/test/simple-test/{id}/student-results';

  /// REQUESTS
  @POST(_createSimpleTest)
  Future<HttpResponse<CreateSimpleTestTeacherModel>> createSimpleTest(
    @Body() CreateSimpleTestBody body,
  );

  @GET(_activeSimpleTests)
  Future<HttpResponse<ActiveSimpleTestsTeacherModel>> activeSimpleTests(
    @Query('page') int page,
    @Query('pageSize') int pageSize,
  );

  @GET(_completedSimpleTests)
  Future<HttpResponse<ActiveSimpleTestsTeacherModel>> completedSimpleTests(
    @Query('page') int page,
    @Query('pageSize') int pageSize,
  );

  @GET(_templateSimpleTests)
  Future<HttpResponse<ActiveSimpleTestsTeacherModel>> templateSimpleTests(
    @Query('page') int page,
    @Query('pageSize') int pageSize,
  );

  @GET(_getSimpleTest)
  Future<HttpResponse<GetSimpleTestTeacherModel>> getSimpleTest(
    @Path('id') int id,
  );

  @DELETE(_getSimpleTest)
  Future<HttpResponse<dynamic>> deleteSimpleTest(
    @Path('id') int id,
  );

  @PUT(_getSimpleTest)
  Future<HttpResponse<CreateSimpleTestTeacherModel>> updateSimpleTest(
    @Path('id') int id,
    @Body() CreateSimpleTestBody body,
  );

  @GET(_getStudentsSimpleTest)
  Future<HttpResponse<List<GetStudentsSimpleTestTeacherModel>>>
      getStudentsSimpleTest(
    @Path('id') int id,
    @Query('class_id') int classId,
  );

  @GET(_classesSelect)
  Future<HttpResponse<List<ClassSelectTeacherModel>>> classesSelect();

  @GET(_studentResultsSimpleTest)
  Future<HttpResponse<StudentResultsSimpleTestTeacherModel>>
      studentResultsSimpleTest(
    @Path('id') int id,
    @Query('enroll_id') int enrollId,
  );
}
