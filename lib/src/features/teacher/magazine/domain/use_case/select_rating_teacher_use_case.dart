import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/select_rating_body.dart';
import 'package:school/src/features/teacher/magazine/domain/repository/magazine_teacher_repository.dart';

class SelectRatingTeacherUseCase
    implements UseCase<DataState<dynamic>, SelectRatingBody> {
  final MagazineTeacherRepository _repository;

  SelectRatingTeacherUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call({required SelectRatingBody params}) async =>
      await _repository.selectRating(params);
}
