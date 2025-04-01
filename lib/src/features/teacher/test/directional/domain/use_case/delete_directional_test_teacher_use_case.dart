import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/test/directional/domain/repository/directional_test_teacher_repository.dart';

class DeleteDirectionalTestTeacherUseCase
    implements UseCase<DataState<dynamic>, int> {
  final DirectionalTestTeacherRepository _repository;

  DeleteDirectionalTestTeacherUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call({required int params}) async =>
      await _repository.deleteTest(params);
}
