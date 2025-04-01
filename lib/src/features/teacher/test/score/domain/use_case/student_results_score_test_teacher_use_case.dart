import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/test/score/domain/repository/score_test_teacher_repository.dart';
import 'package:school/src/features/teacher/test/simple/data/bodies/get_students_simple_test_body.dart';
import 'package:school/src/features/teacher/test/simple/data/models/student_results_simple_test_teacher_model.dart';

class StudentResultsScoreTestTeacherUseCase
    implements
        UseCase<DataState<StudentResultsSimpleTestTeacherModel>,
            GetStudentsSimpleTestBody> {
  final ScoreTestTeacherRepository _repository;

  StudentResultsScoreTestTeacherUseCase(this._repository);

  @override
  Future<DataState<StudentResultsSimpleTestTeacherModel>> call(
          {required GetStudentsSimpleTestBody params}) async =>
      await _repository.studentResultsTest(params);
}
