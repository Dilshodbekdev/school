import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/home/data/models/time_student_model.dart';
import 'package:school/src/features/student/home/domain/repository/home_student_repository.dart';

class TimesStudentUseCase
    implements UseCase<DataState<List<TimeStudentModel>>, int> {
  final HomeStudentRepository _repository;

  TimesStudentUseCase(this._repository);

  @override
  Future<DataState<List<TimeStudentModel>>> call({required int params}) async =>
      await _repository.times();
}
