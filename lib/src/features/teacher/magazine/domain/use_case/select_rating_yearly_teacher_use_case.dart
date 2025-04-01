import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/yearly_marks_body.dart';
import 'package:school/src/features/teacher/magazine/domain/repository/magazine_teacher_repository.dart';

class SelectRatingYearlyTeacherUseCase
    implements UseCase<DataState<dynamic>, YearlyMarksBody> {
  final MagazineTeacherRepository _repository;

  SelectRatingYearlyTeacherUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call({required YearlyMarksBody params}) async =>
      await _repository.selectRatingYearly(params);
}
