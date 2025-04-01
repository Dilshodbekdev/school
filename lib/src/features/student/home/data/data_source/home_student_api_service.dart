import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:school/src/features/student/home/data/models/menu_model.dart';
import 'package:school/src/features/student/home/data/models/new_details_student_model.dart';
import 'package:school/src/features/student/home/data/models/news_student_model.dart';
import 'package:school/src/features/student/home/data/models/quarter_student_model.dart';
import 'package:school/src/features/student/home/data/models/rating_student_model.dart';
import 'package:school/src/features/student/home/data/models/science_student_model.dart';
import 'package:school/src/features/student/home/data/models/statistic_student_appropriation_model.dart';
import 'package:school/src/features/student/home/data/models/statistic_student_attendance_model.dart';
import 'package:school/src/features/student/home/data/models/time_student_model.dart';
import 'package:school/src/features/student/home/data/models/timetable_student_model.dart';

part 'home_student_api_service.g.dart';

@RestApi()
abstract class HomeStudentApiService {
  factory HomeStudentApiService(Dio dio, {String baseUrl}) =
      _HomeStudentApiService;

  /// URLS
  static const String _news = 'api/news/';
  static const String _newDetails = 'api/news/{id}';
  static const String _menuByWeekday = 'api/restaurant/menu/by-weekday';
  static const String _menu = 'api/restaurant/menu';
  static const String _timetables = 'api/timetable';
  static const String _times = 'api/common/lesson/select';
  static const String _quarters = 'api/common/quarters/current-year';
  static const String _currentQuarter = 'api/common/quarters/current';
  static const String _statisticStudentAttendance = 'api/lessons/statistics/student/attendance';
  static const String _statisticStudentAppropriation = 'api/lessons/statistics/student/appropriation';
  static const String _sciences = 'api/classes/records/subjects-select';
  static const String _rating = 'api/lessons/statistics/rating';

  /// REQUESTS
  @GET(_news)
  Future<HttpResponse<NewsStudentModel>> news(
    @Query('page') int page,
    @Query('pageSize') int pageSize,
    @Query('search') String? search,
  );

  @GET(_newDetails)
  Future<HttpResponse<NewDetailsStudentModel>> newDetails(@Path('id') int id);

  @GET(_menuByWeekday)
  Future<HttpResponse<MenuModel>> menuByWeekday(
    @Query('weekday') int? weekday,
    @Query('order') int? order,
  );

  @GET(_sciences)
  Future<HttpResponse<List<ScienceStudentModel>>> sciences(
    @Query('type') int type,
    @Query('class_ref') int classRef,
  );

  @GET(_rating)
  Future<HttpResponse<List<RatingStudentModel>>> rating(
    @Query('quarter_number') int quarterNumber,
    @Query('science') int science,
  );

  @GET(_menu)
  Future<HttpResponse<List<MenuModel>>> menu();

  @GET(_timetables)
  Future<HttpResponse<List<TimetableStudentModel>>> timetables();

  @GET(_times)
  Future<HttpResponse<List<TimeStudentModel>>> times();

  @GET(_quarters)
  Future<HttpResponse<List<QuarterStudentModel>>> quarters();

  @GET(_currentQuarter)
  Future<HttpResponse<QuarterStudentModel>> currentQuarter();

  @GET(_statisticStudentAttendance)
  Future<HttpResponse<List<StatisticStudentAttendanceModel>>>
      statisticStudentAttendance(
    @Query('quarters') int? quarters,
  );

  @GET(_statisticStudentAppropriation)
  Future<HttpResponse<List<StatisticStudentAppropriationModel>>>
      statisticStudentAppropriation(
    @Query('quarters') int? quarters,
  );
}
