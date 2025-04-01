import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/test/simple/data/bodies/get_students_simple_test_body.dart';
import 'package:school/src/features/teacher/test/simple/data/models/student_results_simple_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/domain/repository/simple_test_teacher_repository.dart';

class StudentResultsSimpleTestTeacherUseCase
    implements
        UseCase<DataState<StudentResultsSimpleTestTeacherModel>,
            GetStudentsSimpleTestBody> {
  final SimpleTestTeacherRepository _repository;

  StudentResultsSimpleTestTeacherUseCase(this._repository);

  @override
  Future<DataState<StudentResultsSimpleTestTeacherModel>> call(
          {required GetStudentsSimpleTestBody params}) async =>
      await _repository.studentResultsSimpleTest(params);
}
