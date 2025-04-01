import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/magazine/data/models/class_record_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/domain/repository/magazine_teacher_repository.dart';

class ClassRecordsTeacherUseCase
    implements UseCase<DataState<List<ClassRecordTeacherModel>>, int> {
  final MagazineTeacherRepository _repository;

  ClassRecordsTeacherUseCase(this._repository);

  @override
  Future<DataState<List<ClassRecordTeacherModel>>> call(
          {required int params}) async =>
      await _repository.classRecords(params);
}
