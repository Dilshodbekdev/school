import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/diary/data/models/diary_student_model.dart';
import 'package:school/src/features/student/diary/data/models/quarterly_diary_model.dart';
import 'package:school/src/features/student/diary/domain/repository/diary_student_repository.dart';

class QuarterlyDiaryStudentUseCase
    implements UseCase<DataState<List<QuarterlyDiaryModel>>, int> {
  final DiaryStudentRepository _repository;

  QuarterlyDiaryStudentUseCase(this._repository);

  @override
  Future<DataState<List<QuarterlyDiaryModel>>> call(
          {required int params}) async =>
      await _repository.quarterlyDiary(params);
}
