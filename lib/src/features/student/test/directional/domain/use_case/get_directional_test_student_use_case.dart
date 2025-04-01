import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/test/directional/data/models/get_directional_test_student_model.dart';
import 'package:school/src/features/student/test/directional/domain/repository/directional_test_student_repository.dart';

class GetDirectionalTestStudentUseCase
    implements UseCase<DataState<GetDirectionalTestStudentModel>, int> {
  final DirectionalTestStudentRepository _repository;

  GetDirectionalTestStudentUseCase(this._repository);

  @override
  Future<DataState<GetDirectionalTestStudentModel>> call(
          {required int params}) async =>
      await _repository.getTest(params);
}
