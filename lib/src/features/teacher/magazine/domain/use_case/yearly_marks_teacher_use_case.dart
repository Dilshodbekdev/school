import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/magazine/data/models/yearly_marks_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/domain/repository/magazine_teacher_repository.dart';

class YearlyMarksTeacherUseCase
    implements UseCase<DataState<List<YearlyMarksTeacherModel>>, int> {
  final MagazineTeacherRepository _repository;

  YearlyMarksTeacherUseCase(this._repository);

  @override
  Future<DataState<List<YearlyMarksTeacherModel>>> call(
          {required int params}) async =>
      await _repository.yearlyMarks(params);
}
