import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/home/data/models/my_record_teacher_model.dart';
import 'package:school/src/features/teacher/home/domain/repository/home_teacher_repository.dart';

class MyRecordsTeacherUseCase
    implements UseCase<DataState<List<MyRecordTeacherModel>>, int> {
  final HomeTeacherRepository _repository;

  MyRecordsTeacherUseCase(this._repository);

  @override
  Future<DataState<List<MyRecordTeacherModel>>> call(
          {required int params}) async =>
      await _repository.myRecords();
}
