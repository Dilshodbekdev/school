import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/test/directional/domain/repository/directional_test_teacher_repository.dart';
import 'package:school/src/features/teacher/test/iq/data/models/get_iq_test_teacher_model.dart';

class GetDirectionalTestTeacherUseCase
    implements UseCase<DataState<GetIqTestTeacherModel>, int> {
  final DirectionalTestTeacherRepository _repository;

  GetDirectionalTestTeacherUseCase(this._repository);

  @override
  Future<DataState<GetIqTestTeacherModel>> call(
          {required int params}) async =>
      await _repository.getTest(params);
}
