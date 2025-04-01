import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/update_plan_body.dart';
import 'package:school/src/features/teacher/magazine/data/models/plan_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/domain/repository/magazine_teacher_repository.dart';

class UpdatePlanTeacherUseCase
    implements UseCase<DataState<PlanTeacherModel>, UpdatePlanBody> {
  final MagazineTeacherRepository _repository;

  UpdatePlanTeacherUseCase(this._repository);

  @override
  Future<DataState<PlanTeacherModel>> call(
          {required UpdatePlanBody params}) async =>
      await _repository.updatePlan(params);
}
