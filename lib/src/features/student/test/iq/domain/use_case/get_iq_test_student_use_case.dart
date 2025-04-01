import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/test/iq/domain/repository/iq_test_student_repository.dart';
import 'package:school/src/features/student/test/simple/data/models/get_simple_test_student_model.dart';

class GetIqTestStudentUseCase
    implements UseCase<DataState<GetSimpleTestStudentModel>, int> {
  final IqTestStudentRepository _repository;

  GetIqTestStudentUseCase(this._repository);

  @override
  Future<DataState<GetSimpleTestStudentModel>> call(
          {required int params}) async =>
      await _repository.getTest(params);
}
