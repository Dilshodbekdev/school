import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/test/iq/domain/repository/iq_test_student_repository.dart';

class SubmitIqTestStudentUseCase
    implements UseCase<DataState<dynamic>, int> {
  final IqTestStudentRepository _repository;

  SubmitIqTestStudentUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call({required int params}) async =>
      await _repository.submitTest(params);
}
