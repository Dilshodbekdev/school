import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/import_body.dart';
import 'package:school/src/features/teacher/magazine/data/models/import_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/domain/repository/magazine_teacher_repository.dart';

class ImportTeacherUseCase
    implements UseCase<DataState<ImportTeacherModel>, ImportBody> {
  final MagazineTeacherRepository _repository;

  ImportTeacherUseCase(this._repository);

  @override
  Future<DataState<ImportTeacherModel>> call(
          {required ImportBody params}) async =>
      await _repository.import(params);
}
