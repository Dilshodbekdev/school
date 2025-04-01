import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/test/directional/data/models/get_directional_test_student_model.dart';
import 'package:school/src/features/student/test/score/domain/repository/score_test_student_repository.dart';

class GetScoreTestStudentUseCase
    implements UseCase<DataState<GetDirectionalTestStudentModel>, int> {
  final ScoreTestStudentRepository _repository;

  GetScoreTestStudentUseCase(this._repository);

  @override
  Future<DataState<GetDirectionalTestStudentModel>> call(
          {required int params}) async =>
      await _repository.getTest(params);
}
