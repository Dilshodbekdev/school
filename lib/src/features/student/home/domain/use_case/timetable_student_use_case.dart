import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/home/data/models/timetable_student_model.dart';
import 'package:school/src/features/student/home/domain/repository/home_student_repository.dart';

class TimetableStudentUseCase
    implements UseCase<DataState<List<TimetableStudentModel>>, int> {
  final HomeStudentRepository _repository;

  TimetableStudentUseCase(this._repository);

  @override
  Future<DataState<List<TimetableStudentModel>>> call(
          {required int params}) async =>
      await _repository.timetable();
}
