import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/features/student/home/data/bodies/paging_body.dart';
import 'package:school/src/features/student/home/data/models/new_details_student_model.dart';
import 'package:school/src/features/student/home/data/models/news_student_model.dart';
import 'package:school/src/features/student/home/data/models/quarter_student_model.dart';
import 'package:school/src/features/student/home/data/models/time_student_model.dart';
import 'package:school/src/features/student/home/data/models/timetable_student_model.dart';
import 'package:school/src/features/teacher/home/data/bodies/record_body.dart';
import 'package:school/src/features/teacher/home/data/models/my_record_teacher_model.dart';
import 'package:school/src/features/teacher/home/data/models/record_teacher_model.dart';

abstract class HomeTeacherRepository {
  Future<DataState<NewsStudentModel>> news(PagingBody body);

  Future<DataState<NewDetailsStudentModel>> newDetails(int id);

  Future<DataState<List<TimetableStudentModel>>> timetable();

  Future<DataState<List<TimeStudentModel>>> times();

  Future<DataState<List<QuarterStudentModel>>> quarters();

  Future<DataState<QuarterStudentModel>> currentQuarter();

  Future<DataState<List<MyRecordTeacherModel>>> myRecords();

  Future<DataState<RecordTeacherModel>> record(RecordBody body);
}
