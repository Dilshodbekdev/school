import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/test/score/data/models/get_score_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/score/domain/repository/score_test_teacher_repository.dart';

class GetScoreTestTeacherUseCase
    implements UseCase<DataState<GetScoreTestTeacherModel>, int> {
  final ScoreTestTeacherRepository _repository;

  GetScoreTestTeacherUseCase(this._repository);

  @override
  Future<DataState<GetScoreTestTeacherModel>> call(
          {required int params}) async =>
      await _repository.getTest(params);
}
