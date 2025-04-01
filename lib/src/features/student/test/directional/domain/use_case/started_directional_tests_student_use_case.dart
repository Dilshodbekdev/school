import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/home/data/bodies/paging_body.dart';
import 'package:school/src/features/student/test/directional/domain/repository/directional_test_student_repository.dart';
import 'package:school/src/features/student/test/simple/data/models/started_simple_tests_student_model.dart';

class StartedDirectionalTestsStudentUseCase
    implements UseCase<DataState<StartedSimpleTestsStudentModel>, PagingBody> {
  final DirectionalTestStudentRepository _repository;

  StartedDirectionalTestsStudentUseCase(this._repository);

  @override
  Future<DataState<StartedSimpleTestsStudentModel>> call(
          {required PagingBody params}) async =>
      await _repository.startedTests(params);
}
