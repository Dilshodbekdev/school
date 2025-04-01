import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/home/data/models/statistic_student_attendance_model.dart';
import 'package:school/src/features/student/home/domain/repository/home_student_repository.dart';

class StatisticStudentAttendanceStudentUseCase
    implements UseCase<DataState<List<StatisticStudentAttendanceModel>>, int> {
  final HomeStudentRepository _repository;

  StatisticStudentAttendanceStudentUseCase(this._repository);

  @override
  Future<DataState<List<StatisticStudentAttendanceModel>>> call(
          {required int params}) async =>
      await _repository.statisticStudentAttendance(params);
}
