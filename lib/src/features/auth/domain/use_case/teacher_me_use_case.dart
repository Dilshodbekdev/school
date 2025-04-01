import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/auth/data/models/teacher_model.dart';
import 'package:school/src/features/auth/domain/repository/auth_repository.dart';

class TeacherMeUseCase implements UseCase<DataState<TeacherModel>, int> {
  final AuthRepository _repository;

  TeacherMeUseCase(this._repository);

  @override
  Future<DataState<TeacherModel>> call({required int params}) async =>
      await _repository.meTeacher();
}
