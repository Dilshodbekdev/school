import 'dart:io';

import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/date_marks_body.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/import_body.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/plan_body.dart';
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

abstract class MagazineTeacherRepository {
  Future<DataState<List<CuratorClassTeacherModel>>> curatorClasses();

  Future<DataState<List<ClassRecordTeacherModel>>> classRecords(
    int id,
  );

  Future<DataState<DateMarksTeacherModel>> dateMarks(
    DateMarksBody body,
  );

  Future<DataState<List<QuarterlyMarksTeacherModel>>> quarterlyMarks(
    PlanBody body,
  );

  Future<DataState<List<YearlyMarksTeacherModel>>> yearlyMarks(
    int record,
  );

  Future<DataState<dynamic>> selectRating(
    SelectRatingBody body,
  );

  Future<DataState<dynamic>> selectRatingQuarterly(
    QuarterlyMarksBody body,
  );

  Future<DataState<dynamic>> selectRatingYearly(
    YearlyMarksBody body,
  );

  Future<DataState<List<PlanTeacherModel>>> plans(
    PlanBody body,
  );

  Future<DataState<PlanTeacherModel>> updatePlan(
    UpdatePlanBody body,
  );

  Future<DataState<dynamic>> deletePlan(
    int id,
  );

  Future<DataState<List<ReadColumnTeacherModel>>> readColumns(
    File file,
  );

  Future<DataState<ImportTeacherModel>> import(ImportBody body);
}
