import 'package:school/src/core/resources/base_repository.dart';
import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/features/student/home/data/bodies/paging_body.dart';
import 'package:school/src/features/student/test/directional/data/data_source/directional_test_student_api_service.dart';
import 'package:school/src/features/student/test/directional/data/models/get_directional_test_student_model.dart';
import 'package:school/src/features/student/test/directional/domain/repository/directional_test_student_repository.dart';
import 'package:school/src/features/student/test/iq/data/models/new_iq_tests_student_model.dart';
import 'package:school/src/features/student/test/simple/data/bodies/answer_body.dart';
import 'package:school/src/features/student/test/simple/data/bodies/create_simple_test_student_body.dart';
import 'package:school/src/features/student/test/simple/data/models/answer_simple_test_student_model.dart';
import 'package:school/src/features/student/test/simple/data/models/get_complete_simple_test_student_model.dart';
import 'package:school/src/features/student/test/simple/data/models/get_simple_test_student_model.dart';
import 'package:school/src/features/student/test/simple/data/models/started_simple_tests_student_model.dart';

class DirectionalTestStudentRepositoryImpl
    with BaseRepository
    implements DirectionalTestStudentRepository {
  final DirectionalTestStudentApiService _apiService;

  DirectionalTestStudentRepositoryImpl(this._apiService);

  @override
  Future<DataState<StartedSimpleTestsStudentModel>> completedTests(
          PagingBody body) async =>
      await handleResponse(
          response: _apiService.completedTests(
        body.page ?? 0,
        body.pageSize ?? 10,
        2,
      ));

  @override
  Future<DataState<NewIqTestsStudentModel>> newTests(
          PagingBody body) async =>
      await handleResponse(
          response: _apiService.newTests(
        body.page ?? 0,
        body.pageSize ?? 10,
      ));

  @override
  Future<DataState<StartedSimpleTestsStudentModel>> startedTests(
          PagingBody body) async =>
      await handleResponse(
          response: _apiService.startedTests(
        body.page ?? 0,
        body.pageSize ?? 10,
        1,
      ));

  @override
  Future<DataState<GetSimpleTestStudentModel>> createTest(
          CreateSimpleTestStudentBody body) async =>
      await handleResponse(response: _apiService.createTest(body));

  @override
  Future<DataState<GetDirectionalTestStudentModel>> getTest(int id) async =>
      await handleResponse(response: _apiService.getTest(id));

  @override
  Future<DataState<GetCompleteSimpleTestStudentModel>> getCompleteTest(
          int id) async =>
      await handleResponse(response: _apiService.getCompleteTest(id));

  @override
  Future<DataState<AnswerSimpleTestStudentModel>> answerTest(
          AnswerBody body) async =>
      await handleResponse(
          response: _apiService.answerTest(body.questionId??0, body));

  @override
  Future<DataState> submitTest(int id) async =>
      await handleResponse(response: _apiService.submitTest(id));
}
