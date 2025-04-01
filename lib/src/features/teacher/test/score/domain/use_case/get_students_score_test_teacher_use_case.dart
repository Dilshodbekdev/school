import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/test/score/domain/repository/score_test_teacher_repository.dart';
import 'package:school/src/features/teacher/test/simple/data/bodies/get_students_simple_test_body.dart';
import 'package:school/src/features/teacher/test/simple/data/models/get_students_simple_test_teacher_model.dart';

class GetStudentsScoreTestTeacherUseCase
    implements
        UseCase<DataState<List<GetStudentsSimpleTestTeacherModel>>,
            GetStudentsSimpleTestBody> {
  final ScoreTestTeacherRepository _repository;

  GetStudentsScoreTestTeacherUseCase(this._repository);

  @override
  Future<DataState<List<GetStudentsSimpleTestTeacherModel>>> call(
          {required GetStudentsSimpleTestBody params}) async =>
      await _repository.getStudentsTest(params);
}
