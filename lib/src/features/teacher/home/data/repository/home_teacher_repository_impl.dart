import 'package:school/src/core/resources/base_repository.dart';
import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/features/student/home/data/bodies/paging_body.dart';
import 'package:school/src/features/student/home/data/models/new_details_student_model.dart';
import 'package:school/src/features/student/home/data/models/news_student_model.dart';
import 'package:school/src/features/student/home/data/models/quarter_student_model.dart';
import 'package:school/src/features/student/home/data/models/time_student_model.dart';
import 'package:school/src/features/student/home/data/models/timetable_student_model.dart';
import 'package:school/src/features/teacher/home/data/bodies/record_body.dart';
import 'package:school/src/features/teacher/home/data/data_source/home_teacher_api_service.dart';
import 'package:school/src/features/teacher/home/data/models/my_record_teacher_model.dart';
import 'package:school/src/features/teacher/home/data/models/record_teacher_model.dart';
import 'package:school/src/features/teacher/home/domain/repository/home_teacher_repository.dart';

class HomeTeacherRepositoryImpl
    with BaseRepository
    implements HomeTeacherRepository {
  final HomeTeacherApiService _apiService;

  HomeTeacherRepositoryImpl(this._apiService);

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
  Future<DataState<RecordTeacherModel>> record(RecordBody body) async =>
      await handleResponse(
          response: _apiService.record(
        body.quarter ?? 0,
        body.record ?? 0,
      ));

  @override
  Future<DataState<List<MyRecordTeacherModel>>> myRecords() async =>
      await handleResponse(response: _apiService.records());
}
