import 'package:school/src/core/resources/base_repository.dart';
import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/features/student/home/data/bodies/menu_weekday_body.dart';
import 'package:school/src/features/student/home/data/bodies/paging_body.dart';
import 'package:school/src/features/student/home/data/bodies/rating_body.dart';
import 'package:school/src/features/student/home/data/bodies/science_body.dart';
import 'package:school/src/features/student/home/data/data_source/home_student_api_service.dart';
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
import 'package:school/src/features/student/home/domain/repository/home_student_repository.dart';

class HomeStudentRepositoryImpl
    with BaseRepository
    implements HomeStudentRepository {
  final HomeStudentApiService _apiService;

  HomeStudentRepositoryImpl(this._apiService);

  @override
  Future<DataState<NewsStudentModel>> news(PagingBody body) async =>
      await handleResponse(
          response: _apiService.news(
        body.page ?? 0,
        body.pageSize ?? 10,
        body.search,
      ));

  @override
  Future<DataState<NewDetailsStudentModel>> newDetails(int id) async =>
      await handleResponse(response: _apiService.newDetails(id));

  @override
  Future<DataState<MenuModel>> menuByWeekday(MenuWeekdayBody body) async =>
      await handleResponse(
          response: _apiService.menuByWeekday(
        body.weekday,
        body.order,
      ));

  @override
  Future<DataState<List<ScienceStudentModel>>> sciences(
          ScienceBody body) async =>
      await handleResponse(
          response: _apiService.sciences(body.type ?? 0, body.classRef ?? 0));

  @override
  Future<DataState<List<RatingStudentModel>>> rating(RatingBody body) async =>
      await handleResponse(
          response:
              _apiService.rating(body.quarterNumber ?? 0, body.science ?? 0));

  @override
  Future<DataState<List<MenuModel>>> menu() async =>
      await handleResponse(response: _apiService.menu());

  @override
  Future<DataState<List<TimetableStudentModel>>> timetable() async =>
      await handleResponse(response: _apiService.timetables());

  @override
  Future<DataState<List<TimeStudentModel>>> times() async =>
      await handleResponse(response: _apiService.times());

  @override
  Future<DataState<List<QuarterStudentModel>>> quarters() async =>
      await handleResponse(response: _apiService.quarters());

  @override
  Future<DataState<QuarterStudentModel>> currentQuarter() async =>
      await handleResponse(response: _apiService.currentQuarter());

  @override
  Future<DataState<List<StatisticStudentAttendanceModel>>>
      statisticStudentAttendance(int quarters) async => await handleResponse(
          response: _apiService.statisticStudentAttendance(quarters));

  @override
  Future<DataState<List<StatisticStudentAppropriationModel>>>
      statisticStudentAppropriation(int quarters) async => await handleResponse(
          response: _apiService.statisticStudentAppropriation(quarters));
}
