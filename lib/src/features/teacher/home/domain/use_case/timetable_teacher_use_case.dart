import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/home/data/models/timetable_student_model.dart';
import 'package:school/src/features/teacher/home/domain/repository/home_teacher_repository.dart';

class TimetableTeacherUseCase
    implements UseCase<DataState<List<TimetableStudentModel>>, int> {
  final HomeTeacherRepository _repository;

  TimetableTeacherUseCase(this._repository);

  @override
  Future<DataState<List<TimetableStudentModel>>> call(
          {required int params}) async =>
      await _repository.timetable();
}
