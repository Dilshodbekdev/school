import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/test/score/data/bodies/create_score_test_teacher_body.dart';
import 'package:school/src/features/teacher/test/score/domain/repository/score_test_teacher_repository.dart';

class CreateScoreTestTeacherUseCase
    implements
        UseCase<DataState<dynamic>, CreateScoreTestTeacherBody> {
  final ScoreTestTeacherRepository _repository;

  CreateScoreTestTeacherUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call(
          {required CreateScoreTestTeacherBody params}) async =>
      await _repository.createTest(params);
}
