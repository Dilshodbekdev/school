import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/magazine/data/models/curator_class_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/domain/repository/magazine_teacher_repository.dart';

class CuratorClassesTeacherUseCase
    implements UseCase<DataState<List<CuratorClassTeacherModel>>, int> {
  final MagazineTeacherRepository _repository;

  CuratorClassesTeacherUseCase(this._repository);

  @override
  Future<DataState<List<CuratorClassTeacherModel>>> call(
          {required int params}) async =>
      await _repository.curatorClasses();
}
