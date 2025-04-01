import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/test/directional/domain/repository/directional_test_student_repository.dart';

class SubmitDirectionalTestStudentUseCase
    implements UseCase<DataState<dynamic>, int> {
  final DirectionalTestStudentRepository _repository;

  SubmitDirectionalTestStudentUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call({required int params}) async =>
      await _repository.submitTest(params);
}
