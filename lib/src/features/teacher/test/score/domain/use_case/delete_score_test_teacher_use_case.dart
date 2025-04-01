import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/test/score/domain/repository/score_test_teacher_repository.dart';

class DeleteScoreTestTeacherUseCase
    implements UseCase<DataState<dynamic>, int> {
  final ScoreTestTeacherRepository _repository;

  DeleteScoreTestTeacherUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call({required int params}) async =>
      await _repository.deleteTest(params);
}
