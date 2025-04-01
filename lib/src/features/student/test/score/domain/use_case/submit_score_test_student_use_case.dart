import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/test/score/domain/repository/score_test_student_repository.dart';

class SubmitScoreTestStudentUseCase
    implements UseCase<DataState<dynamic>, int> {
  final ScoreTestStudentRepository _repository;

  SubmitScoreTestStudentUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call({required int params}) async =>
      await _repository.submitTest(params);
}
