import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/test/iq/data/models/get_iq_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/iq/domain/repository/iq_test_teacher_repository.dart';

class GetIqTestTeacherUseCase
    implements UseCase<DataState<GetIqTestTeacherModel>, int> {
  final IqTestTeacherRepository _repository;

  GetIqTestTeacherUseCase(this._repository);

  @override
  Future<DataState<GetIqTestTeacherModel>> call(
          {required int params}) async =>
      await _repository.getTest(params);
}
