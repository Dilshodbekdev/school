import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/date_marks_body.dart';
import 'package:school/src/features/teacher/magazine/data/models/date_marks_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/domain/repository/magazine_teacher_repository.dart';

class DateMarksTeacherUseCase
    implements UseCase<DataState<DateMarksTeacherModel>, DateMarksBody> {
  final MagazineTeacherRepository _repository;

  DateMarksTeacherUseCase(this._repository);

  @override
  Future<DataState<DateMarksTeacherModel>> call(
          {required DateMarksBody params}) async =>
      await _repository.dateMarks(params);
}
