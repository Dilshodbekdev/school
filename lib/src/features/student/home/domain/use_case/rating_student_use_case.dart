import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/home/data/bodies/rating_body.dart';
import 'package:school/src/features/student/home/data/models/rating_student_model.dart';
import 'package:school/src/features/student/home/domain/repository/home_student_repository.dart';

class RatingStudentUseCase
    implements UseCase<DataState<List<RatingStudentModel>>, RatingBody> {
  final HomeStudentRepository _repository;

  RatingStudentUseCase(this._repository);

  @override
  Future<DataState<List<RatingStudentModel>>> call(
          {required RatingBody params}) async =>
      await _repository.rating(params);
}
