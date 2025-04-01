import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/home/data/models/quarter_student_model.dart';
import 'package:school/src/features/teacher/home/domain/repository/home_teacher_repository.dart';

class QuartersStudentUseCase
    implements UseCase<DataState<List<QuarterStudentModel>>, int> {
  final HomeTeacherRepository _repository;

  QuartersStudentUseCase(this._repository);

  @override
  Future<DataState<List<QuarterStudentModel>>> call(
          {required int params}) async =>
      await _repository.quarters();
}