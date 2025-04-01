import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/test/iq/domain/repository/iq_test_student_repository.dart';
import 'package:school/src/features/student/test/simple/data/models/get_complete_simple_test_student_model.dart';

class GetCompletedIqTestStudentUseCase
    implements UseCase<DataState<GetCompleteSimpleTestStudentModel>, int> {
  final IqTestStudentRepository _repository;

  GetCompletedIqTestStudentUseCase(this._repository);

  @override
  Future<DataState<GetCompleteSimpleTestStudentModel>> call(
          {required int params}) async =>
      await _repository.getCompleteTest(params);
}
