import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/features/student/home/data/bodies/paging_body.dart';
import 'package:school/src/features/teacher/test/simple/data/bodies/create_simple_test_body.dart';
import 'package:school/src/features/teacher/test/simple/data/bodies/get_students_simple_test_body.dart';
import 'package:school/src/features/teacher/test/simple/data/models/active_simple_tests_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/class_select_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/create_simple_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/get_simple_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/get_students_simple_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/data/models/student_results_simple_test_teacher_model.dart';

abstract class SimpleTestTeacherRepository {
  Future<DataState<ActiveSimpleTestsTeacherModel>> activeSimpleTests(
    PagingBody body,
  );

  Future<DataState<ActiveSimpleTestsTeacherModel>> completedSimpleTests(
    PagingBody body,
  );

  Future<DataState<ActiveSimpleTestsTeacherModel>> templateSimpleTests(
    PagingBody body,
  );

  Future<DataState<GetSimpleTestTeacherModel>> getSimpleTest(int id);

  Future<DataState<dynamic>> deleteSimpleTest(int id);

  Future<DataState<CreateSimpleTestTeacherModel>> createSimpleTest(
    CreateSimpleTestBody body,
  );

  Future<DataState<CreateSimpleTestTeacherModel>> updateSimpleTest(
    CreateSimpleTestBody body,
  );

  Future<DataState<List<ClassSelectTeacherModel>>> classesSelect();

  Future<DataState<List<GetStudentsSimpleTestTeacherModel>>>
      getStudentsSimpleTest(
    GetStudentsSimpleTestBody body,
  );

  Future<DataState<StudentResultsSimpleTestTeacherModel>>
      studentResultsSimpleTest(
    GetStudentsSimpleTestBody body,
  );
}
