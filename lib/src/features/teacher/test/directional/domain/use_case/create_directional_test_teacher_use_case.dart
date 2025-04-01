import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/test/directional/domain/repository/directional_test_teacher_repository.dart';
import 'package:school/src/features/teacher/test/iq/data/bodies/create_iq_test_body.dart';

class CreateDirectionalTestTeacherUseCase
    implements
        UseCase<DataState<dynamic>, CreateIqTestBody> {
  final DirectionalTestTeacherRepository _repository;

  CreateDirectionalTestTeacherUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call(
          {required CreateIqTestBody params}) async =>
      await _repository.createTest(params);
}
