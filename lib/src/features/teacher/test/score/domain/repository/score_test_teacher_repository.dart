import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/features/student/home/data/bodies/paging_body.dart';
import 'package:school/src/features/teacher/test/iq/data/bodies/create_iq_test_body.dart';
import 'package:school/src/features/teacher/test/iq/data/models/active_iq_tests_teacher_model.dart';
import 'package:school/src/features/teacher/test/iq/data/models/get_iq_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/score/data/bodies/create_score_test_teacher_body.dart';
import 'package:school/src/features/teacher/test/score/data/models/get_score_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/bodies/get_students_simple_test_body.dart';
import 'package:school/src/features/teacher/test/simple/data/models/class_select_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/get_students_simple_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/student_results_simple_test_teacher_model.dart';

abstract class ScoreTestTeacherRepository {
  Future<DataState<ActiveIqTestsTeacherModel>> activeTests(
    PagingBody body,
  );

  Future<DataState<ActiveIqTestsTeacherModel>> completedTests(
    PagingBody body,
  );

  Future<DataState<ActiveIqTestsTeacherModel>> templateTests(
    PagingBody body,
  );

  Future<DataState<GetScoreTestTeacherModel>> getTest(int id);

  Future<DataState<dynamic>> deleteTest(int id);

  Future<DataState<dynamic>> createTest(
    CreateScoreTestTeacherBody body,
  );

  Future<DataState<dynamic>> updateTest(
      CreateScoreTestTeacherBody body,
  );

  Future<DataState<List<ClassSelectTeacherModel>>> classesSelect();

  Future<DataState<List<GetStudentsSimpleTestTeacherModel>>> getStudentsTest(
    GetStudentsSimpleTestBody body,
  );

  Future<DataState<StudentResultsSimpleTestTeacherModel>> studentResultsTest(
    GetStudentsSimpleTestBody body,
  );
}
