import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/home/data/models/time_student_model.dart';
import 'package:school/src/features/teacher/home/domain/repository/home_teacher_repository.dart';

class TimesTeacherUseCase
    implements UseCase<DataState<List<TimeStudentModel>>, int> {
  final HomeTeacherRepository _repository;

  TimesTeacherUseCase(this._repository);

  @override
  Future<DataState<List<TimeStudentModel>>> call({required int params}) async =>
      await _repository.times();
}
