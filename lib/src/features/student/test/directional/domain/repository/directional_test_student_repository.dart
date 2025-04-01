import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/features/student/home/data/bodies/paging_body.dart';
import 'package:school/src/features/student/test/directional/data/models/get_directional_test_student_model.dart';
import 'package:school/src/features/student/test/iq/data/models/new_iq_tests_student_model.dart';
import 'package:school/src/features/student/test/simple/data/bodies/answer_body.dart';
import 'package:school/src/features/student/test/simple/data/bodies/create_simple_test_student_body.dart';
import 'package:school/src/features/student/test/simple/data/models/answer_simple_test_student_model.dart';
import 'package:school/src/features/student/test/simple/data/models/get_complete_simple_test_student_model.dart';
import 'package:school/src/features/student/test/simple/data/models/get_simple_test_student_model.dart';
import 'package:school/src/features/student/test/simple/data/models/started_simple_tests_student_model.dart';

abstract class DirectionalTestStudentRepository {
  Future<DataState<NewIqTestsStudentModel>> newTests(PagingBody body);

  Future<DataState<StartedSimpleTestsStudentModel>> startedTests(
    PagingBody body,
  );

  Future<DataState<StartedSimpleTestsStudentModel>> completedTests(
    PagingBody body,
  );

  Future<DataState<GetSimpleTestStudentModel>> createTest(
    CreateSimpleTestStudentBody body,
  );

  Future<DataState<GetDirectionalTestStudentModel>> getTest(
    int id,
  );

  Future<DataState<GetCompleteSimpleTestStudentModel>> getCompleteTest(
    int id,
  );

  Future<DataState<AnswerSimpleTestStudentModel>> answerTest(
    AnswerBody body,
  );

  Future<DataState<dynamic>> submitTest(
    int id,
  );
}
