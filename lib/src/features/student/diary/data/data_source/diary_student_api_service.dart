import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:school/src/features/student/diary/data/models/diary_student_model.dart';
import 'package:school/src/features/student/diary/data/models/quarterly_diary_model.dart';

part 'diary_student_api_service.g.dart';

@RestApi()
abstract class DiaryStudentApiService {
  factory DiaryStudentApiService(Dio dio, {String baseUrl}) =
      _DiaryStudentApiService;

  /// URLS
  static const String _dateDiary = 'api/lessons/date-dairy';
  static const String _quarterlyDiary = 'api/lessons/student/quarterly-marks';
  static const String _yearlyDiary = 'api/lessons/student/yearly-marks';

  /// REQUESTS
  @GET(_dateDiary)
  Future<HttpResponse<List<LessonModel>>> dateDiary(
    @Query('date') String? page,
  );

  @GET(_quarterlyDiary)
  Future<HttpResponse<List<QuarterlyDiaryModel>>> quarterlyDiary(
    @Query('quarter') int quarter,
  );

  @GET(_yearlyDiary)
  Future<HttpResponse<List<QuarterlyDiaryModel>>> yearlyDiary();
}
