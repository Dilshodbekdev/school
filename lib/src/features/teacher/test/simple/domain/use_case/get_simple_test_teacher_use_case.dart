import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/test/simple/data/models/get_simple_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/domain/repository/simple_test_teacher_repository.dart';

class GetSimpleTestTeacherUseCase
    implements UseCase<DataState<GetSimpleTestTeacherModel>, int> {
  final SimpleTestTeacherRepository _repository;

  GetSimpleTestTeacherUseCase(this._repository);

  @override
  Future<DataState<GetSimpleTestTeacherModel>> call(
          {required int params}) async =>
      await _repository.getSimpleTest(params);
}
