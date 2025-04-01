import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/home/data/bodies/paging_body.dart';
import 'package:school/src/features/student/test/simple/data/models/started_simple_tests_student_model.dart';
import 'package:school/src/features/student/test/simple/domain/repository/simple_test_student_repository.dart';

class CompletedSimpleTestsStudentUseCase
    implements UseCase<DataState<StartedSimpleTestsStudentModel>, PagingBody> {
  final SimpleTestStudentRepository _repository;

  CompletedSimpleTestsStudentUseCase(this._repository);

  @override
  Future<DataState<StartedSimpleTestsStudentModel>> call(
          {required PagingBody params}) async =>
      await _repository.completedTests(params);
}
