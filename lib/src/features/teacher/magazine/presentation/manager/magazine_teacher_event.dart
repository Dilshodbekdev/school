part of 'magazine_teacher_bloc.dart';

abstract class MagazineTeacherEvent {}

class CuratorClassesEvent extends MagazineTeacherEvent {
  CuratorClassesEvent();
}

class ClassRecordsEvent extends MagazineTeacherEvent {
  final int id;

  ClassRecordsEvent({required this.id});
}

class DeletePlanEvent extends MagazineTeacherEvent {
  final int id;

  DeletePlanEvent({required this.id});
}

class DateMarksEvent extends MagazineTeacherEvent {
  DateMarksEvent();
}

class QuarterlyMarksEvent extends MagazineTeacherEvent {
  final PlanBody body;

  QuarterlyMarksEvent({required this.body});
}

class YearlyMarksEvent extends MagazineTeacherEvent {
  final int record;

  YearlyMarksEvent({required this.record});
}

class SelectRatingEvent extends MagazineTeacherEvent {
  final SelectRatingBody body;

  SelectRatingEvent({required this.body});
}

class SelectRatingQuarterlyEvent extends MagazineTeacherEvent {
  final QuarterlyMarksBody body;

  SelectRatingQuarterlyEvent({required this.body});
}

class SelectRatingYearlyEvent extends MagazineTeacherEvent {
  final YearlyMarksBody body;

  SelectRatingYearlyEvent({required this.body});
}

class UpdatePlanEvent extends MagazineTeacherEvent {
  final UpdatePlanBody body;

  UpdatePlanEvent({required this.body});
}

class PlansEvent extends MagazineTeacherEvent {
  final PlanBody body;

  PlansEvent({required this.body});
}

class ImportEvent extends MagazineTeacherEvent {
  final ImportBody body;

  ImportEvent({required this.body});
}

class ReadColumnsEvent extends MagazineTeacherEvent {
  final File file;

  ReadColumnsEvent({required this.file});
}

class DateMarksBodyEvent extends MagazineTeacherEvent {
  final String? date;
  final int? record;

  DateMarksBodyEvent(this.date, this.record);
}
