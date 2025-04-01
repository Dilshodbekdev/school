import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/test/score/domain/repository/score_test_teacher_repository.dart';
import 'package:school/src/features/teacher/test/simple/data/models/class_select_teacher_model.dart';

class ClassesSelectScoreTestTeacherUseCase
    implements UseCase<DataState<List<ClassSelectTeacherModel>>, int> {
  final ScoreTestTeacherRepository _repository;

  ClassesSelectScoreTestTeacherUseCase(this._repository);

  @override
  Future<DataState<List<ClassSelectTeacherModel>>> call(
          {required int params}) async =>
      await _repository.classesSelect();
}
