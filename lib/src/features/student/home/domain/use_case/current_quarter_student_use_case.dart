import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/home/data/models/quarter_student_model.dart';
import 'package:school/src/features/student/home/domain/repository/home_student_repository.dart';

class CurrentQuarterStudentUseCase
    implements UseCase<DataState<QuarterStudentModel>, int> {
  final HomeStudentRepository _repository;

  CurrentQuarterStudentUseCase(this._repository);

  @override
  Future<DataState<QuarterStudentModel>> call({required int params}) async =>
      await _repository.currentQuarter();
}
