import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/test/simple/data/models/get_simple_test_student_model.dart';
import 'package:school/src/features/student/test/simple/domain/repository/simple_test_student_repository.dart';

class GetSimpleTestStudentUseCase
    implements UseCase<DataState<GetSimpleTestStudentModel>, int> {
  final SimpleTestStudentRepository _repository;

  GetSimpleTestStudentUseCase(this._repository);

  @override
  Future<DataState<GetSimpleTestStudentModel>> call(
          {required int params}) async =>
      await _repository.getTest(params);
}
