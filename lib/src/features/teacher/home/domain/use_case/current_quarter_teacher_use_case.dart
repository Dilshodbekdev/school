import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/home/data/models/quarter_student_model.dart';
import 'package:school/src/features/teacher/home/domain/repository/home_teacher_repository.dart';

class CurrentQuarterTeacherUseCase
    implements UseCase<DataState<QuarterStudentModel>, int> {
  final HomeTeacherRepository _repository;

  CurrentQuarterTeacherUseCase(this._repository);

  @override
  Future<DataState<QuarterStudentModel>> call({required int params}) async =>
      await _repository.currentQuarter();
}
