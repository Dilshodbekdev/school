import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/home/data/models/new_details_student_model.dart';
import 'package:school/src/features/teacher/home/domain/repository/home_teacher_repository.dart';

class NewDetailsTeacherUseCase
    implements UseCase<DataState<NewDetailsStudentModel>, int> {
  final HomeTeacherRepository _repository;

  NewDetailsTeacherUseCase(this._repository);

  @override
  Future<DataState<NewDetailsStudentModel>> call({required int params}) async =>
      await _repository.newDetails(params);
}
