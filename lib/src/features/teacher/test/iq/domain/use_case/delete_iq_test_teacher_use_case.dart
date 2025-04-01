import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/test/iq/domain/repository/iq_test_teacher_repository.dart';

class DeleteIqTestTeacherUseCase
    implements UseCase<DataState<dynamic>, int> {
  final IqTestTeacherRepository _repository;

  DeleteIqTestTeacherUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call({required int params}) async =>
      await _repository.deleteTest(params);
}
