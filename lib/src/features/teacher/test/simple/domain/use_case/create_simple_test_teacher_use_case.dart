import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/test/simple/data/bodies/create_simple_test_body.dart';
import 'package:school/src/features/teacher/test/simple/data/models/create_simple_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/domain/repository/simple_test_teacher_repository.dart';

class CreateSimpleTestTeacherUseCase
    implements
        UseCase<DataState<CreateSimpleTestTeacherModel>, CreateSimpleTestBody> {
  final SimpleTestTeacherRepository _repository;

  CreateSimpleTestTeacherUseCase(this._repository);

  @override
  Future<DataState<CreateSimpleTestTeacherModel>> call(
          {required CreateSimpleTestBody params}) async =>
      await _repository.createSimpleTest(params);
}
