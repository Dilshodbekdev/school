import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/quarterly_marks_body.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/select_rating_body.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/update_plan_body.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/yearly_marks_body.dart';
import 'package:school/src/features/teacher/magazine/data/models/class_record_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/data/models/curator_class_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/data/models/date_marks_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/data/models/import_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/data/models/plan_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/data/models/quarterly_marks_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/data/models/read_column_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/data/models/yearly_marks_teacher_model.dart';

part 'magazine_teacher_api_service.g.dart';

@RestApi()
abstract class MagazineTeacherApiService {
  factory MagazineTeacherApiService(Dio dio, {String baseUrl}) =
      _MagazineTeacherApiService;

  /// URLS
  static const String _curatorClasses = 'api/classes/cls/me?curator=true';
  static const String _classRecords = 'api/classes/cls/{id}/records?short=true';
  static const String _dateMarks = 'api/lessons/date-marks';
  static const String _quarterlyMarks = 'api/lessons/quarterly-marks';
  static const String _yearlyMarks = 'api/lessons/yearly-marks';
  static const String _selectRating = 'api/lessons/marks';
  static const String _readColumns = 'api/lessons/plans/read-columns?is_list=true';
  static const String _import = 'api/lessons/plans/import';
  static const String _plans = 'api/lessons/plans';
  static const String _updatePlans = 'api/lessons/plans/{id}';

  /// REQUESTS
  @GET(_curatorClasses)
  Future<HttpResponse<List<CuratorClassTeacherModel>>> curatorClasses();

  @GET(_classRecords)
  Future<HttpResponse<List<ClassRecordTeacherModel>>> classRecords(
    @Path('id') int id,
  );

  @GET(_dateMarks)
  Future<HttpResponse<DateMarksTeacherModel>> dateMarks(
    @Query('record') int record,
    @Query('date') String date,
  );

  @GET(_quarterlyMarks)
  Future<HttpResponse<List<QuarterlyMarksTeacherModel>>> quarterlyMarks(
    @Query('record') int record,
    @Query('quarter') int quarter,
  );

  @GET(_yearlyMarks)
  Future<HttpResponse<List<YearlyMarksTeacherModel>>> yearlyMarks(
    @Query('record') int record,
  );

  @GET(_plans)
  Future<HttpResponse<List<PlanTeacherModel>>> plans(
    @Query('record') int record,
    @Query('quarter') int quarter,
  );

  @POST(_selectRating)
  Future<HttpResponse<dynamic>> selectRating(
    @Body() SelectRatingBody body,
  );

  @POST(_quarterlyMarks)
  Future<HttpResponse<dynamic>> selectRatingQuarterly(
    @Body() QuarterlyMarksBody body,
  );

  @POST(_yearlyMarks)
  Future<HttpResponse<dynamic>> selectRatingYearly(
    @Body() YearlyMarksBody body,
  );

  @PATCH(_updatePlans)
  Future<HttpResponse<PlanTeacherModel>> updatePlan(
    @Body() UpdatePlanBody body,
    @Path('id') int id,
  );

  @DELETE(_updatePlans)
  Future<HttpResponse<dynamic>> deletePlan(
    @Path('id') int id,
  );

  @POST(_readColumns)
  @MultiPart()
  Future<HttpResponse<List<ReadColumnTeacherModel>>> readColumns(
    @Part() File file,
  );

  @POST(_import)
  @MultiPart()
  Future<HttpResponse<ImportTeacherModel>> import(
    @Part() File? file,
    @Part() int number,
    @Part() int title,
    @Part() int homework,
    @Part() int record,
    @Part() int quarter,
  );
}
