import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/test/score/domain/repository/score_test_student_repository.dart';
import 'package:school/src/features/student/test/simple/data/bodies/answer_body.dart';
import 'package:school/src/features/student/test/simple/data/models/answer_simple_test_student_model.dart';

class AnswerScoreTestStudentUseCase
    implements UseCase<DataState<AnswerSimpleTestStudentModel>, AnswerBody> {
  final ScoreTestStudentRepository _repository;

  AnswerScoreTestStudentUseCase(this._repository);

  @override
  Future<DataState<AnswerSimpleTestStudentModel>> call(
          {required AnswerBody params}) async =>
      await _repository.answerTest(params);
}
