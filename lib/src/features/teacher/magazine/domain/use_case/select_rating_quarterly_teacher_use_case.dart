import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/quarterly_marks_body.dart';
import 'package:school/src/features/teacher/magazine/domain/repository/magazine_teacher_repository.dart';

class SelectRatingQuarterlyTeacherUseCase
    implements UseCase<DataState<dynamic>, QuarterlyMarksBody> {
  final MagazineTeacherRepository _repository;

  SelectRatingQuarterlyTeacherUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call({required QuarterlyMarksBody params}) async =>
      await _repository.selectRatingQuarterly(params);
}
