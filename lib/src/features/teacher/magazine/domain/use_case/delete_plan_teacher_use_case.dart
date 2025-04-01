import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/magazine/domain/repository/magazine_teacher_repository.dart';

class DeletePlanTeacherUseCase implements UseCase<DataState<dynamic>, int> {
  final MagazineTeacherRepository _repository;

  DeletePlanTeacherUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call({required int params}) async =>
      await _repository.deletePlan(params);
}
