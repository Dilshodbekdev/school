import 'package:school/src/core/resources/base_repository.dart';
import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/features/student/home/data/bodies/paging_body.dart';
import 'package:school/src/features/teacher/test/directional/data/data_source/directional_test_teacher_api_service.dart';
import 'package:school/src/features/teacher/test/directional/domain/repository/directional_test_teacher_repository.dart';
import 'package:school/src/features/teacher/test/iq/data/bodies/create_iq_test_body.dart';
import 'package:school/src/features/teacher/test/iq/data/models/active_iq_tests_teacher_model.dart';
import 'package:school/src/features/teacher/test/iq/data/models/get_iq_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/bodies/get_students_simple_test_body.dart';
import 'package:school/src/features/teacher/test/simple/data/models/class_select_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/get_students_simple_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/student_results_simple_test_teacher_model.dart';

class DirectionalTestTeacherRepositoryImpl
    with BaseRepository
    implements DirectionalTestTeacherRepository {
  final DirectionalTestTeacherApiService _apiService;

  DirectionalTestTeacherRepositoryImpl(this._apiService);

  @override
  Future<DataState<ActiveIqTestsTeacherModel>> activeTests(
          PagingBody body) async =>
      await handleResponse(
          response: _apiService.activeTests(
        body.page ?? 0,
        body.pageSize ?? 10,
      ));

  @override
  Future<DataState<ActiveIqTestsTeacherModel>> completedTests(
          PagingBody body) async =>
      await handleResponse(
          response: _apiService.completedTests(
        body.page ?? 0,
        body.pageSize ?? 10,
      ));

  @override
  Future<DataState<ActiveIqTestsTeacherModel>> templateTests(
          PagingBody body) async =>
      await handleResponse(
          response: _apiService.templateTests(
        body.page ?? 0,
        body.pageSize ?? 10,
      ));

  @override
  Future<DataState<GetIqTestTeacherModel>> getTest(int id) async =>
      await handleResponse(response: _apiService.getTest(id));

  @override
  Future<DataState<List<GetStudentsSimpleTestTeacherModel>>>
      getStudentsTest(GetStudentsSimpleTestBody body) async =>
          await handleResponse(
              response: _apiService.getStudentsSimpleTest(
            body.id,
            body.classId,
          ));

  @override
  Future<DataState<StudentResultsSimpleTestTeacherModel>>
      studentResultsTest(GetStudentsSimpleTestBody body) async =>
          await handleResponse(
              response: _apiService.studentResultsSimpleTest(
            body.id,
            body.classId,
          ));

  @override
  Future<DataState<dynamic>> createTest(
          CreateIqTestBody body) async =>
      await handleResponse(response: _apiService.createTest(body));

  @override
  Future<DataState<List<ClassSelectTeacherModel>>> classesSelect() async =>
      await handleResponse(response: _apiService.classesSelect());

  @override
  Future<DataState> deleteTest(int id) async =>
      await handleResponse(response: _apiService.deleteTest(id));

  @override
  Future<DataState<dynamic>> updateTest(
          CreateIqTestBody body) async =>
      await handleResponse(
          response: _apiService.updateTest(body.id ?? 0, body));
}
