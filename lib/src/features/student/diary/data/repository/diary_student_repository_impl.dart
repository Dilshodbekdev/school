import 'package:school/src/core/resources/base_repository.dart';
import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/features/student/diary/data/data_source/diary_student_api_service.dart';
import 'package:school/src/features/student/diary/data/models/diary_student_model.dart';
import 'package:school/src/features/student/diary/data/models/quarterly_diary_model.dart';
import 'package:school/src/features/student/diary/domain/repository/diary_student_repository.dart';

class DiaryStudentRepositoryImpl
    with BaseRepository
    implements DiaryStudentRepository {
  final DiaryStudentApiService _apiService;

  DiaryStudentRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<LessonModel>>> dateDiary(String? date) async =>
      await handleResponse(response: _apiService.dateDiary(date));

  @override
  Future<DataState<List<QuarterlyDiaryModel>>> quarterlyDiary(int quarter) async =>
      await handleResponse(response: _apiService.quarterlyDiary(quarter));

  @override
  Future<DataState<List<QuarterlyDiaryModel>>> yearlyDiary() async =>
      await handleResponse(response: _apiService.yearlyDiary());
}
