import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/home/data/bodies/science_body.dart';
import 'package:school/src/features/student/home/data/models/science_student_model.dart';
import 'package:school/src/features/student/home/domain/repository/home_student_repository.dart';

class SciencesStudentUseCase
    implements UseCase<DataState<List<ScienceStudentModel>>, ScienceBody> {
  final HomeStudentRepository _repository;

  SciencesStudentUseCase(this._repository);

  @override
  Future<DataState<List<ScienceStudentModel>>> call(
          {required ScienceBody params}) async =>
      await _repository.sciences(params);
}
