import 'package:school/src/core/resources/base_repository.dart';
import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/features/student/home/data/bodies/paging_body.dart';
import 'package:school/src/features/teacher/test/simple/data/bodies/create_simple_test_body.dart';
import 'package:school/src/features/teacher/test/simple/data/bodies/get_students_simple_test_body.dart';
import 'package:school/src/features/teacher/test/simple/data/data_source/simple_test_teacher_api_service.dart';
import 'package:school/src/features/teacher/test/simple/data/models/active_simple_tests_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/class_select_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/create_simple_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/get_simple_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/get_students_simple_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/student_results_simple_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/domain/repository/simple_test_teacher_repository.dart';

class SimpleTestTeacherRepositoryImpl
    with BaseRepository
    implements SimpleTestTeacherRepository {
  final SimpleTestTeacherApiService _apiService;

  SimpleTestTeacherRepositoryImpl(this._apiService);

  @override
  Future<DataState<ActiveSimpleTestsTeacherModel>> activeSimpleTests(
          PagingBody body) async =>
      await handleResponse(
          response: _apiService.activeSimpleTests(
        body.page ?? 0,
        body.pageSize ?? 10,
      ));

  @override
  Future<DataState<ActiveSimpleTestsTeacherModel>> completedSimpleTests(
          PagingBody body) async =>
      await handleResponse(
          response: _apiService.completedSimpleTests(
        body.page ?? 0,
        body.pageSize ?? 10,
      ));

  @override
  Future<DataState<ActiveSimpleTestsTeacherModel>> templateSimpleTests(
          PagingBody body) async =>
      await handleResponse(
          response: _apiService.templateSimpleTests(
        body.page ?? 0,
        body.pageSize ?? 10,
      ));

  @override
  Future<DataState<GetSimpleTestTeacherModel>> getSimpleTest(int id) async =>
      await handleResponse(response: _apiService.getSimpleTest(id));

  @override
  Future<DataState<List<GetStudentsSimpleTestTeacherModel>>>
      getStudentsSimpleTest(GetStudentsSimpleTestBody body) async =>
          await handleResponse(
              response: _apiService.getStudentsSimpleTest(
            body.id,
            body.classId,
          ));

  @override
  Future<DataState<StudentResultsSimpleTestTeacherModel>>
      studentResultsSimpleTest(GetStudentsSimpleTestBody body) async =>
          await handleResponse(
              response: _apiService.studentResultsSimpleTest(
            body.id,
            body.classId,
          ));

  @override
  Future<DataState<CreateSimpleTestTeacherModel>> createSimpleTest(
          CreateSimpleTestBody body) async =>
      await handleResponse(response: _apiService.createSimpleTest(body));

  @override
  Future<DataState<List<ClassSelectTeacherModel>>> classesSelect() async =>
      await handleResponse(response: _apiService.classesSelect());

  @override
  Future<DataState> deleteSimpleTest(int id) async =>
      await handleResponse(response: _apiService.deleteSimpleTest(id));

  @override
  Future<DataState<CreateSimpleTestTeacherModel>> updateSimpleTest(
          CreateSimpleTestBody body) async =>
      await handleResponse(
          response: _apiService.updateSimpleTest(body.id ?? 0, body));
}
