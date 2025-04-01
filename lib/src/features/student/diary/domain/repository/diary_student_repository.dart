import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/features/student/diary/data/models/diary_student_model.dart';
import 'package:school/src/features/student/diary/data/models/quarterly_diary_model.dart';

abstract class DiaryStudentRepository {
  Future<DataState<List<LessonModel>>> dateDiary(String? date);

  Future<DataState<List<QuarterlyDiaryModel>>> quarterlyDiary(int quarter);

  Future<DataState<List<QuarterlyDiaryModel>>> yearlyDiary();
}
