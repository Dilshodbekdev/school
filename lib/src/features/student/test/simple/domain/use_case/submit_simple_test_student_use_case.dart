import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/test/simple/domain/repository/simple_test_student_repository.dart';

class SubmitSimpleTestStudentUseCase
    implements UseCase<DataState<dynamic>, int> {
  final SimpleTestStudentRepository _repository;

  SubmitSimpleTestStudentUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call({required int params}) async =>
      await _repository.submitTest(params);
}
