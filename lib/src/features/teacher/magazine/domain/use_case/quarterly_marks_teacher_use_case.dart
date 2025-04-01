import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/plan_body.dart';
import 'package:school/src/features/teacher/magazine/data/models/quarterly_marks_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/domain/repository/magazine_teacher_repository.dart';

class QuarterlyMarksTeacherUseCase
    implements UseCase<DataState<List<QuarterlyMarksTeacherModel>>, PlanBody> {
  final MagazineTeacherRepository _repository;

  QuarterlyMarksTeacherUseCase(this._repository);

  @override
  Future<DataState<List<QuarterlyMarksTeacherModel>>> call(
          {required PlanBody params}) async =>
      await _repository.quarterlyMarks(params);
}
