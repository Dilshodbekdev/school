import 'dart:io';

import 'package:school/src/core/resources/base_repository.dart';
import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/date_marks_body.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/import_body.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/plan_body.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/quarterly_marks_body.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/select_rating_body.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/update_plan_body.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/yearly_marks_body.dart';
import 'package:school/src/features/teacher/magazine/data/data_source/magazine_teacher_api_service.dart';
import 'package:school/src/features/teacher/magazine/data/models/class_record_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/data/models/curator_class_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/data/models/date_marks_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/data/models/import_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/data/models/plan_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/data/models/quarterly_marks_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/data/models/read_column_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/data/models/yearly_marks_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/domain/repository/magazine_teacher_repository.dart';

class MagazineTeacherRepositoryImpl
    with BaseRepository
    implements MagazineTeacherRepository {
  final MagazineTeacherApiService _apiService;

  MagazineTeacherRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<CuratorClassTeacherModel>>> curatorClasses() async =>
      await handleResponse(response: _apiService.curatorClasses());

  @override
  Future<DataState<List<ClassRecordTeacherModel>>> classRecords(int id) async =>
      await handleResponse(response: _apiService.classRecords(id));

  @override
  Future<DataState<DateMarksTeacherModel>> dateMarks(
          DateMarksBody body) async =>
      await handleResponse(
          response: _apiService.dateMarks(
        body.record ?? 0,
        body.date ?? '',
      ));

  @override
  Future<DataState<List<QuarterlyMarksTeacherModel>>> quarterlyMarks(
          PlanBody body) async =>
      await handleResponse(
          response: _apiService.quarterlyMarks(
        body.record ?? 0,
        body.quarter ?? 0,
      ));

  @override
  Future<DataState<List<YearlyMarksTeacherModel>>> yearlyMarks(
          int record) async =>
      await handleResponse(response: _apiService.yearlyMarks(record));

  @override
  Future<DataState> selectRating(SelectRatingBody body) async =>
      await handleResponse(response: _apiService.selectRating(body));

  @override
  Future<DataState> selectRatingQuarterly(QuarterlyMarksBody body) async =>
      await handleResponse(response: _apiService.selectRatingQuarterly(body));

  @override
  Future<DataState> selectRatingYearly(YearlyMarksBody body) async =>
      await handleResponse(response: _apiService.selectRatingYearly(body));

  @override
  Future<DataState<List<PlanTeacherModel>>> plans(PlanBody body) async =>
      await handleResponse(
          response: _apiService.plans(
        body.record ?? 0,
        body.quarter ?? 0,
      ));

  @override
  Future<DataState> deletePlan(int id) async =>
      await handleResponse(response: _apiService.deletePlan(id));

  @override
  Future<DataState<PlanTeacherModel>> updatePlan(UpdatePlanBody body) async =>
      await handleResponse(
          response: _apiService.updatePlan(body, body.id ?? 0));

  @override
  Future<DataState<List<ReadColumnTeacherModel>>> readColumns(
          File file) async =>
      await handleResponse(response: _apiService.readColumns(file));

  @override
  Future<DataState<ImportTeacherModel>> import(ImportBody body) async =>
      await handleResponse(
          response: _apiService.import(
        body.file,
        body.number,
        body.title,
        body.homework,
        body.record,
        body.quarter,
      ));
}
