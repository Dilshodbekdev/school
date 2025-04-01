import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/plan_body.dart';
import 'package:school/src/features/teacher/magazine/data/models/plan_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/domain/repository/magazine_teacher_repository.dart';

class PlansTeacherUseCase
    implements UseCase<DataState<List<PlanTeacherModel>>, PlanBody> {
  final MagazineTeacherRepository _repository;

  PlansTeacherUseCase(this._repository);

  @override
  Future<DataState<List<PlanTeacherModel>>> call(
          {required PlanBody params}) async =>
      await _repository.plans(params);
}
