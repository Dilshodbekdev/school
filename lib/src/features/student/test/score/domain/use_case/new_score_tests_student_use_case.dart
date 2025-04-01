import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/home/data/bodies/paging_body.dart';
import 'package:school/src/features/student/test/iq/data/models/new_iq_tests_student_model.dart';
import 'package:school/src/features/student/test/score/domain/repository/score_test_student_repository.dart';

class NewScoreTestsStudentUseCase
    implements UseCase<DataState<NewIqTestsStudentModel>, PagingBody> {
  final ScoreTestStudentRepository _repository;

  NewScoreTestsStudentUseCase(this._repository);

  @override
  Future<DataState<NewIqTestsStudentModel>> call(
          {required PagingBody params}) async =>
      await _repository.newTests(params);
}
