import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/features/student/home/data/bodies/menu_weekday_body.dart';
import 'package:school/src/features/student/home/data/bodies/paging_body.dart';
import 'package:school/src/features/student/home/data/bodies/rating_body.dart';
import 'package:school/src/features/student/home/data/bodies/science_body.dart';
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

abstract class HomeStudentRepository {
  Future<DataState<NewsStudentModel>> news(PagingBody body);

  Future<DataState<NewDetailsStudentModel>> newDetails(int id);

  Future<DataState<MenuModel>> menuByWeekday(MenuWeekdayBody body);

  Future<DataState<List<ScienceStudentModel>>> sciences(ScienceBody body);

  Future<DataState<List<RatingStudentModel>>> rating(RatingBody body);

  Future<DataState<List<MenuModel>>> menu();

  Future<DataState<List<TimetableStudentModel>>> timetable();

  Future<DataState<List<TimeStudentModel>>> times();

  Future<DataState<List<QuarterStudentModel>>> quarters();

  Future<DataState<QuarterStudentModel>> currentQuarter();

  Future<DataState<List<StatisticStudentAttendanceModel>>>
      statisticStudentAttendance(int quarters);

  Future<DataState<List<StatisticStudentAppropriationModel>>>
      statisticStudentAppropriation(int quarters);
}
