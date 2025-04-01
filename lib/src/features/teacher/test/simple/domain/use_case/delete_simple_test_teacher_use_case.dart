import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/test/simple/domain/repository/simple_test_teacher_repository.dart';

class DeleteSimpleTestTeacherUseCase
    implements UseCase<DataState<dynamic>, int> {
  final SimpleTestTeacherRepository _repository;

  DeleteSimpleTestTeacherUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call({required int params}) async =>
      await _repository.deleteSimpleTest(params);
}
