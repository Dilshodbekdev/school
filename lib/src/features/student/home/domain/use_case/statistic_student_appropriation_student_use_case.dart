import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/home/data/models/statistic_student_appropriation_model.dart';
import 'package:school/src/features/student/home/domain/repository/home_student_repository.dart';

class StatisticStudentAppropriationStudentUseCase
    implements
        UseCase<DataState<List<StatisticStudentAppropriationModel>>, int> {
  final HomeStudentRepository _repository;

  StatisticStudentAppropriationStudentUseCase(this._repository);

  @override
  Future<DataState<List<StatisticStudentAppropriationModel>>> call(
          {required int params}) async =>
      await _repository.statisticStudentAppropriation(params);
}