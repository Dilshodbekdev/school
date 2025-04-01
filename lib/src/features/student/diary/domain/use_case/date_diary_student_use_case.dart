import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/diary/data/models/diary_student_model.dart';
import 'package:school/src/features/student/diary/domain/repository/diary_student_repository.dart';

class DateDiaryStudentUseCase
    implements UseCase<DataState<List<LessonModel>>, String?> {
  final DiaryStudentRepository _repository;

  DateDiaryStudentUseCase(this._repository);

  @override
  Future<DataState<List<LessonModel>>> call(
          {required String? params}) async =>
      await _repository.dateDiary(params);
}
