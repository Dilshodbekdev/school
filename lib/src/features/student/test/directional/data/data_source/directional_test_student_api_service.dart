import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:school/src/features/student/test/directional/data/models/get_directional_test_student_model.dart';
import 'package:school/src/features/student/test/iq/data/models/new_iq_tests_student_model.dart';
import 'package:school/src/features/student/test/simple/data/bodies/answer_body.dart';
import 'package:school/src/features/student/test/simple/data/bodies/create_simple_test_student_body.dart';
import 'package:school/src/features/student/test/simple/data/models/answer_simple_test_student_model.dart';
import 'package:school/src/features/student/test/simple/data/models/get_complete_simple_test_student_model.dart';
import 'package:school/src/features/student/test/simple/data/models/get_simple_test_student_model.dart';
import 'package:school/src/features/student/test/simple/data/models/started_simple_tests_student_model.dart';

part 'directional_test_student_api_service.g.dart';

@RestApi()
abstract class DirectionalTestStudentApiService {
  factory DirectionalTestStudentApiService(Dio dio, {String baseUrl}) =
      _DirectionalTestStudentApiService;

  /// URLS
  static const String _tests = 'api/test/directional-test-enrollment';
  static const String _getTest = 'api/test/directional-test-enrollment/{id}';
  static const String _answerTest = 'api/test/directional-test-answer/{questionId}';
  static const String _submitTest = 'api/test/directional-test-enrollment/{id}/submit';

  /// REQUESTS
  @GET(_tests)
  Future<HttpResponse<NewIqTestsStudentModel>> newTests(
    @Query('page') int page,
    @Query('pageSize') int pageSize,
  );

  @GET(_tests)
  Future<HttpResponse<StartedSimpleTestsStudentModel>> startedTests(
    @Query('page') int page,
    @Query('pageSize') int pageSize,
    @Query('state') int state,
  );

  @GET(_tests)
  Future<HttpResponse<StartedSimpleTestsStudentModel>> completedTests(
    @Query('page') int page,
    @Query('pageSize') int pageSize,
    @Query('state') int state,
  );

  @POST(_tests)
  Future<HttpResponse<GetSimpleTestStudentModel>> createTest(
    @Body() CreateSimpleTestStudentBody body,
  );

  @GET(_getTest)
  Future<HttpResponse<GetDirectionalTestStudentModel>> getTest(
    @Path('id') int id,
  );

  @GET(_getTest)
  Future<HttpResponse<GetCompleteSimpleTestStudentModel>> getCompleteTest(
    @Path('id') int id,
  );

  @PUT(_answerTest)
  Future<HttpResponse<AnswerSimpleTestStudentModel>> answerTest(
    @Path('questionId') int questionId,
    @Body() AnswerBody body,
  );

  @POST(_submitTest)
  Future<HttpResponse<dynamic>> submitTest(
    @Path('id') int id,
  );
}
