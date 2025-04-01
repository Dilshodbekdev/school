import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:school/src/features/student/home/data/models/new_details_student_model.dart';
import 'package:school/src/features/student/home/data/models/news_student_model.dart';
import 'package:school/src/features/student/home/data/models/quarter_student_model.dart';
import 'package:school/src/features/student/home/data/models/time_student_model.dart';
import 'package:school/src/features/student/home/data/models/timetable_student_model.dart';
import 'package:school/src/features/teacher/home/data/models/my_record_teacher_model.dart';
import 'package:school/src/features/teacher/home/data/models/record_teacher_model.dart';

part 'home_teacher_api_service.g.dart';

@RestApi()
abstract class HomeTeacherApiService {
  factory HomeTeacherApiService(Dio dio, {String baseUrl}) =
      _HomeTeacherApiService;

  /// URLS
  static const String _news = 'api/news/';
  static const String _newDetails = 'api/news/{id}';
  static const String _timetables = 'api/timetable';
  static const String _times = 'api/common/lesson/select';
  static const String _quarters = 'api/common/quarters/current-year';
  static const String _currentQuarter = 'api/common/quarters/current';
  static const String _records = 'api/classes/records/my-records';
  static const String _record = 'api/lessons/statistics/record';

  /// REQUESTS
  @GET(_news)
  Future<HttpResponse<NewsStudentModel>> news(
    @Query('page') int page,
    @Query('pageSize') int pageSize,
    @Query('search') String? search,
  );

  @GET(_newDetails)
  Future<HttpResponse<NewDetailsStudentModel>> newDetails(@Path('id') int id);

  @GET(_timetables)
  Future<HttpResponse<List<TimetableStudentModel>>> timetables();

  @GET(_times)
  Future<HttpResponse<List<TimeStudentModel>>> times();

  @GET(_quarters)
  Future<HttpResponse<List<QuarterStudentModel>>> quarters();

  @GET(_currentQuarter)
  Future<HttpResponse<QuarterStudentModel>> currentQuarter();

  @GET(_records)
  Future<HttpResponse<List<MyRecordTeacherModel>>> records();

  @GET(_record)
  Future<HttpResponse<RecordTeacherModel>> record(
    @Query('quarter') int quarter,
    @Query('record') int record,
  );
}
