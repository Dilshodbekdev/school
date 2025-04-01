import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:school/src/features/teacher/test/iq/data/bodies/create_iq_test_body.dart';
import 'package:school/src/features/teacher/test/iq/data/models/active_iq_tests_teacher_model.dart';
import 'package:school/src/features/teacher/test/iq/data/models/get_iq_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/score/data/bodies/create_score_test_teacher_body.dart';
import 'package:school/src/features/teacher/test/score/data/models/get_score_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/bodies/create_simple_test_body.dart';
import 'package:school/src/features/teacher/test/simple/data/models/class_select_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/create_simple_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/get_students_simple_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/student_results_simple_test_teacher_model.dart';

part 'score_test_teacher_api_service.g.dart';

@RestApi()
abstract class ScoreTestTeacherApiService {
  factory ScoreTestTeacherApiService(Dio dio, {String baseUrl}) =
      _ScoreTestTeacherApiService;

  /// URLS
  static const String _activeIqTests = 'api/test/score-test?status=1';
  static const String _createIqTest = 'api/test/score-test';
  static const String _completedIqTests = 'api/test/score-test?status=2';
  static const String _templateIqTests = 'api/test/score-test?status=3';
  static const String _getIqTest = 'api/test/score-test/{id}';
  static const String _classesSelect = 'api/classes/cls/select';
  static const String _getStudentsIqTest = 'api/test/score-test/{id}/students';
  static const String _studentResultsIqTest = 'api/test/score-test/{id}/student-results';

  /// REQUESTS
  @POST(_createIqTest)
  Future<HttpResponse<dynamic>> createTest(
    @Body() CreateScoreTestTeacherBody body,
  );

  @GET(_activeIqTests)
  Future<HttpResponse<ActiveIqTestsTeacherModel>> activeTests(
    @Query('page') int page,
    @Query('pageSize') int pageSize,
  );

  @GET(_completedIqTests)
  Future<HttpResponse<ActiveIqTestsTeacherModel>> completedTests(
    @Query('page') int page,
    @Query('pageSize') int pageSize,
  );

  @GET(_templateIqTests)
  Future<HttpResponse<ActiveIqTestsTeacherModel>> templateTests(
    @Query('page') int page,
    @Query('pageSize') int pageSize,
  );

  @GET(_getIqTest)
  Future<HttpResponse<GetScoreTestTeacherModel>> getTest(
    @Path('id') int id,
  );

  @DELETE(_getIqTest)
  Future<HttpResponse<dynamic>> deleteTest(
    @Path('id') int id,
  );

  @PUT(_getIqTest)
  Future<HttpResponse<dynamic>> updateTest(
    @Path('id') int id,
    @Body() CreateScoreTestTeacherBody body,
  );

  @GET(_getStudentsIqTest)
  Future<HttpResponse<List<GetStudentsSimpleTestTeacherModel>>>
      getStudentsSimpleTest(
    @Path('id') int id,
    @Query('class_id') int classId,
  );

  @GET(_classesSelect)
  Future<HttpResponse<List<ClassSelectTeacherModel>>> classesSelect();

  @GET(_studentResultsIqTest)
  Future<HttpResponse<StudentResultsSimpleTestTeacherModel>>
      studentResultsSimpleTest(
    @Path('id') int id,
    @Query('enroll_id') int enrollId,
  );
}
