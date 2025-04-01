import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/home/data/bodies/record_body.dart';
import 'package:school/src/features/teacher/home/data/models/record_teacher_model.dart';
import 'package:school/src/features/teacher/home/domain/repository/home_teacher_repository.dart';

class RecordTeacherUseCase
    implements UseCase<DataState<RecordTeacherModel>, RecordBody> {
  final HomeTeacherRepository _repository;

  RecordTeacherUseCase(this._repository);

  @override
  Future<DataState<RecordTeacherModel>> call(
          {required RecordBody params}) async =>
      await _repository.record(params);
}
